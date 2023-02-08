// ignore_for_file: depend_on_referenced_packages

import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class DashboardRouters {
  static goToIndex() => Modular.to.navigate(RoutersName.index);
  static goToValidateAccount() => Modular.to.navigate(RoutersName.validate);
}

class RoutersName {
  static String index = "/";
  static String validate = "/validate_account";
}
