import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController userName = TextEditingController();
  TextEditingController userTelephone = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
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
                        'Taiga da Silva',
                        textScaleFactor: 1.6,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    runSpacing: 15,
                    children: [
                      TextFieldApp(
                        title: 'Nome do usuário',
                        icon: FeatherIcons.user,
                        inputType: TextInputType.text,
                        controller: userName,
                      ),
                      TextFieldApp(
                        title: 'Telefone do usuário',
                        icon: FeatherIcons.phone,
                        inputType: TextInputType.text,
                        controller: userName,
                      ),
                      TextFieldApp(
                        title: 'Email do usuário',
                        icon: FeatherIcons.mail,
                        inputType: TextInputType.text,
                        controller: userName,
                      ),
                      TextFieldApp(
                        title: 'Senha do Usuário',
                        icon: FeatherIcons.lock,
                        inputType: TextInputType.text,
                        controller: userName,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
              ButtonApp(
                backgroundColor: appColorPrimary,
                title: 'Salvar alterações',
                textColor: appColorWhite,
                onPressed: () => setState(() {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
