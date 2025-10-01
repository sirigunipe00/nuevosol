import 'package:flutter/material.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/widgets/dailogs/app_dialogs.dart';


extension NetworkRequestStateExtension<T> on NetworkRequestState<T> {
  bool get isSuccess => maybeWhen(orElse: () => false, success: (_) => true);
  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);
  bool get isFailure => maybeWhen(orElse: () => false, failure: (f) => true);

  void onSuccess(void Function(T data) callback) {
    maybeWhen(
      orElse: () {},
      success: callback,
    );
  }

  void handle(BuildContext context, {required void Function(T data) success}) {
    maybeWhen(
      orElse: () {},
      success: success,
      failure: (f) {
        AppDialog.showErrorDialog(context,
            content: f.error, onTapDismiss: context.exit);
      },
    );
  }
}
