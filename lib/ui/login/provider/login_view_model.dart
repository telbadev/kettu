
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import '../../../utils/utils_service.dart';


class LoginViewModel extends ChangeNotifier{
  bool showPassword = false;
  bool isLoading = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  void changeShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void doLogin(context) async {
    isLoading = true;
    notifyListeners();
    UserModel userModel = UserModel(phone: mailController.text,password: passwordController.text);
    try {
      final hasAt = UtilsService.isValidEmail(mailController.text.trim());
      if(!hasAt) {
        UtilsService.commonDialog(context: context,title: "Xatolik", content: "Email talabga javob bermaydi", no: "Yo'q", yes: "Ha");
        return;
      }
      context.read<LoginViewModel>().mySetState();
      // UserModel? response = await DataBaseService.loginUser(userModel);
      if (null==null) {
        print("SAlom");
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        disposePage();
      }
    } catch (e){
      print('xatolik yuz berdi(login)');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void mySetState() {
    notifyListeners();
  }

  void disposePage() {
    showPassword = false;
    passwordController.clear();
    mailController.clear();
  }
}