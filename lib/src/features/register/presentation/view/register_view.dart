import 'package:auto_route/auto_route.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_pick_app/src/features/register/application/register_controller.dart';
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
  late TextEditingController textCepController;
  late TextEditingController textCpfController;

  @override
  void initState() {
    textNameController = TextEditingController();
    textCepController = TextEditingController();
    textCpfController = TextEditingController();
    textTelephoneController = TextEditingController();
    textEmailController = TextEditingController();
    textPasswordController = TextEditingController();
    textConfirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textNameController.dispose();
    textTelephoneController.dispose();
    textEmailController.dispose();
    textPasswordController.dispose();
    textConfirmPasswordController.dispose();
    textCepController.dispose();
    textCpfController.dispose();
    super.dispose();
  }

  final RegisterController registerController = RegisterController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarApp(onBackPressed: () => context.router.replaceNamed('/login')),
        body: SingleChildScrollView(
            child: Container(
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
              Form(
                key: _formKey,
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
                      formatters: [CepInputFormatter(), FilteringTextInputFormatter.digitsOnly],
                      title: 'Cep',
                      icon: FontAwesomeIcons.addressCard,
                      controller: textCepController,
                      inputType: TextInputType.number,
                    ),
                    TextFieldApp(
                      formatters: [CpfInputFormatter(), FilteringTextInputFormatter.digitsOnly],
                      title: 'Cpf',
                      icon: FeatherIcons.penTool,
                      controller: textCpfController,
                      inputType: TextInputType.text,
                    ),
                    TextFieldApp(
                      formatters: [FilteringTextInputFormatter.digitsOnly, TelefoneInputFormatter()],
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
              SizedBox(height: 20),
              ButtonApp(
                onPressed: (() async {
                  if (_formKey.currentState!.validate()) {
                    if (textPasswordController.text != textConfirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('As senhas não são iguais'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    try {
                      await registerController.register(
                        cep: textCepController.text,
                        name: textNameController.text,
                        email: textEmailController.text,
                        password: textPasswordController.text,
                        phone: textTelephoneController.text,
                        cpf: textCepController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuário criado com sucesso'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      context.router.replaceNamed('/login');
                    } catch (e) {
                      print(e);
                    }
                  }
                }),
                title: 'Criar conta',
                backgroundColor: appColorPrimaryTransparent,
                textColor: appColorPrimary,
              )
            ],
          ),
        ))));
  }
}
