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
    getData();
  }

  Future<void> getData() async {
    setState(() => controller.loading = true);
    await controller.getUser();
    await controller.getMyApps();
    controller.getErrors(context);
    setState(() => controller.loading = false);
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
            if (controller.loading)
              Skeleton(
                isLoading: controller.loading,
                skeleton: SkeletonItem(
                  child: DashboardBodyList.loading(12),
                ),
                child: Container(),
              )
            else if (controller.apps.isEmpty)
              const DashboardBodyEmpty()
            else
              DashboardBodyList(apps: controller.apps)
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
