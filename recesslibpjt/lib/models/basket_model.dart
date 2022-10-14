import 'package:equatable/equatable.dart';
import 'package:recesslibpjt/models/delivery_time_model.dart';
import 'package:recesslibpjt/models/menu_item_model.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final DeliveryTime? deliveryTime;

  Basket({
    this.items = const <MenuItem>[],
    this.deliveryTime,
  });

  Basket copyWith({List<MenuItem>? items, DeliveryTime? deliveryTime}) {
    return Basket(
      items: items ?? this.items,
      deliveryTime: deliveryTime?? this.deliveryTime
    );
  }

  @override
  List<Object?> get props => [items, deliveryTime];

  Map itemQuantity(items) {
    var quantity = {};

    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return subtotal + 1500;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal).toStringAsFixed(2);
}
