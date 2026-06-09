import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/core/cubit/base/filters_cubit.dart';
import 'package:nuevosol/core/model/page_view_filters.dart';
import 'package:nuevosol/features/auth/model/logged_in_user.dart';

class EmployeeFilters extends FiltersCubit {
  EmployeeFilters()
      : super(
          PageViewFilters(
            status: _defaultStatus(),
            //  department: _defaultDepartment(),
          ),
        );

  static String _defaultStatus() {
  final userRole = $sl.get<LoggedInUser>();

  final issecurity = userRole.role!.any((e) {
    final role = e.toString().toLowerCase();

    return role.contains('nepl-unit-1-gate') ||
        role.contains('nepl-unit-2-gate') ||
        role.contains('nmpl-unit-1-gate') ||
        role.contains('nmpl-unit-2-gate') ||
        role.contains('head office gate');
  });

  final isHod = userRole.role!.any(
    (e) => e.toString().toLowerCase().contains('hod (hr)'),
  );

  if (isHod) {
    return 'Pending For Approval';
  }

  if (issecurity) {
    return 'Approved';
  }

  return 'Draft';
}

  @override
  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }
//   static String? _defaultDepartment() {
//   final user = $sl.get<LoggedInUser>();

//   final isHod = user.role!.any(
//     (e) => e.toString().toLowerCase().contains('hod (hr)'),
//   );

//   if (isHod) {
//     return user.department; 
//   }

//   return null;
// }
  void onChangeDepartment(String? department) {
  emitSafeState(
    state.copyWith(
      department: department,
    ),
  );
}

  @override
void onSearch([String? query]) {
  if (query.doesNotHaveValue) {
    emitSafeState(
      PageViewFilters(
        status: state.status,
        department: state.department,
      ),
    );
  } else {
    emitSafeState(
      state.copyWith(query: query),
    );
  }
}
}