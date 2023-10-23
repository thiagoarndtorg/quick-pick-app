import "package:auto_route/auto_route.dart";
import 'package:quick_pick_app/routes/utils/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RegisterMain.page, path: '/register'),
        AutoRoute(page: LoginMain.page, path: '/login'),
        AutoRoute(page: BottomNavigationMain.page, initial: true, path: '/', guards: [
          AuthGuard()
        ], children: [
          AutoRoute(page: HomeMain.page, path: 'home'),
          AutoRoute(page: OrdersMain.page, path: 'orders'),
          AutoRoute(page: SearchMain.page, path: 'search'),
          AutoRoute(page: ProfileMain.page, path: 'profile'),
        ]),
        AutoRoute(page: RestaurantMain.page, path: '/restaurant'),
      ];
}


//rodar o build runner, mudar pra import dps de rodar o comando e tirar o _ do approuter,
// dps disso é só adicionar as telas com as routes, com o @RouterPage la e rodar o build dnv 