part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final MenuItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItem extends BasketEvent {
  final MenuItem item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveAllItem extends BasketEvent {
  final MenuItem item;

  const RemoveAllItem(this.item);

  @override
  List<Object> get props => [item];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;

  const SelectDeliveryTime(this.deliveryTime);

  @override
  List<Object> get props => [deliveryTime];
}
