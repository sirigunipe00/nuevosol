import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:nuevosol/features/auth/presentation/ui/sign_in/sign_in_cubit.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_entry/presentation/bloc/gate_entry_filter.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:nuevosol/styles/material_theme.dart';


class FrappeApp extends StatelessWidget {
  const FrappeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider<SignInCubit>(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(create: (_) => GateExitFilterCubit()),
      
        BlocProvider(
          create: (_) => GateEntryBlocProvider.get().fetchGateEntries()),
        BlocProvider(
          create: (_) => GateExitBlocProvider.get().fetchGateExit()),
        BlocProvider(
          create: (_) => GateEntryBlocProvider.get().fetchPONumbers()),
        BlocProvider(create: (_) => GateExitBlocProvider.get().salesInvoiceList()),
        // BlocProvider(create: (_) => DispatchBlocProvider.get().fetchGaylords()),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          final routerCtxt = AppRouterConfig.parentNavigatorKey.currentContext!;
          state.maybeWhen(
            orElse: () => AppRoute.initial.go(routerCtxt),
            // loading: () => AppRoute.initial.go(routerCtxt),
            authenticated: () {
              final filters = Pair(StringUtils.docStatusInt('Draft'), null);

              routerCtxt
                ..cubit<GateEntriesCubit>().fetchInitial(filters)
                ..cubit<GateExitCubit>().fetchInitial(filters)
                ..cubit<PurchaseOrders>().request('')
                ..cubit<SalesInvoiceList>().request('');
                // ..cubit<GateRegistrationsCubit>().fetchInitial(PageListFilters.initial())
                // ..cubit<DispatchCubit>().fetchInitial(PageListFilters.initial())
                // ..cubit<PoApprovalCubit>().fetchInitial(PageListFilters.initial());
              AppRoute.home.go(routerCtxt);
            },
            unAuthenticated: () => AppRoute.login.go(routerCtxt),
          );
        },
        
          child: MaterialApp.router(
            title: 'Nuevosol',
            theme: AppMaterialTheme.lightTheme,
            darkTheme: AppMaterialTheme.lightTheme,
            routerConfig: AppRouterConfig.router,
            debugShowCheckedModeBanner: false,

          
        ),
      ),
    );
  }
}
