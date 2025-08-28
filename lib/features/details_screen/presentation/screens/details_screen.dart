import 'package:ecommerce/features/details_screen/presentation/controller/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit()..getProduct(id: id),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return state is DetailsLoaded
              ? Scaffold(body: Column(children: [Text(state.product.title)]))
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
