import 'package:ecommerce/features/cart_screen/presentation/screens/cart_screen.dart';
import 'package:ecommerce/features/home_screen/presentation/screens/home_screen.dart';
import 'package:ecommerce/features/main_screen/presentation/controller/main_screen_cubit.dart';
import 'package:ecommerce/features/main_screen/presentation/widgets/custom_navigation_bar.dart';
import 'package:ecommerce/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:ecommerce/features/saved_screen/presentation/screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        return state is MainScreenLoaded
            ? Scaffold(
                extendBody: true,
                body: SafeArea(
                  bottom: false,
                  child: IndexedStack(
                    index: state.index,
                    children: [
                      HomeScreen(),
                      CartScreen(),
                      SavedScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                bottomNavigationBar: CustomNavigationBar(index: state.index),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
