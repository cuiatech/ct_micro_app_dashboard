import 'package:ct_micro_commons_auth/app/domain/usecases/user_current_usecase.dart';
import 'package:ct_micro_commons_auth/app/domain/models/dtos/user_dto_dto.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';
import 'package:ct_micro_commons_auth/app/domain/usecases/user_send_validation_email_usecase.dart';
import 'package:ct_micro_commons_shared/ct_micro_commons_shared.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';
import 'package:flutter/material.dart';

import '../../dashboard_routers.dart';
import 'package:ct_micro_commons_core_app/app/domain/usecases/get_my_apps_usecase.dart';

final $HomeController = Bind.singleton(
  (i) => HomeController(i(), i(), i()),
);

class HomeController {
  HomeController(
    this._userCurrentUsecase,
    this._userSendValidationEmailUsecase,
    this._getMyAppsUsecase,
  );

  final UserCurrentUsecase _userCurrentUsecase;
  final UserSendValidationEmailUsecase _userSendValidationEmailUsecase;
  final GetMyAppsUsecase _getMyAppsUsecase;

  bool loading = false;

  UserDto? userDto;
  List<Map<String, dynamic>> errors = [];

  List<AppDto> apps = <AppDto>[];

  Future<void> getUser() async {
    userDto = (await _userCurrentUsecase()).data;
  }

  Future<List<AppDto>> getMyApps() async {
    var res = await _getMyAppsUsecase();
    return apps = res.data;
  }

  void getErrors(BuildContext context) {
    // email validate
    if (userDto?.emailVerifiedAt == null) {
      errors.add({
        "type": "warning",
        "message":
            "Valide sua conta clicando no link de confirmação que enviamos para você no e-mail.",
        "actions": [
          {
            "value": "Reenviar e-mail",
            "onTap": () async {
              var res = await resend();
              if (!res.success) {
                CuiaToast.error(res.message ?? 'Error', context: context);
                return res;
              }

              CuiaToast.success('E-mail enviado', context: context);
              return res;
            },
          },
        ],
      });
    }
  }

  Future<CuiaResponse> resend() async {
    return await _userSendValidationEmailUsecase(
      '${Uri.base.origin}${RoutersName.validate}',
    );
  }
}
