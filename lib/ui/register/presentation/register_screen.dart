import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils_service.dart';

import '../../../widgets/build_text_field.dart';
import '../provider/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  final String phoneNumber;
  const RegisterScreen({super.key, required this.phoneNumber});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  void initState() {
    context.read<RegisterViewModel>().phoneController.text = widget.phoneNumber;
    super.initState();
  }

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
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text("🚗", style: TextStyle(fontSize: 35))),
                        ),
                        const SizedBox(height: 12),
                        Text("Hisob yaratish",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(height: 4),
                        Text("Yangi akkaunt oching",
                            style: Theme.of(context).textTheme.bodyMedium),
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
                            // Ism
                            Text("Ism",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 8),
                            BuildTextField(
                              onChanged: context.read<RegisterViewModel>().mySetState,
                              controller: context.watch<RegisterViewModel>().nameController,
                              hint: "Ismingizni kiriting",
                              icon: CupertinoIcons.person,
                            ),
                            const SizedBox(height: 20),

                            // Telefon raqam
                            Text("Telefon raqam",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 8),
                            BuildTextField(
                              onChanged: context.read<RegisterViewModel>().mySetState,
                              controller: context.watch<RegisterViewModel>().phoneController,
                              hint: "+998 90 123 45 67",
                              icon: CupertinoIcons.phone,
                              keyboard: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),

                            // Parol
                            Text("Parol",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 8),
                            BuildTextField(
                              onChanged: context.read<RegisterViewModel>().mySetState,
                              controller: context.watch<RegisterViewModel>().passwordController,
                              hint: "Parolingizni kiriting",
                              icon: Iconsax.lock_outline,
                              obscureText: context
                                  .watch<RegisterViewModel>()
                                  .showPassword,
                              suffix: IconButton(
                                icon: Icon(
                                  context.watch<RegisterViewModel>().showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  context
                                      .read<RegisterViewModel>()
                                      .changeShowPassword();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Parol tasdiqlash
                            Text("Parolni tasdiqlash",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(height: 8),
                            BuildTextField(
                              onChanged: context.read<RegisterViewModel>().mySetState,
                              controller: context.watch<RegisterViewModel>().confirmpasswordController,
                              hint: "Parolni qayta kiriting",
                              icon: Iconsax.lock_outline,
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),




                            const SizedBox(height: 24),

                            // Ro’yhatdan o’tish button
                            ElevatedButton(
                              onPressed: !context.read<RegisterViewModel>().checkFields()?
                              null:() {
                                context.read<RegisterViewModel>().doRegister(context);
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                              child: const Text(
                                "Ro'yhatdan o'tish",
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Hisobga kirish
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hisobingiz bormi?",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<RegisterViewModel>()
                                .toLoginPage(context);
                          },
                          child: Text(
                            "Kirish",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

}