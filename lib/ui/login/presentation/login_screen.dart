

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils_service.dart';
import '../../register/presentation/register_screen.dart';
import '../provider/login_view_model.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text("✈️", style: TextStyle(fontSize: 35))),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Xush kelibsiz",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Kettu hisobiga kirish",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Card
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Email",style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: context.watch<LoginViewModel>().mailController,
                              cursorColor: Theme.of(context).colorScheme.onPrimary,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: "Font",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                hintText: "johndoe@gmail.com",
                                hintStyle: const TextStyle(color: Colors.grey),
                                prefixIcon: const Icon(CupertinoIcons.mail, color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Colors.black45),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    width: 1.5,
                                  ),
                                ),
                                isDense: true,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password input
                          Text("Parol",
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              onChanged: (value) => context.read<LoginViewModel>().mySetState(),
                              cursorColor: Theme.of(context).colorScheme.onPrimary,
                              style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: "Font",fontWeight: FontWeight.w600,),
                              controller: context.watch<LoginViewModel>().passwordController,
                              obscureText:context.watch<LoginViewModel>().showPassword,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: "Parolingizni kiriting",
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(context.watch<LoginViewModel>().showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    context.read<LoginViewModel>().changeShowPassword();
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.black45
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).colorScheme.onPrimary,
                                        width: 1.5
                                    )
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Parolni unutdingizmi?",
                                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Login Button
                          ElevatedButton(
                            onPressed:
                            context.watch<LoginViewModel>().mailController.text.length>10 &&
                                context.watch<LoginViewModel>().passwordController.text.isNotEmpty
                                ? () {
                              context.read<LoginViewModel>().doLogin(context);
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Theme.of(context).colorScheme.onPrimary,
                            ),
                            child: const Text(
                              "Kirish",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign Up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hisobingiz yo'qmi?",
                        style:
                        TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(phoneNumber: ''),));
                        },
                        child: Text(
                          "Ro'yhatdan o'tish",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}