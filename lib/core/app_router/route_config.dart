import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nuevosol/app/presentation/app_profile_page.dart';
import 'package:nuevosol/app/widgets/image_preview_scrn.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/app/presentation/app_home_page.dart';
import 'package:nuevosol/app/presentation/app_splash_scrn.dart';
import 'package:nuevosol/app/presentation/app_update_blocprovider.dart';
import 'package:nuevosol/app/widgets/app_scaffold_widget.dart';
import 'package:nuevosol/features/auth/presentation/ui/authentication_scrn.dart';
import 'package:nuevosol/features/gate_entry/model/gate_entry.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/create_gate_entry_cubit/create_gateentry_cubit.dart';
import 'package:nuevosol/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:nuevosol/features/gate_entry/presentation/ui/gate_entry_list/gate_entry_list.dart';
import 'package:nuevosol/features/gate_exit/model/gate_exit.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:nuevosol/features/gate_exit/presentation/ui/create/new_gate_exit.dart';
import 'package:nuevosol/features/gate_exit/presentation/ui/gate_exit_list/gate_exit_list.dart';
import 'package:nuevosol/features/po_approval_list/model/po_approval.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/details/po_approval_form_widget.dart';
import 'package:nuevosol/features/po_approval_list/presentation/ui/po_approval_list/po_approval_list.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.initial.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.initial.path,
        builder: (_, state) => const AppSplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder: (_, state) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) =>
                            AppUpdateBlocprovider.get().appversionCubit()
                              ..request(),
                      ),
                    ],
                    child: const AppHomePage(),
                  );
                },
                routes: [
                  GoRoute(
                  path: _getPath(AppRoute.gateEntry),
                    builder: (ctxt, state) {
                      final filters = Pair(  StringUtils.docStatusInt('Draft'), null,);
                      return BlocProvider(
                        create:
                            (context) => GateEntryBlocProvider.get().fetchGateEntries()..fetchInitial(filters),
                        child: const GateEntryListScrn(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateEntry),
                        builder: (ctxt, state) {
                          final provider = GateEntryBlocProvider.get();
                          // final name = state.extra as String?;
                          final form = state.extra as GateEntry?;
                          
                          return MultiBlocProvider(
                            providers: [
                              // if (name.isNull) ...[
                              //   BlocProvider(
                              //       create: (_) => provider.getDetails()),
                              // ] else ...[]
                                BlocProvider(
                                    create: (_) =>
                                        provider.supplietList()..request('')),
                               BlocProvider(
                                  create: (_) =>
                                      provider.fetchPONumbers()..request(form?.name ?? '')),
                              BlocProvider(
                                  create: (_) => $sl.get<CreateGateEntryCubit>()..initDetails(form)),
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newGateEntryPreview),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.gateExit),
                   builder: (ctxt, state) {
                      final filters = Pair( StringUtils.docStatusInt('Draft'),null,);
                      return BlocProvider(create:
                            (context) => GateExitBlocProvider.get().fetchGateExit()..fetchInitial(filters),
                        child: const GateExitListScrn(),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateExit),
                        builder: (_, state) {
                          final provider = GateExitBlocProvider.get();
                          final form = state.extra as GateExit?;
                          return MultiBlocProvider(
                            providers: [
                              // if (name.isNull) ...[
                              //   BlocProvider(
                              //       create: (_) => provider.getDetails()),
                              // ] else ...[
                              //   BlocProvider(
                              //       create: (_) =>
                              //           provider.getDetails()..request(name!)),
                              // ],
                              BlocProvider(
                                  create: (_) => provider.salesInvoiceList()..request(form?.name ?? '')),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateGateExitCubit>()..initDetails(form)),
                            ],
                            child: const NewGateExit(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newGateExitPreview),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.gateRegistration),
                  //   builder: (ctxt, state) {
                  //     return const GateRegistrationListScrn();
                  //   },
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.newGateRegistration),
                  //       builder: (_, state) {
                  //         final blocprovider =
                  //             GateRegistrationBlocProvider.get();
                  //         return MultiBlocProvider(
                  //           providers: [
                  //             BlocProvider(
                  //                 create: (_) =>
                  //                     blocprovider.employeeList()..request()),
                  //             BlocProvider(
                  //               create: (_) => $sl.get<GateRegistrationCubit>()
                  //                 ..initDetails(state.extra),
                  //             ),
                  //           ],
                  //           child: const NewGateRegistration(),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  // GoRoute(
                  //     path: _getPath(AppRoute.dipatchGaylord),
                  //     builder: (ctxt, state) {
                  //       return const DispatchGaylordList();
                  //     },
                  //     routes: [
                  //       GoRoute(
                  //         path: _getPath(AppRoute.dispatchGaylordPreview),
                  //         builder: (_, state) {
                  //           final form = state.extra as GaylordForm;
                  //           final blocprovider = DispatchBlocProvider.get();
                  //           return MultiBlocProvider(
                  //             providers: [
                  //               BlocProvider(
                  //                 create: (_) =>
                  //                     blocprovider.fetchGaylordItems()
                  //                       ..request(form.name),
                  //               ),
                  //               BlocProvider(
                  //                   create: (_) =>
                  //                       blocprovider.updateGaylord()),
                  //               BlocProvider(
                  //                 create: (_) => blocprovider.removeGaylord(),
                  //               ),
                  //               BlocProvider(
                  //                   create: (_) =>
                  //                       blocprovider.submitGaylord()),
                  //             ],
                  //             child: DispatchGaylordFormWidget(
                  //               form: form,
                  //             ),
                  //           );
                  //         },
                  //       )
                  //     ]),
                  GoRoute(
                    path: _getPath(AppRoute.poApprovalList),
                    builder: (ctxt, state) => const PoApprovalListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.poApprovalListPreview),
                        builder: (_, state) {
                          final form = state.extra as PoApprovalForm;
                          final blocprovider = PoApprovalBlocProvider.get();
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (_) => blocprovider.fetchPoOrderItems()
                                  ..request(form.name),
                              ),
                              BlocProvider(
                                  create: (_) => blocprovider.rejectPO()),
                              BlocProvider(
                                  create: (_) => blocprovider.approvePO()),
                              BlocProvider(
                                  create: (_) => blocprovider.poAttchmentsCubit()..request(form.name)),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.poPermissionCubit()
                                        ..request(form.name)),
                            ],
                            child: PoApprovalFormWidegt(form: form),
                          );
                        },
                      ),
                    ],
                  ),
                  // GoRoute(
                  //   path: _getPath(AppRoute.dashboards),
                  //   builder: (ctxt, state) => BlocProvider(
                  //     create: (_) =>
                  //         DashboardBlocProvider.get().dashboardsCubit()
                  //           ..request(),
                  //     child: const DashboardsListScrn(),
                  //   ),
                  //   routes: [
                  //     GoRoute(
                  //       path: _getPath(AppRoute.dashboardView),
                  //       builder: (_, state) {
                  //         final mastr = state.extra as DashboardMaster;
                  //         final provider = DashboardBlocProvider.get();
                  //         return BlocProvider(
                  //           create: (_) => provider.dashboardURLCubit()
                  //             ..request(mastr.name),
                  //           child: DashboardWebview(
                  //               name: mastr.name, title: mastr.title),
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.account.path,
                builder: (_, __) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static String _getPath(AppRoute route) => route.path.split('/').last;
}
