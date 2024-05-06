import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/data/models/user_db_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Exception, UserEntity>> completeProfile(String email);

  Future<Either<Exception, UserDbModel>> getUser();

  Future<Either<Exception, UserDbModel>> saveUser(UserDbModel user);

  Future<Either<Exception, UserDbModel>> updateUser(UserDbModel user);

  Future<Either<Exception, bool>> deleteUser();
}