import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController textEmailController;
  late TextEditingController textPasswordController;

  @override
  void initState() {
    textEmailController = TextEditingController();
    textPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: appColorWhite,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 70,
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    color: appColorBackground,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, right: 20, left: 20, bottom: 90),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 20,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: 5,
                              children: [
                                Text(
                                  'Olá, seja bem vindo!',
                                  textScaleFactor: 2,
                                  style:
                                      TextStyle(color: appColorTitle),
                                ),
                                Text(
                                  'Faça o seu login aqui em baixo',
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: appColorDescription),
                                ),
                              ],
                            ),
                          ),
                          TextFieldApp(
                            title: 'Digite seu email aqui',
                            icon: FeatherIcons.mail,
                            controller: textEmailController,
                            inputType: TextInputType.text,
                          ),
                          TextFieldApp(
                            title: 'Digite sua senha aqui',
                            icon: FeatherIcons.lock,
                            controller: textPasswordController,
                            inputType: TextInputType.text,
                            isPassword: true,
                          ),
                          ButtonApp(
                            title: 'Fazer login',
                            backgroundColor: appColorPrimary,
                            textColor: appColorWhite,
                          ),
                          ButtonApp(
                            title: 'Criar conta',
                            backgroundColor:
                                appColorPrimaryTransparent,
                            textColor: appColorPrimary,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
