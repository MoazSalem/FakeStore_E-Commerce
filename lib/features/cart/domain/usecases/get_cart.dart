import 'package:ecommerce/core/error_handling/result.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class GetCartUseCase {
  Future<Result<Cart>> call(int cartId);
}
