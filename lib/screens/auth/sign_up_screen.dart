import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/controllers/login.dart';
import 'package:projects/models/registration_model.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/utils/size_config.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  RegistrationModel? model = RegistrationModel();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        width: SizeConfig.width * 100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 56),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 48,
                            color: AppTheme.accentColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
              const SizedBox(height: 30),
            Row(children: [
              Theme(
                data: new ThemeData(
                  primaryColor: Colors.green,
                  primaryColorDark: Colors.yellow,
                ),
                child: Expanded(
                  child: new TextFormField(
                    controller: firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Rate';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black54, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.black26, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'First Name',
                      labelStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              new Expanded(
                child: new TextFormField(
                  controller: lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Rate';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red, width: 1.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black26, width: 1.0),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'Last Name',
                    prefixText: ' ',
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ],),
              const SizedBox(height: 20),
              CommonTextField(
                controller: lastNameController,
                labelText: "Last Name",
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: emailController,
                labelText: "Email Id",
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: phoneController,
                labelText: "Phone number",
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: pwdController,
                labelText: "Password",
                isPassword: true,
              ),
              const Divider(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "I'm",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentColor,
                    ),
                  ),
                  Text(
                    "(Select your gender)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentColor,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 26,
              ),
              CustomButton(
                  onPressed: () {
                    this.model?.name = firstNameController.text;
                    this.model?.email = emailController.text;
                    this.model?.password = pwdController.text;
                    this.model?.city = 'New Delhi';
                    this.model?.dob = '12-05-1980';
                    this.model?.gender = 'mqle';
                    BlueHostService.getRegistration(model!);
                    Get.toNamed("main_page");
                  },
                  title: "Sign Up"),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppTheme.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      )),
    );
  }

  Widget cameraCircle() {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: const Icon(
            CupertinoIcons.camera,
            color: Colors.white,
            size: 40,
          ),
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: AppTheme.accentColor,
          ),
        ),
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xffe14138),
        ),
      ),
      height: 110,
      width: 110,
      decoration: ShapeDecoration(
        shape: CircleBorder(
            side: BorderSide(color: AppTheme.accentColor, width: 1.5)),
        color: Colors.white,
      ),
    );
  }

  Widget genderSelection() {
    return Theme(
      data: Theme.of(Get.context!).copyWith(
        unselectedWidgetColor: AppTheme.accentColor,
      ),
      child: Obx(() => Column(
            children: <Widget>[],
          )),
    );
  }
}
