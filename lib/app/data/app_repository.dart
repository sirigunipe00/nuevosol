import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/app/data/app_version.dart';
import 'package:nuevosol/core/core.dart';


@lazySingleton
class AppRepository extends BaseApiRepository {
  AppRepository(super.client, this.appVersion);

  final AppVersion appVersion;

  Future<Either<Failure, bool>> isAppUpdateAvailable() async {
    final requestConfig = RequestConfig(
      url: Urls.appVersion,
      parser: (p0) {
        log('p0000...:$p0');
        return p0;
      },
    );
    final response = await post(requestConfig, includeAuthHeader: false);

    return await response.processAsync((r) async {
      final responseData = r.data!;
      final data = responseData['data'];

      if (data['status'] == 400) {
        return left(Failure(error: data['message']));
      }
      final serverVersion = data['app_version'] ?? '';
      final appVersionStr = await appVersion.getAppVersion();
      $logger..devLog('APPVERSION:$appVersionStr')
      ..devLog('SERVER VERSION:$serverVersion');
     /*  if (appVersionStr.compareTo(serverVersion) < 0) {
        return right(true);
      }
      return right(false);*/

      bool updateRequired = isUpdateRequired(appVersionStr, serverVersion);

      if (updateRequired) {
        return right(true);
      } else {
        return right(false);
      }
    }); 
  }
}
bool isUpdateRequired(String appVersion, String serverVersion) {
  List<int> appParts = appVersion.split('.').map(int.parse).toList();
  List<int> serverParts = serverVersion.split('.').map(int.parse).toList();

  for (int i = 0; i < serverParts.length; i++) {
    int app = (i < appParts.length) ? appParts[i] : 0;
    int server = serverParts[i];

    if (app < server) return true; // app is older → update needed
    if (app > server) return false; // app is newer → no update needed
  }
  return false; // equal versions
}
