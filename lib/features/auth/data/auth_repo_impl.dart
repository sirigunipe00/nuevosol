import 'dart:convert';
import 'dart:io';

import 'package:nuevosol/core/core.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/auth/data/auth_repo.dart';
import 'package:nuevosol/features/auth/model/logged_in_user.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends BaseApiRepository implements AuthRepo {
  const AuthRepoImpl(super.client, this.storage);

  final KeyValueStorage storage;

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = await storage.getSecureString(LocalKeys.user);
      return (user.containsValidValue && json.decode(user!) is Map);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not check for persisted user', e, st);
      return false;
    }
  }

  @override
  AsyncValueOf<LoggedInUser> logIn(String username, String pswd) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.getUsers,
        parser: (res) {
          final message = res['message'] as Map<String, dynamic>;
          final data = message['data'] as List<dynamic>;

          final userData = Map<String, dynamic>.from(
            data.first as Map<String, dynamic>,
          );

          // Merge top-level roles into the user object
          userData['roles'] = message['roles'];

          return LoggedInUser.fromJson(userData);
        },
        // parser: (res) {
        //   final data = res['message']['data'] as List<dynamic>;
        //   return LoggedInUser.fromJson(data.first);
        // },
        body: jsonEncode({'usr': username, 'pwd': pswd}),
      );

      final response = await post(requestConfig, includeAuthHeader: false);

      return response.processAsync((r) async {
        if (r.data.isNull) {
          return Errors.invalidUser.asFailure();
        }
        final userWithPswd = r.data!.copyWith(password: pswd);
        await _persistUser(userWithPswd);
        await storage.setString(LocalKeys.apiKey, userWithPswd.apiKey);
        await storage.setString(LocalKeys.apiSecret, userWithPswd.apiSecret);
        return right(userWithPswd);
      });
    });
  }

  Future<Either<Failure, bool>> _persistUser(LoggedInUser user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await storage.setSecureString(LocalKeys.user, userJson);

      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<LoggedInUser> getPersistedUser() async {
    try {
      final userSource = await storage.getSecureString(LocalKeys.user);
      if (userSource.doesNotHaveValue) {
        return left(const Failure(error: 'No user details found'));
      }
      final userData = jsonDecode(userSource!) as Map<String, dynamic>;
      final user = LoggedInUser.fromJson(userData);
      return right(user);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not get persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<bool> signOut() async {
    try {
      await storage.clearAllValues();
      await storage.clearAllSecureValues();
      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not sign out user', e, st);
      return left(const Failure(error: 'Could not sign out'));
    }
  }

  @override
  AsyncValueOf<Pair<String, String>> forgotPassword(String email) async {
    final config = RequestConfig(
      url: Urls.forgotPassword,
      body: jsonEncode({'user': email}),

      parser: (json) {
        final serverMessages = json['_server_messages'] as String;

        final decodedMessages = jsonDecode(serverMessages) as List;

        final messageData =
            jsonDecode(decodedMessages.first as String) as Map<String, dynamic>;

        return Pair(
          messageData['title'] as String,
          messageData['message'] as String,
        );
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(config, includeAuthHeader: false);

    return response.process((r) => right(r.data!));
  }
}
