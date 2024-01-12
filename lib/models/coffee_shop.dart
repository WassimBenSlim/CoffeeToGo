import 'package:coffetogo/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale list
  final List<Coffee> _shop = [
    //Latte
    Coffee(
      name: 'Latte',
      price: '4.20',
      imagePath: "lib/icons/Latte.png",
    ),

    //espresso
    Coffee(
      name: 'Espresso',
      price: '3.50',
      imagePath: "lib/icons/espresso.png",
    ),

    //Tea
    Coffee(
      name: 'Tea',
      price: "2.60",
      imagePath: "lib/icons/tea.png",
    ),

    //Iced Coffe
    Coffee(
      name: 'Iced Coffee',
      price: '4.40',
      imagePath: "lib/icons/iced-coffee.png",
    ),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
