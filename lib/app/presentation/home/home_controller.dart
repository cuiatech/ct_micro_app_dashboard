// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flut_micro_commons_auth/app/domain/usecases/user_current_usecase.dart';
import 'package:flut_micro_commons_auth/app/domain/models/dtos/user_dto_dto.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';
import 'package:flut_micro_commons_auth/app/domain/usecases/user_send_validation_email_usecase.dart';
import 'package:flut_micro_commons_shared/flut_micro_commons_shared.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flutter/material.dart';

import '../../dashboard_routers.dart';

final $HomeController = Bind.singleton(
  (i) => HomeController(i(), i()),
);

class HomeController {
  HomeController(
    this._userCurrentUsecase,
    this._userSendValidationEmailUsecase,
  );

  final UserCurrentUsecase _userCurrentUsecase;
  final UserSendValidationEmailUsecase _userSendValidationEmailUsecase;

  UserDto? userDto;
  List<Map<String, dynamic>> errors = [];

  List<Map<String, dynamic>> apps = [
    {
      "title": "Syncro",
      "description": "Síncronismo de produtos nos principais e-commerces",
    },
    {
      "title": "eSaller",
      "description": "Gerenciamento de vitrine online",
    },
    {
      "title": "myDelivery",
      "description": "Gerencie pedidos, entregadores e cozinha.",
    },
  ];

  Future<void> getUser() async {
    userDto = (await _userCurrentUsecase()).data;
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
