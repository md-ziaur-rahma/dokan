import 'package:dartz/dartz.dart';
import 'package:dokan/app/core/shared_preference.dart';
import 'package:dokan/app/data/data_source/remote_data_source.dart';
import 'package:dokan/app/data/error/exception.dart';
import 'package:dokan/app/data/error/failure.dart';
import 'package:dokan/app/module/login/model/user_login_response_model.dart';
import 'package:dokan/main.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserLoginResponseModel>> login(
      Map<String, dynamic> body);
  Future<Either<Failure, String>> userRegister(Map<String, dynamic> body);

  /// store user login response in sharedPreferences
  Either<Failure, bool> saveCashedUserInfo(
      UserLoginResponseModel userLoginResponseModel);

  /// get user login response from sharedPreferences
  Either<Failure, UserLoginResponseModel> getCashedUserInfo();

  Either<Failure, bool> userLogout();
}

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  /// Login
  @override
  Future<Either<Failure, UserLoginResponseModel>> login(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.signIn(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  /// Register
  @override
  Future<Either<Failure, String>> userRegister(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.userRegister(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Either<Failure, bool> saveCashedUserInfo(
      UserLoginResponseModel userLoginResponseModel) {
    try {
      sharedPreferences.setString(MySharedPreference.cachedUserResponseKey, userLoginResponseModel.toRawJson());
      return const Right(true);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Either<Failure, UserLoginResponseModel> getCashedUserInfo() {
    try {
      final jsonString =
      sharedPreferences.getString(MySharedPreference.cachedUserResponseKey);
      if (jsonString != null) {
        return Right(UserLoginResponseModel.fromRawJson(jsonString));
      } else {
        return const Left(DatabaseFailure("Not cached yet"));
      }
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Either<Failure, bool> userLogout() {
    try {
      sharedPreferences.remove(MySharedPreference.cachedUserResponseKey);
      return const Right(true);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}