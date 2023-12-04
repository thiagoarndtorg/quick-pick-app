import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/orders/application/orders_controller.dart';
import 'package:quick_pick_app/src/features/orders/data/model/order_model.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/status_card_app.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  OrdersController _ordersController = OrdersController();
  List<OrderModel> _ordersList = [];
  @override
  void initState() {
    _ordersController.getOrders().then((value) {
      setState(() {
        _ordersList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 45),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: appColorLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _ordersList.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {
                        OrderModel item = _ordersList[index];
                        return StatusCardApp(orderModel: item);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
