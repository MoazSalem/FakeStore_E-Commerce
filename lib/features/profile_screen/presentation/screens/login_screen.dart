import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/profile_screen/presentation/controller/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizesManager.padding20),
        child: Column(
          children: [
            CustomAppBar(
              title: "Fake Login",
              leading: Padding(
                padding: const EdgeInsets.all(SizesManager.padding5),
                child: CircularButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
            const SizedBox(height: SizesManager.padding26),
            Form(
              key: formKey,
              child: TextFormField(
                controller: nameController,

                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      SizesManager.avatarBorderRadius,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name is required";
                  } else if (value.length < 3) {
                    return "Name must be at least 3 characters long";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: SizesManager.padding26),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<UserCubit>(
                    context,
                  ).signIn(nameController.text);
                  Navigator.pop(context);
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
