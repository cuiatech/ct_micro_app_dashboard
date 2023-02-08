// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flut_micro_app_dashboard/app/dashboard_routers.dart';
import 'package:flut_micro_app_dashboard/app/presentation/validate_account/validate_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flut_micro_app_help_center/app/presentation/help_center_widget/help_center_widget.dart';
import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class ValidateAccountPage extends StatefulWidget {
  const ValidateAccountPage({
    this.code,
    super.key,
  });

  final String? code;

  @override
  State<ValidateAccountPage> createState() => _ValidateAccountPageState();
}

class _ValidateAccountPageState extends State<ValidateAccountPage> {
  final controller = Modular.get<ValidateAccountController>();

  bool activated = false;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() => loading = true);
      var res = await controller.validate(widget.code);

      if (res.success) {
        activated = true;
      } else {
        activated = false;
      }

      setState(() => loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CuiaAppBar(),
      body: Center(
        child: loading
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!activated)
                    Text(
                      "Não foi possível ativar sua conta, link inválido.",
                      style: GoogleFonts.poppins(
                        color: const Color(0xff393d6e),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (activated)
                    Text(
                      "Sua conta foi ativada com sucesso.",
                      style: GoogleFonts.poppins(
                        color: const Color(0xff393d6e),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 9),
                  CuiaButtons.link(
                    "Voltar para home",
                    onTap: DashboardRouters.goToIndex,
                  ),
                ],
              ),
      ),
      endDrawer: const Drawer(
        backgroundColor: Colors.white,
        width: 500,
        child: HelpCenterWidget(),
      ),
    );
  }
}
