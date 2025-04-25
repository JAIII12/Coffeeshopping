import 'package:coffeeshopui/components/coffee_tile.dart';
import 'package:coffeeshopui/images/models/coffee.dart';
import 'package:coffeeshopui/images/models/coffeeshop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add to cart
  void addToCart(Coffee coffee) {
    Provider.of<Coffeeshop>(context, listen: false).addToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(builder: (context, value, child) =>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // heading message
            Text("How would you like your coffee?",
            style: TextStyle(fontSize: 20),
            ),
        
            const SizedBox(height: 25,),
        
            //list of coffee to buy
            Expanded(child: ListView.builder(
              itemCount: value.coffeeshop.length,
              itemBuilder: (context, index){
               //get individual coffee
               Coffee eachCoffee = value.coffeeshop[index];

            //return the tile for this coffee
            return CoffeeTile(
              coffee: eachCoffee,
              icon: Icon(Icons.add),
              onPressed:() => addToCart(eachCoffee),);
  })
            )
          ],
        ),
      ),
    )
    );
    
  }
}