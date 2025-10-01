import 'package:nuevosol/core/cubit/base/base_cubit.dart';
import 'package:nuevosol/core/model/page_view_filters.dart';

abstract class PageViewFiltersCubit extends AppBaseCubit<PageViewFilters> {
  PageViewFiltersCubit(super.state);

  void onChangeStatus(String status);

  void onSearch([String? query]);
}