import 'package:nuevosol/core/core.dart';

import 'package:nuevosol/app/model/otp_inp.dart';
import 'package:nuevosol/core/utils/typedefs.dart';

abstract interface class AppRepo {
  AsyncValueOf<bool> sendOTP(OTPInput inp);
    // AsyncValueOf<bool> isAppUpdateAvailable();
}