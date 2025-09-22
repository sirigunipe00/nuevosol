import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';

class AppIcons {
  static const basePath = 'assets';
  static const imagesPath = '$basePath/images';
  static const iconsPath = '$basePath/icons';

  static const htplLogo = AppIcon('$basePath/htpl_revised_logo.png');

  static const bubbles = AppIcon('$imagesPath/bubbles.svg');
  static const bgFrame1 = AppIcon('$basePath/bg_frame_1.png');
  static const bgFrame2 = AppIcon('$basePath/bg_frame_2.png');
  static const bgFrame3 = AppIcon('$basePath/bg_frame3.png');
  static const bgFrame4 = AppIcon('$basePath/bg_frame4.png');
  static const bgFrame5 = AppIcon('$basePath/bg_frame5.png');
  static const bgFrame6 = AppIcon('$basePath/bg_frame6.png');
  static const helloCuate = AppIcon('$basePath/hello_cuate.svg');
  static const settingsCuate = AppIcon('$basePath/settings_cuate.svg');

  static const vechileEntry = AppIcon('$basePath/vehicle_entry.png');
  static const gateEntryCurves = AppIcon('$basePath/gate_entry_1.png');
  static const vehcileExit = AppIcon('$basePath/vehicle_exit.png');
  static const gateExitCurves = AppIcon('$basePath/gate_exit_1.png');
  static const registration = AppIcon('$basePath/registration.png');
  static const registrations = AppIcon('$basePath/registrations.png');
  static const dispatch = AppIcon('$basePath/dispatch_1.png');
  static const poApproval = AppIcon('$basePath/approval_logo.png');
  static const dashboards = AppIcon('$basePath/dashboard_logo.png');
  static const gayLord = AppIcon('$basePath/dashboard.png');
  static const approval = AppIcon('$basePath/approval.png');
}

class AppIcon {
  const AppIcon(this.path);

  final String path;

  Widget toWidget({
    double width = 30,
    double height = 30,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    final fileextension = extension(path);
    if(fileextension == '.svg') {
      return SvgPicture.asset(path, width: width, height: height,   colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null, fit: fit); 
    }
    return Image.asset(path, width: width, height: height, color: color, fit: fit);
  }
}