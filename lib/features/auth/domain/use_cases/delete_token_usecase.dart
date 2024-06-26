import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/core/usecase/usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/auth/domain/repositories/token_repository.dart';

class DeleteTokenUseCase implements UseCase<bool, void> {
  final TokenRepository _tokenRepository = locator<TokenRepository>();
  @override
  Future<Either<Exception, bool>> call(void params) async {
    return await _tokenRepository.deleteToken();
  }
}