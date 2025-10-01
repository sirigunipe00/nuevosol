import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:nuevosol/core/cubit/network_request/network_request_cubit.dart';
import 'package:nuevosol/core/di/injector.dart';
import 'package:nuevosol/core/model/page_view_filters.dart';
import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/features/po_approval_list/data/po_approval_repo.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval_attachments.dart';
import 'package:nuevosol/features/po_approval_list/model/po_order_items.dart';

typedef PoApprovalCubit = InfiniteListCubit<PoApprovalForm, PageViewFilters, PageViewFilters>;
typedef PoApprovalCubitState = InfiniteListState<PoApprovalForm>;

typedef PurchaseOrderLines = NetworkRequestCubit<List<PoOrderItemsForm>, String>;
typedef PurchaseOrderLinesState = NetworkRequestState<List<PoOrderItemsForm>>;

typedef ApprovePOCubit = NetworkRequestCubit<None, Pair<String,String>>;
typedef ApprovePOState = NetworkRequestState<None>;

typedef RejectPOCubit = NetworkRequestCubit<None, Tuple3<String ,String,String>>;
typedef RejectPOState = NetworkRequestState<None>;

typedef POPermissionCubit = NetworkRequestCubit<bool, String>;
typedef POPermissionState = NetworkRequestState<bool>;


typedef PoApprovalAttachmentsCubit = NetworkRequestCubit<List<PoApprovalAttachments>, String>;
typedef PoApprovalAttachmentsState = NetworkRequestState<List<PoApprovalAttachments>>;


typedef LoadPDF = NetworkRequestCubit<Uint8List, String>;
typedef LoadPDFState = NetworkRequestState<Uint8List>;

typedef MultiFileDownloadCubit = NetworkRequestCubit<None, Pair<String, List<String>>>;
typedef MultiFileDownloadState = NetworkRequestState<None>;


@lazySingleton
class PoApprovalBlocProvider {
  const PoApprovalBlocProvider(this.repo);

  final PoApprovalRepo repo;

  static PoApprovalBlocProvider get() => $sl.get<PoApprovalBlocProvider>();

  PoApprovalCubit fetchPurchaseOrders() => PoApprovalCubit(
    requestInitial: (params, state) =>
      repo.getPurchaseOrders(0, params!.status, params.query),
    requestMore: (params, state) => repo.getPurchaseOrders(
      state.curLength + 1, params!.status, params.query),
  );

  PurchaseOrderLines fetchPoOrderItems() => PurchaseOrderLines(
    onRequest: (params, __) => repo.getPoOrderItems(params!),
  );

  ApprovePOCubit approvePO() => ApprovePOCubit(
    onRequest: (params, state) => repo.approvePOButton(params!.first,params.second),
  );

  RejectPOCubit rejectPO() => RejectPOCubit(
    onRequest:(params, state) => repo.rejectPOButton(params!.value1, params.value2,params.value3),
  );
  
  POPermissionCubit poPermissionCubit() => POPermissionCubit(
    onRequest: (params, _) => repo.userPermission(params!),
  );

   PoApprovalAttachmentsCubit poAttchmentsCubit() => PoApprovalAttachmentsCubit(
    onRequest: (params,_) => repo.poApprovalAttachments( params!));


      LoadPDF loadPDFCubit() => LoadPDF(
        onRequest: (params, _) => repo.loadPDF(params!),
      );



  MultiFileDownloadCubit downloadFiles() => MultiFileDownloadCubit(
        onRequest: (params, _) =>
            repo.downloadFiles(params!.first, params.second),
      );
}
