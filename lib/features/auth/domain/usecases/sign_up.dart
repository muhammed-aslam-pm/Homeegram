import 'package:dartz/dartz.dart';
import 'package:homeegram/core/errors/failures.dart';
import 'package:homeegram/features/auth/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp({required this.repository});

  Future<Either<Failure, void>> call(String profileName, String homeeId) async {
    return await repository.siginUpWithProfileNameAndId(profileName, homeeId);
  }
}
