import 'package:quick_pick_app/src/features/search/data/models/menu_model.dart';
import 'package:quick_pick_app/src/features/search/data/repositories/search_repository.dart';

class SearchController {
  SearchController();
  final _restaurantRepository = SearchRepository();
  Future<List<MenuModel>> getRestaurants() async {
    return await _restaurantRepository.getRestaurants();
  }
}
