import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            Expanded(child: ListView.builder(itemBuilder: (context, index){
               //get individual coffee
               


            //return the tile for this coffee


            })
            )
          ],
        ),
      ),
    );
    
  }
}