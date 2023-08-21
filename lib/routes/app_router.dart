import "package:auto_route/auto_route.dart";

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [];
}


//rodar o build runner, mudar pra import dps de rodar o comando e tirar o _ do approuter,
// dps disso é só adicionar as telas com as routes, com o @RouterPage la e rodar o build dnv 