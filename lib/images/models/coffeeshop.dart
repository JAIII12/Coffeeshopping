import 'package:flutter/material.dart';
import 'coffee.dart';

class Coffeeshop extends ChangeNotifier {
// coffe for sale list 
final List<Coffee> _shop = [
  Coffee(
    name: 'Long Black',
    price: "3.00",
    imagePath: 'assets/images/black.png',),
  
  Coffee(
    name: 'Espresso',
    price: "3.5",
    imagePath: 'assets/images/espresso.png',
    
  ),
  Coffee(
    name: 'Latte',
    price: "4.50",
    imagePath: 'assets/images/latte.png',
    
  ),
  Coffee(
    name: 'Iced Coffee',
    price: '4.4',
    imagePath: 'assets/images/icedcoffee.png',
    
  ),
];

//user cart
List<Coffee> _usercart = [];

// get coffee
List<Coffee> get coffeeshop => _shop;

//get user cart
List<Coffee> get usercart => _usercart;

// add item to cart
void addToCart(Coffee coffee) {
  _usercart.add(coffee); 
}

//remove item from cart
void removeFromCart(Coffee coffee) {
  _usercart.remove(coffee);

}
}