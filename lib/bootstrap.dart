import 'dart:async';
import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/consts/urls.dart';
import 'package:nuevosol/core/di/injector.dart';
import 'package:nuevosol/core/logger/app_logger.dart';
import 'package:nuevosol/firebase_options.dart';

Future<void> bootstrap(void Function() runApp) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await configureDependencies(env: Environment.prod);

    if (kDebugMode) {
      await register<Urls>(Urls.local(), instanceName: 'baseUrl');
    } else {
      await register<Urls>(Urls.local(), instanceName: 'baseUrl');
    }

    await Firebase.initializeApp(
        name: 'nuevosol', options: DefaultFirebaseOptions.android);

    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        try {
          final List<dynamic> errorAndStacktrace = pair as List<dynamic>;
          await FirebaseCrashlytics.instance.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last as StackTrace,
          );
        } on Exception catch (e, st) {
          $logger.error('[Running isolate error]', e, st);
        }
      }).sendPort,
    );

    runApp();
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
