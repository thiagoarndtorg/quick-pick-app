import "package:auto_route/auto_route.dart";

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginMain.page, initial: true, path: '/login')
      ];
}


//rodar o build runner, mudar pra import dps de rodar o comando e tirar o _ do approuter,
// dps disso é só adicionar as telas com as routes, com o @RouterPage la e rodar o build dnv 