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

  //pay now button
  void payNow(){
    
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
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index){
                //get individual cart items
                Coffee eachCoffee = value.userCart[index];

                //return coffee tile 
                return CoffeeTile(
                  coffee: eachCoffee,
                  icon: Icon(Icons.delete),
                  onPressed: () => removeFromCart(eachCoffee),);
               
              }
              ),
              ),

              //pay button
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: EdgeInsets.all(25),
                  width: double.infinity,
                   decoration:BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text("Pay Now",
                    style: TextStyle(color:Colors.white),
                    ),
                  ),
                ),
              )
              ],
        ),
      ),
    ),
    );
  }
}