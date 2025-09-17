// import 'package:injectable/injectable.dart';

// import 'package:nuevosol/app/data/app_repo.dart';
// import 'package:nuevosol/app/model/otp_inp.dart';
// import 'package:nuevosol/core/cubit/network_request/network_request_cubit.dart';
// import 'package:nuevosol/core/di/injector.dart';

// typedef ResendOTPCubit = NetworkRequestCubit<bool, OTPInput>;
// typedef ResendOTPCubitState = NetworkRequestState<bool>;

// @lazySingleton
// class AppBlocProvider {
//   const AppBlocProvider({required this.repo});

//   final AppRepo repo;

//   static AppBlocProvider get() => $sl.get<AppBlocProvider>();
  
//   ResendOTPCubit resendOTPCubit() => ResendOTPCubit(
//     onRequest: (params, state) => repo.sendOTP(params!),
//   );
// }