
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/cubit/base/filters_cubit.dart';
import 'package:nuevosol/core/model/page_view_filters.dart';

class PoApprovalFiltersCubit extends FiltersCubit {
  PoApprovalFiltersCubit() : super(PageViewFilters.initial());

  @override
  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  @override
  void onSearch([String? query]) {
    if(query.doesNotHaveValue) {
      emitSafeState(PageViewFilters(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}

