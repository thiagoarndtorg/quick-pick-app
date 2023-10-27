import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/domain/user_model.dart';
import 'package:quick_pick_app/src/utils/common/mixins/user_hive_mixin.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with UserHiveMixin {
  TextEditingController userName = TextEditingController();
  TextEditingController userTelephone = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  UserModel? userModel;

  @override
  void initState() {
    userModel = getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    runSpacing: 10,
                    children: [
                      Container(
                        child: CircleAvatar(
                          minRadius: 60,
                          backgroundColor: appColorDescription,
                          child: Icon(
                            FeatherIcons.user,
                            color: appColorWhite,
                            size: 30,
                          ),
                        ),
                      ),
                      Text(
                        userModel != null ? userModel!.name ?? '' : '',
                        textScaleFactor: 1.6,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
              ButtonApp(
                backgroundColor: Colors.red,
                title: 'Sair da Conta',
                textColor: appColorWhite,
                onPressed: () async {
                  removeUserData();
                  await context.router.replaceNamed('/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
