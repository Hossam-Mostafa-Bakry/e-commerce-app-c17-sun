import 'package:ecommerce_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {

  /// Data Source
  final AuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);

  @override
  Future<void> singIn() async {
    /// data ?????
    _authDataSource.signIn();
  }

}