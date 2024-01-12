import 'package:coffetogo/components/coffee_tile.dart';
import 'package:coffetogo/models/coffee.dart';
import 'package:coffetogo/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    //let user know it add been sucess
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text("Successfully added to cart", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "How would you like your Coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),

              // list of Coffee to buy
              Expanded(
                child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // get individual coffeess
                      Coffee eachCoffee = value.coffeeShop[index];

                      //return the tile of each coffee
                      return CoffeeTile(
                          coffee: eachCoffee,
                          icon: Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
