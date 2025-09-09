import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/cart/domain/usecases/get_cart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GetCartUseCase)
class GetCartImpl implements GetCartUseCase {
  final CartRepository repository;

  GetCartImpl({required this.repository});

  @override
  Future<Result<Cart>> call(int cartId) => repository.getCart(cartId);
}
