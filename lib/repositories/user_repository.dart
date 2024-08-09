import 'package:local_grocery/models/login_response_main.dart';
import 'package:local_grocery/providers/request/generic_request.dart';
import 'package:local_grocery/providers/services/user_service_provider.dart';
import 'package:local_grocery/support/config/app_utils.dart';
import 'package:local_grocery/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  final _loginProvider = UserServiceProvider();
  Future<LoginResponseMain?> login(
    GenericRequest genericRequest,
  ) async {
    if (await AppUtils().isConnectedToNetwork()) {
      return await _loginProvider.loginService(genericRequest: genericRequest);
    }
    return LoginResponseMain();
  }
}
