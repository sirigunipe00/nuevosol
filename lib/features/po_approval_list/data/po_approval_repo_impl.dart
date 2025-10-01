import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive_io.dart';
import 'package:dartz/dartz.dart';
import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';
import 'package:nuevosol/features/po_approval_list/data/po_approval_repo.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval_attachments.dart';
import 'package:nuevosol/features/po_approval_list/model/po_order_items.dart';

@LazySingleton(as: PoApprovalRepo)
class PoApprovalRepoImpl extends BaseApiRepository implements PoApprovalRepo {
  const PoApprovalRepoImpl(super.client);

  @override
  AsyncValueOf<List<PoApprovalForm>> getPurchaseOrders(
      int start, String status, String? search) async {
    final requestConfig = RequestConfig(
      url: Urls.getPurchaseOrders,
      parser: (json) {
        final data = json['message'];
        if (data is Map<String, dynamic>) {
          return [PoApprovalForm.fromJson(data)];
        } else {
          final listdata = data as List<dynamic>;
          final listItems =
              listdata.map((e) => PoApprovalForm.fromJson(e)).toList();
          if (status == 'Rejected') {
            final rejItems = listItems.map(
              (e) => e.copyWith(status: 'Rejected'),
            );
            return rejItems.toList();
          }
          return listItems;
        }
      },
      reqParams: {
        if (search != null && search.isNotEmpty && search.length >= 2) ...{
          'order_id': search,
        },
        'limit_start': start.toString(),
        'status': status,
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<PoOrderItemsForm>> getPoOrderItems(String name) async {
    final requestConfig = RequestConfig(
      url: Urls.getPoOrderItems,
      parser: (json) {
        final data = json['message']['message'] as List<dynamic>;
        return data.map((e) => PoOrderItemsForm.fromJson(e)).toList();
      },
      reqParams: {'order_id': name},
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<bool> userPermission(String name) async {
    final requestConfig = RequestConfig(
      url: Urls.userPermission,
      parser: (json) {
        return json['message']['can_approve'] as bool;
      },
      reqParams: {'order_id': name},
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<None> approvePOButton(String orderiD, String action) async {
    print('action====:$action');
    final config = RequestConfig(
        url: Urls.approvePO,
        parser: (json) => json,
        reqParams: {'order_id': orderiD, 'action': action});

    final response = await get(config);
    return response.process((docNo) {
      return right(const None());
    });
  }

  @override
  AsyncValueOf<None> rejectPOButton(
      String orderiD, String reason, String action) async {
    final config = RequestConfig(
        url: Urls.approvePO,
        parser: (json) {
          return json;
        },
        reqParams: {'order_id': orderiD, 'reason': reason, 'action': action});

    final response = await get(config);
    return response.process((docNo) {
      return right(const None());
    });
  }

  @override
  AsyncValueOf<List<PoApprovalAttachments>> poApprovalAttachments(
      String poApprovalAttachment) async {
    final config = RequestConfig(
        url: Urls.poApprovalAttachments,
        parser: (json) {
          final data = json['message']['attachments'] as List<dynamic>;
          return data.map((e) => PoApprovalAttachments.fromJson(e)).toList();
        },
        reqParams: {'po_name': poApprovalAttachment});
    print('config---------- $config');
    final response = await get(config);
    print('response---------- $response');
    return response.process((r) {
      return right(r.data ?? []);
    });
  }

  @override
  AsyncValueOf<Uint8List> loadPDF(String url) async {
    final uri = Uri.tryParse(url);
    final hasHost = uri != null && uri.hasAuthority;

    final parsedUrl = hasHost ? url : Urls.filepath(url);
    log('loadPDF----:$hasHost');

    return await executeSafely(() async {
      final res = await _requestFileData(parsedUrl);
      return right(res);
    });
  }

  Future<Uint8List> _requestFileData(String url) async {
    final fileBytes = await client.downloadFile(url);
    return fileBytes;
  }

  @override
  AsyncValueOf<None> downloadFiles(String name, List<String> urls) async {
    return await executeSafely(() async {
      final archive = Archive();
      for (final url in urls) {
        final fileBytes = await _requestFileData(url);
        final fileName = StringUtils.getFileNameFromUrl(url);
        final archiveFile = ArchiveFile(fileName, fileBytes.length, fileBytes);
        log('archiveFile----:$archiveFile');
        archive.addFile(archiveFile);
      }
      final zipData = ZipEncoder().encode(archive);
      final zipFile = File('/storage/emulated/0/Download/$name.zip');
      if (zipFile.existsSync()) zipFile.deleteSync();
      zipFile.createSync();
      await zipFile.writeAsBytes(zipData);
      return right(const None());
    });
  }
  
 
}
