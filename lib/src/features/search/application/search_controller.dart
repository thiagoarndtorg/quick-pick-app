import 'package:quick_pick_app/src/features/search/data/repositories/search_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

class SearchController {
  SearchController();
  final _restaurantRepository = SearchRepository();
  Future<List<RestaurantModel>> getRestaurants() async {
    return await _restaurantRepository.getRestaurants();
  }
}
