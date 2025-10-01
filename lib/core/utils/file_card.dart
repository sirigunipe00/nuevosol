import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/utils/bloc_extension.dart';
import 'package:nuevosol/core/utils/page_not_found_page.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/styles/app_color.dart';
import 'package:nuevosol/widgets/app_error_widget.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';
import 'package:nuevosol/widgets/loading_indicator.dart';
import 'package:nuevosol/widgets/simple_app_bar.dart';
import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FileCard extends StatelessWidget {
  const FileCard({super.key, required this.report, required this.filename});

  final String report;
  final String filename;
  @override
  Widget build(BuildContext context) {
    final fileName = basename(report);
    final isImage = extension(fileName).isImage;
    final isPdf = extension(fileName).isDocument;
    return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        leading: isImage
            ? const Icon(Icons.image, color: AppColors.dashboard)
            : const Icon(Icons.description_outlined, color: AppColors.red),
        tileColor: AppColors.dashboardWhite,
        title: Text(fileName),
        trailing: SizedBox(
            width: 95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: isImage || isPdf ?
                     () {
                      if (isImage) {
                        context.goToPage(
                            ReportsViewer(urls: [report], title: fileName));
                      } else if (isPdf) {
                        context.goToPage(
                            PdfViewerPage.pdfViewerPageMethod(context, report));
                      } else {
                        context.goToPage(
                            ReportsViewer(urls: [report], title: fileName));
                      }
                    } : null,
                    child: Icon(Icons.visibility, size: 20, color: isImage || isPdf ?  AppColors.hightbar : AppColors.grey)),
                const SizedBox(width: 12),
                BlocConsumer<MultiFileDownloadCubit, MultiFileDownloadState>(
                  listener: (context, state) {
                    state.handle(
                      context,
                      success: (_) => AppDialog.showSuccessDialog(
                        onTapDismiss: () => context.exit(),
                        context,
                        content: 'Files Downloaded Successfully',
                      ),
                    );
                  },
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          final reqInp = Pair(fileName, [report]);
                          context.cubit<MultiFileDownloadCubit>().request(reqInp);
                        },
                        child: state.isLoading
                            ? SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
                            : const Icon(Icons.download,size: 20, color: AppColors.hightbar));
                  },
                )
              ],
            )));
  }
}

class ReportsViewer extends StatelessWidget {
  const ReportsViewer({super.key, required this.urls, required this.title});

  final String title;
  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    print('file url: ---:$urls');
    return Scaffold(
      appBar: SimpleAppBar(title: title),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            heroAttributes: PhotoViewHeroAttributes(tag: 'Image $index'),
            imageProvider: NetworkImage(urls[index]),
            initialScale: PhotoViewComputedScale.contained * 0.8,
          );
        },
        itemCount: urls.length,
        loadingBuilder: (context, event) => Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key, required this.url});
  final String url;

  static Widget pdfViewerPageMethod(BuildContext ctx, String url) {
    return BlocProvider(
      create: (context) =>
          PoApprovalBlocProvider.get().loadPDFCubit()..request(url),
      child: PdfViewerPage(
        url: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (url.isNotValidName) {
      return const PageNotFoundWidget();
    }
    return BlocBuilder<LoadPDF, LoadPDFState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const LoadingIndicator(),
          loading: () => const LoadingIndicator(),
          failure: (message) {
            return AppErrorWidget(error: message.error, onRefresh: () {});
          },
          success: (pdfData) {
            return Column(
              children: [
                Expanded(child: PDFView(pdfData: pdfData)),
              ],
            );
          },
        );
      },
    );
  }
}
