import 'package:ecommerce/core/utils/assets_manager.dart';
import 'package:ecommerce/core/utils/navigation_manager.dart';
import 'package:ecommerce/core/utils/sizes_manager.dart';
import 'package:ecommerce/core/widgets/circular_avatar_image.dart';
import 'package:ecommerce/core/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/widgets/svg_image.dart';
import 'package:ecommerce/features/user/presentation/controller/user_cubit.dart';
import 'package:ecommerce/features/user/presentation/widgets/create_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(title: "Profile"),
          const SizedBox(height: SizesManager.padding26),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: SizesManager.avatarBorderRadius,
                    child: state is UserLoaded && state.user.avatarUrl != null
                        ? CircularAvatarImage(imageUrl: state.user.avatarUrl!)
                        : SvgImage(
                            asset: AssetsManager.profileFilled,
                            height: SizesManager.avatarBorderRadius,
                            fit: BoxFit.fitHeight,
                          ),
                  ),
                  const SizedBox(height: SizesManager.padding26),
                  Text(
                    state is UserLoaded ? state.user.name : "Guest",
                    style: TextStyle(
                      fontSize: SizesManager.font24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: SizesManager.padding80),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizesManager.padding20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: SizesManager.buttonHeight,
                      child: OutlinedButton(
                        onPressed: () => state is UserLoaded
                            ? BlocProvider.of<UserCubit>(context).signOut()
                            : Navigator.pushNamed(
                                context,
                                NavigationManager.loginScreen,
                              ),
                        child: Text(
                          state is UserLoaded ? "Logout" : "Login",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize: SizesManager.font16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state is! UserLoaded)
                    CreateAccountButton(
                      onTap: () => Navigator.pushNamed(
                        context,
                        NavigationManager.createAccountScreen,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
