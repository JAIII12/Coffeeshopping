import 'package:flutter/material.dart';
import 'coffee.dart';

class Coffeeshop extends ChangeNotifier {
// coffe for sale list 
final List<Coffee> _shop = [
  Coffee(
    name: 'Long Black',
    price: "3.00",
    imagePath: 'lib/images/black.png',),
  
  Coffee(
    name: 'Espresso',
    price: "3.5",
    imagePath: 'lib/images/espresso.png',
    
  ),
  Coffee(
    name: 'Latte',
    price: "4.50",
    imagePath: 'lib/images/latte.png',
    
  ),
  Coffee(
    name: 'Iced Coffee',
    price: '4.4',
    imagePath: 'lib/images/icedcoffee.png',
    
  ),
];

//user cart
List<Coffee> _userCart = [];

// get coffee
List<Coffee> get coffeeshop => _shop;

//get user cart
List<Coffee> get userCart => _userCart;

// add item to cart
void addToCart(Coffee coffee) {
  _userCart.add(coffee);
  notifyListeners(); 
}

//remove item from cart
void removeFromCart(Coffee coffee) {
  _userCart.remove(coffee);
  notifyListeners();

}
}