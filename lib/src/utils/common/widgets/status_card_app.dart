import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_pick_app/src/features/orders/data/model/order_model.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/enums/orderStatus.dart';

class StatusCardApp extends StatefulWidget {
  OrderModel orderModel;
  StatusCardApp({super.key, required this.orderModel});

  @override
  State<StatusCardApp> createState() => _StatusCardAppState();
}

class _StatusCardAppState extends State<StatusCardApp> {
  String orderStatus = "";
  late OrderStatusEnum value;
  late IconData icon;
  late String description;
  late Color iconColor;
  @override
  void initState() {
    value = OrderStatusEnum.values[widget.orderModel.orderStatus!];
    switch (value) {
      case OrderStatusEnum.NONE:
        orderStatus = "";
        icon = FeatherIcons.xCircle;
        description = "";
        iconColor = Colors.red;
        break;
      case OrderStatusEnum.PENDING:
        orderStatus = "Aguardando";
        icon = FeatherIcons.clock;
        description = "Em aguardo";
        iconColor = Colors.blue;
        break;
      case OrderStatusEnum.PREPARING:
        orderStatus = "Em andamento";
        icon = FeatherIcons.activity;
        description = "Quase lá!";
        iconColor = Colors.yellow;
        break;
      case OrderStatusEnum.READY:
        orderStatus = "Pronto";
        icon = FeatherIcons.checkCircle;
        description = "Pedido pronto!";
        iconColor = Colors.green;
        break;
      case OrderStatusEnum.DELIVERED:
        orderStatus = "Entregue";
        icon = FeatherIcons.truck;
        description = "Pedido entregue!";
        iconColor = Color(0xFF145416);
        break;
      case OrderStatusEnum.CANCELED:
        orderStatus = "Cancelado";
        icon = FeatherIcons.xCircle;
        description = "Pedido cancelado";
        iconColor = Colors.red;
        break;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            runSpacing: 10,
            spacing: 8,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.orderModel.restaurant!.name!,
                    textScaleFactor: 1.2,
                    style: TextStyle(color: appColorTitle, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    textScaleFactor: 0.8,
                    style: TextStyle(color: appColorDescription),
                  ),
                ],
              ),
            ],
          ),
          Text(
            orderStatus,
            style: TextStyle(fontWeight: FontWeight.bold, color: iconColor),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 65,
    );
  }
}
