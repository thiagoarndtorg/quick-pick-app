import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';

import 'package:quick_pick_app/src/features/restaurant/data/repositories/restaurant_repository.dart';
import 'package:quick_pick_app/src/utils/common/domain/restaurant_model.dart';

class RestaurantController {
  RestaurantController();
  final _restaurantRepository = RestaurantRepository();

  Future<List<FoodModel>> getFoods(String id) async {
    return await _restaurantRepository.getFoods(id);
  }

  Future<RestaurantModel> getRestaurant(String id) async {
    return await _restaurantRepository.getRestaurant(id);
  }
}
