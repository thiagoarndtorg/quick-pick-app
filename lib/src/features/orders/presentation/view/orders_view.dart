import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/status_card_app.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text('Fila'),
                ),
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
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20);
                      },
                      itemBuilder: (context, index) {
                        return StatusCardApp();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          ButtonApp(
            backgroundColor: appColorGreen,
            title: 'Fazer pedido',
            textColor: appColorWhite,
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
