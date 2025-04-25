import 'package:coffeeshopui/components/coffee_tile.dart';
import 'package:coffeeshopui/images/models/coffee.dart';
import 'package:coffeeshopui/images/models/coffeeshop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  //remove item from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<Coffeeshop>(context, listen: false).removeFromCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(builder: (context, value, child) =>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //heading 
            Text(
              'Your Cart',
              style: TextStyle(fontSize: 20),
              ),

              //list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.usercart.length,
                  itemBuilder: (context, index){
                //get individual cart items
                Coffee eachCoffee = value.usercart[index];

                //return coffee tile 
                return CoffeeTile(
                  coffee: eachCoffee,
                  icon: Icon(Icons.delete),
                  onPressed: () => removeFromCart(eachCoffee),);
               
              }))
              ],
        ),
      ),
    ),
    );
  }
}