// ignore_for_file: depend_on_referenced_packages

import 'package:flut_micro_app_dashboard/app/presentation/home/widgets/body_list.dart';
import 'package:flutter/material.dart';
import 'package:flut_micro_commons_ds/flut_micro_commons_ds.dart';
import 'package:flut_micro_app_help_center/app/presentation/help_center_widget/help_center_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    var apps = [
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
    return Scaffold(
      key: key,
      appBar: const CuiaAppBar(),
      body: DashboardBodyList(apps: apps),
      endDrawer: const Drawer(
        backgroundColor: Colors.white,
        width: 500,
        child: HelpCenterWidget(),
      ),
    );
  }
}
