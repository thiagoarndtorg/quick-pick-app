import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:quick_pick_app/src/utils/app_colors.dart';
import 'package:quick_pick_app/src/utils/common/widgets/app_bar_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/button_app.dart';
import 'package:quick_pick_app/src/utils/common/widgets/text_field_app.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController textNameController;
  late TextEditingController textTelephoneController;
  late TextEditingController textEmailController;
  late TextEditingController textPasswordController;
  late TextEditingController textConfirmPasswordController;
  @override
  void initState() {
    textNameController = TextEditingController();
    textTelephoneController = TextEditingController();
    textEmailController = TextEditingController();
    textPasswordController = TextEditingController();
    textConfirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarApp(onBackPressed: () => context.router.replaceNamed('/login')),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                  height: MediaQuery.of(context).size.height - 120,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 5,
                            children: [
                              Text(
                                'Fazer cadastro',
                                textScaleFactor: 2,
                                style: TextStyle(color: appColorTitle, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Insira suas informações aqui em baixo',
                                textScaleFactor: 1.2,
                                style: TextStyle(color: appColorDescription),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            runSpacing: 12,
                            children: [
                              TextFieldApp(
                                title: 'Nome',
                                icon: FeatherIcons.user,
                                controller: textNameController,
                                inputType: TextInputType.text,
                              ),
                              TextFieldApp(
                                title: 'Celular',
                                icon: FeatherIcons.phone,
                                controller: textTelephoneController,
                                inputType: TextInputType.text,
                              ),
                              TextFieldApp(
                                title: 'E-mail',
                                icon: FeatherIcons.mail,
                                controller: textEmailController,
                                inputType: TextInputType.text,
                              ),
                              TextFieldApp(
                                title: 'Senha',
                                icon: FeatherIcons.lock,
                                controller: textPasswordController,
                                inputType: TextInputType.text,
                              ),
                              TextFieldApp(
                                title: 'Confirmar Senha',
                                icon: FeatherIcons.lock,
                                controller: textConfirmPasswordController,
                                inputType: TextInputType.text,
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        ButtonApp(
                          onPressed: (() {}),
                          title: 'Criar conta',
                          backgroundColor: appColorPrimaryTransparent,
                          textColor: appColorPrimary,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
