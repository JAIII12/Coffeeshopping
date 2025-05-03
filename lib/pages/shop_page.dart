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

  // Show quantity selection dialog
  void showQuantityDialog(Coffee coffee) {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text('Select Quantity'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() => quantity--);
                    }
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() => quantity++);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < quantity; i++) {
                    Provider.of<Coffeeshop>(context, listen: false)
                        .addToCart(coffee);
                  }
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("Added $quantity ${coffee.name} to cart"),
                    ),
                  );
                },
                child: Text("Add to Cart"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Coffeeshop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeshop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.coffeeshop[index];
                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onPressed: () => showQuantityDialog(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
