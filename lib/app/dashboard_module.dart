// ignore_for_file: depend_on_referenced_packages

import 'package:ct_micro_app_dashboard/app/dashboard_routers.dart';
import 'package:ct_micro_app_dashboard/app/presentation/home/home_controller.dart';
import 'package:ct_micro_app_dashboard/app/presentation/validate_account/validate_account_controller.dart';
import 'package:ct_micro_app_dashboard/app/presentation/validate_account/validate_account_page.dart';
import 'package:ct_micro_commons_dependencies/ct_micro_commons_dependencies.dart';

import 'presentation/home/home_page.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    // Controllers
    $HomeController,
    $ValidateAccountController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      RoutersName.index,
      child: (_, args) => const HomePage(),
      transition: TransitionType.noTransition,
    ),
    ChildRoute(
      RoutersName.validate,
      child: (_, args) => ValidateAccountPage(code: args.queryParams['code']),
      transition: TransitionType.noTransition,
    ),
  ];
}
