import 'package:flutter/material.dart';

import '../../../data/models/user_model.dart';
import '../../login/presentation/login_screen.dart';

class RegisterViewModel extends ChangeNotifier {
  bool showPassword = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void changeShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void doRegister(context) async {
    if (passwordController.text!=confirmpasswordController.text)return;

    UserModel userModel = UserModel();
    isLoading = true;
    notifyListeners();
    try {
      // String? response = await DataBaseService.storeUser(userModel);
      //response!.isNotEmpty
      if(true) {
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomeScreen(),));
        disposePage();
      }
    } catch(e){}finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool checkFields() {
    if(
    nameController.text.isEmpty
    || phoneController.text.length != 17
    || passwordController.text.isEmpty
    || passwordController.text != confirmpasswordController.text
    || carNameController.text.isEmpty
    || carNumberController.text.length!=11
    ) return false;
    return true;
  }

  void toLoginPage(context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
    disposePage();
  }

  void mySetState() {
    notifyListeners();
    print("object2");
  }

  void disposePage() {
    showPassword = false;
    phoneController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
    nameController.clear();
  }
}