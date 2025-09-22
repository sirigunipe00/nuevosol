import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _AppRoutePaths {
  static const initial = '/';
  static const login = '/login';
  static const home = '/home';
  static const gateEntry = '/home/gateentry';
  static const newGateEntry = '/home/gateentry/newGateEntry';
  static const newGateEntryPreview = '/home/gateentry/newGateEntry/preview';
  static const gateExit = '/home/gateexit';
  static const newGateExit = '/home/gateexit/newGateExit';
  static const newGateExitPreview = '/home/gateexit/newGateExit/preview';
  static const gateRegistration = '/home/gateRegistration';
  static const newGateRegistration = '/home/gateRegistration/newGateRegistration';
  static const newGateRegistrationPreview ='/home/gateRegistration/newGateRegistration/preview';
  static const dipatchGaylord ='/home/dispatchGaylord';
  static const dispatchGaylordPreview = '/home/dispatchGaylord/dispatchGaylordPreview';
  static const poApprovalList = '/home/poapprovallist';
  static const poApprovalListPreview ='/home/poapprovallist/poApprovalListPreview';
  static const dashboards = '/home/dashboards';
  static const dashboardView = '/home/dashboards/view';
  static const account = '/account';
}

enum AppRoute {
  initial(_AppRoutePaths.initial),
  login(_AppRoutePaths.login),
  home(_AppRoutePaths.home),
  gateEntry(_AppRoutePaths.gateEntry),
  newGateEntry(_AppRoutePaths.newGateEntry),
  newGateEntryPreview(_AppRoutePaths.newGateEntryPreview),
  gateExit(_AppRoutePaths.gateExit),
  newGateExit(_AppRoutePaths.newGateExit),
  newGateExitPreview(_AppRoutePaths.newGateExitPreview),
  gateRegistration(_AppRoutePaths.gateRegistration),
  newGateRegistration(_AppRoutePaths.newGateRegistration),
  newGateRegistrationPreview(_AppRoutePaths.newGateRegistrationPreview),
  dipatchGaylord(_AppRoutePaths.dipatchGaylord),
  dispatchGaylordPreview(_AppRoutePaths.dispatchGaylordPreview),
  poApprovalList(_AppRoutePaths.poApprovalList),
  poApprovalListPreview(_AppRoutePaths.poApprovalListPreview),
  dashboards(_AppRoutePaths.dashboards),
  dashboardView(_AppRoutePaths.dashboardView),

  account(_AppRoutePaths.account);

  const AppRoute(this.path);
  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {Object? extra}) {
    context.go(path, extra: extra);
  }

  void goNamed(BuildContext context, {Object? extra}) {
    context.goNamed(path, extra: extra);
  }

  Future<T?> push<T>(BuildContext context, {Object? extra}) async {
    return await context.push(path, extra: extra);
  }
}
