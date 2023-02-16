// ignore_for_file: depend_on_referenced_packages

import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_auth/app/domain/usecases/user_validation_email_usecase.dart';
import 'package:ct_micro_commons_auth/app/domain/usecases/user_refresh_usecase.dart';

final $ValidateAccountController = Bind.singleton(
  (i) => ValidateAccountController(i(), i()),
);

class ValidateAccountController {
  ValidateAccountController(
    this._userValidationEmailUsecase,
    this._userRefreshUsecase,
  );

  final UserValidationEmailUsecase _userValidationEmailUsecase;
  final UserRefreshUsecase _userRefreshUsecase;

  Future<CuiaResponse> validate(String? code) async {
    if (code != null) {
      var res = await _userValidationEmailUsecase(code);
      await _userRefreshUsecase();
      return res;
    }

    return CuiaResponse(success: false, message: 'code invalid');
  }
}
