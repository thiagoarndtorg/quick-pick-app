import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';
import 'package:quick_pick_app/src/utils/common/dio_client.dart';

class FoodRepository {
  DioClient dio = DioClient();

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  Future<dynamic> makePayment(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': "card",
      };

      //This token should be at an environment variable

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OJgk3AriEpYdydkhkQcnHi21MITDviQyYNPDKtKVbf4851pK6UnEvoUqU4H5SfyNXzANOUhgEUeMlmxix4ErkUs00Urciwiyn',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> orderFood(FoodModel foodModel, int userId) async {
    try {
      var data = {
        "foodId": foodModel.foodId,
        "restaurantId": foodModel.restaurantId,
        "userId": userId,
      };

      await dio.defaultDio().post('Order/orderwfood', data: data);
      log('Pedido realizado com sucesso!');

      return;
    } catch (e) {
      log('Erro ao resgatar comidas');
      throw Exception(e);
    }
  }
}
