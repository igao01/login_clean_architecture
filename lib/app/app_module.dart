import 'package:flutter_modular/flutter_modular.dart';

import 'app_routes.dart';
import 'modules/login/presenter/pages/login_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.login, child: (ctx, _) => const LoginPage()),
      ];
}
