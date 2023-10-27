import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/features/login/application/login_controller.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';
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

  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarApp(),
        resizeToAvoidBottomInset: true,
        backgroundColor: appColorWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 90),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 20,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 5,
                          children: [
                            Text(
                              'Olá, seja bem vindo!',
                              textScaleFactor: 2,
                              style: TextStyle(color: appColorTitle),
                            ),
                            Text(
                              'Faça o seu login aqui em baixo',
                              textScaleFactor: 1.2,
                              style: TextStyle(color: appColorDescription),
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
                        onPressed: (() async {
                          try {
                            await loginController.loginUser(
                              textEmailController.text,
                              textPasswordController.text,
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Credenciais inválidas'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }

                          await context.router.replaceNamed('/');
                        }),
                        title: 'Fazer login',
                        backgroundColor: appColorPrimary,
                        textColor: appColorWhite,
                      ),
                      ButtonApp(
                        onPressed: (() {
                          context.navigateNamedTo('/register');
                        }),
                        title: 'Criar conta',
                        backgroundColor: appColorPrimaryTransparent,
                        textColor: appColorPrimary,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
