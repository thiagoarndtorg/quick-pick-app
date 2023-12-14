import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:quick_pick_app/routes/app_router.gr.dart';
import 'package:quick_pick_app/src/features/food/application/food_controller.dart';
import 'package:quick_pick_app/src/features/food/data/model/food_model.dart';

import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/mixins/image_data_mixin.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';

class FoodView extends StatefulWidget {
  final FoodModel foodModel;
  const FoodView({super.key, required this.foodModel});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> with ImageDataMixin {
  var paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColorBackground,
        resizeToAvoidBottomInset: true,
        appBar: AppBarApp(onBackPressed: () => context.router.pop()),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.foodModel.foodImage ?? "", fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: 70,
                    height: 70,
                  );
                }),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodModel.foodName ?? "",
                      textScaleFactor: 2.5,
                      style: TextStyle(
                        color: appColorTitle,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.foodModel.foodDescription ?? "",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: appColorDescription),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "R\$ ${widget.foodModel.foodPrice != null ? widget.foodModel.foodPrice.toString() : ""}",
                      textScaleFactor: 3,
                      style: TextStyle(color: appColorRed, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  await makePayment();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appColorRed,
                  ),
                  child: Center(
                    child: Text(
                      "Realizar pedido",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  FoodController _foodController = FoodController();
  Future<void> makePayment() async {
    try {
      paymentIntent = await _foodController.createPaymentIntent(
          widget.foodModel.foodPrice != null ? widget.foodModel.foodPrice!.floor().toString() : "100", 'brl');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'], //Gotten from payment intent

                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {
    log("asdas");
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        await _foodController.orderFood(widget.foodModel);
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}
