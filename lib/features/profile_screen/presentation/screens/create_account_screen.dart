import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_button.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/profile_screen/data/models/user_model.dart';
import 'package:ecommerce/features/profile_screen/presentation/controller/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final imageUrlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizesManager.padding20,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: "Create Account",
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
                child: Column(
                  spacing: SizesManager.padding26,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizesManager.avatarBorderRadius,
                          ),
                        ),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a name";
                        } else if (value.length < 3) {
                          return "Name must be at least 3 characters long";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Image URL (optional)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizesManager.avatarBorderRadius,
                          ),
                        ),
                      ),
                      controller: imageUrlController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an image URL";
                        } else if (!value.startsWith("https://")) {
                          return "Please enter a valid image URL";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizesManager.padding26),
              CustomButton(
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<UserCubit>(context).signUp(
                      UserModel(
                        id: UniqueKey().hashCode,
                        name: nameController.text,
                        avatarUrl: imageUrlController.text.isEmpty
                            ? null
                            : imageUrlController.text,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
