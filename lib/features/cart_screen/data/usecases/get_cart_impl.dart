import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart_screen/domain/entities/cart.dart';
import 'package:ecommerce/features/cart_screen/domain/repositories/cart_repository.dart';
import 'package:ecommerce/features/cart_screen/domain/usecases/get_cart.dart';

class GetCartImpl implements GetCartUseCase {
  final CartRepository repository;
  GetCartImpl({required this.repository});

  @override
  Future<Result<Cart>> call(int cartId) => repository.getCart(cartId);
}
