import 'dart:io';

import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String title;
  final String message;

  const AppException({
    required this.title,
    required this.message,
  });

  static AppException from(Object exception) {
    // if (exception is FirebaseAuthException) {
    //   switch (exception.code) {
    //     case 'weak-password':
    //       return const WeakPasswordException();
    //     case 'INVALID_LOGIN_CREDENTIALS':
    //       return const WrongCredentialsException();
    //     case 'invalid-credential':
    //       return const WrongCredentialsException();
    //     case 'too-many-requests':
    //       return const WrongCredentialsException();
    //     case 'email-already-in-use':
    //       return const EmailAlreadyInUseException();
    //     case 'network-request-failed':
    //       return const NoInternetException();
    //     case 'requires-recent-login':
    //       return const RequiresRecentLoginException();
    //     default:
    //       return const UnknownException();
    //   }
    // }

    if (exception is AppException) return exception;

    if (exception is DioException) {
      if (exception.error is SocketException) {
        return const NoInternetException();
      }
    }

    return const UnknownException();
  }
}

class UnknownException extends AppException {
  const UnknownException()
      : super(
          title: 'Erreur',
          message: 'Une erreur est survenue',
        );
}

class NoInternetException extends AppException {
  const NoInternetException()
      : super(
          title: 'Pas de connexion',
          message: 'Veuillez vérifier votre connexion internet.',
        );
}
