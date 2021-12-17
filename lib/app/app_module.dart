import 'package:flutter_modular/flutter_modular.dart';

import 'app_routes.dart';
import 'modules/login/presenter/login_page.dart';
import 'modules/login/presenter/login_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $LoginStore,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.login, child: (ctx, _) => const LoginPage()),
      ];
}
