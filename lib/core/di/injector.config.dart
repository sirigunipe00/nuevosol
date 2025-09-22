// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/data/app_repository.dart' as _i691;
import '../../app/data/app_version.dart' as _i346;
import '../../app/presentation/app_update_blocprovider.dart' as _i266;
import '../../features/auth/data/auth_repo.dart' as _i585;
import '../../features/auth/data/auth_repo_impl.dart' as _i328;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i190;
import '../../features/auth/presentation/ui/sign_in/sign_in_cubit.dart'
    as _i947;
import '../../features/gate_entry/data/gate_entry_repo.dart' as _i820;
import '../../features/gate_entry/data/gate_entry_repo_impl.dart' as _i174;
import '../../features/gate_entry/presentation/bloc/bloc_provider.dart'
    as _i210;
import '../../features/gate_entry/presentation/bloc/create_gate_entry_cubit/create_gateentry_cubit.dart'
    as _i202;
import '../../features/gate_exit/data/gate_exit_repo.dart' as _i495;
import '../../features/gate_exit/data/gate_exit_repo_impl.dart' as _i100;
import '../../features/gate_exit/presentation/bloc/bloc_provider.dart' as _i565;
import '../../features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart'
    as _i161;
import '../core.dart' as _i351;
import '../local_storage/key_vale_storage.dart' as _i1012;
import '../network/api_client.dart' as _i557;
import '../network/internet_check.dart' as _i402;
import 'injector.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.singleton<_i519.Client>(() => thirdPartyDependencies.httpClient);
    gh.singleton<_i895.Connectivity>(() => thirdPartyDependencies.connectivity);
    await gh.singletonAsync<_i655.PackageInfo>(
      () => thirdPartyDependencies.packageInfo,
      preResolve: true,
    );
    gh.singleton<_i558.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i402.InternetConnectionChecker>(
        () => _i402.InternetConnectionChecker(gh<_i895.Connectivity>()));
    gh.factory<_i1012.KeyValueStorage>(() => _i1012.KeyValueStorage(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.lazySingleton<_i346.AppVersion>(
        () => _i346.AppVersion(gh<_i655.PackageInfo>()));
    gh.factory<_i557.ApiClient>(() => _i557.ApiClient(
          gh<_i519.Client>(),
          gh<_i351.InternetConnectionChecker>(),
        ));
    gh.lazySingleton<_i585.AuthRepo>(() => _i328.AuthRepoImpl(
          gh<_i351.ApiClient>(),
          gh<_i351.KeyValueStorage>(),
        ));
    gh.lazySingleton<_i691.AppRepository>(() => _i691.AppRepository(
          gh<_i351.ApiClient>(),
          gh<_i346.AppVersion>(),
        ));
    gh.lazySingleton<_i820.GateEntryRepo>(
        () => _i174.GateEntryRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i495.GateExitRepo>(
        () => _i100.GateExitRepoImpl(gh<_i351.ApiClient>()));
    gh.factory<_i947.SignInCubit>(
        () => _i947.SignInCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i190.AuthCubit>(() => _i190.AuthCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i202.CreateGateEntryCubit>(
        () => _i202.CreateGateEntryCubit(gh<_i820.GateEntryRepo>()));
    gh.lazySingleton<_i210.GateEntryBlocProvider>(
        () => _i210.GateEntryBlocProvider(gh<_i820.GateEntryRepo>()));
    gh.lazySingleton<_i565.GateExitBlocProvider>(
        () => _i565.GateExitBlocProvider(gh<_i495.GateExitRepo>()));
    gh.factory<_i161.CreateGateExitCubit>(
        () => _i161.CreateGateExitCubit(gh<_i495.GateExitRepo>()));
    gh.lazySingleton<_i266.AppUpdateBlocprovider>(
        () => _i266.AppUpdateBlocprovider(gh<_i691.AppRepository>()));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i811.ThirdPartyDependencies {}
