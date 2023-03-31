// ignore_for_file: depend_on_referenced_packages, must_be_immutable, use_build_context_synchronously

import 'package:ct_micro_app_dashboard/app/presentation/home/home_controller.dart';
import 'package:ct_micro_app_dashboard/app/presentation/home/widgets/body_empty.dart';
import 'package:ct_micro_app_dashboard/app/presentation/home/widgets/body_list.dart';
import 'package:flutter/material.dart';
import 'package:ct_micro_commons_ds/ct_micro_commons_ds.dart';
import 'package:ct_micro_app_help_center/app/presentation/help_center_widget/help_center_widget.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';

import 'widgets/error_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getUser();
      controller.getErrors(context);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CuiaAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: controller.errors
                  .map((e) => ErrorMessageWidget(
                        type: e['type'],
                        message: e['message'],
                        actions: e['actions'],
                      ))
                  .toList(),
            ),
            FutureBuilder(
              future: controller.getApps(context),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Skeleton(
                      isLoading: true,
                      skeleton: SkeletonItem(
                        child: DashboardBodyList.loading(12),
                      ),
                      child: Container(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return DashboardBodyList(apps: controller.apps);
                    }
                    return const DashboardBodyEmpty();
                  default:
                    return const DashboardBodyEmpty();
                }
              },
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
