import 'package:flut_micro_commons_dependencies/flut_micro_commons_dependencies.dart';

class DashboardRouters {
  static goToIndex() => Modular.to.navigate('/dashboard${RoutersName.index}');
}

class RoutersName {
  static String index = "/";
}
