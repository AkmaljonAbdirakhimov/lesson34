import 'package:flutter/material.dart';
import 'package:lesson34/models/product.dart';
import 'package:lesson34/pages/product_details.dart';

class HomePage extends StatefulWidget {
  final String title;
  final ThemeMode themeMode;
  final Function() toggleThemeMode;

  HomePage({
    required this.title,
    required this.themeMode,
    required this.toggleThemeMode,
  });

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final productsManager = ProductsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: widget.toggleThemeMode,
            icon: Icon(
              widget.themeMode == ThemeMode.system ||
                      widget.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          for (var i = 0; i < productsManager.products.length; i++)
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) {
                    return ProductDetails(
                      productDescription:
                          productsManager.products[i].productDescription,
                      productImage: productsManager.products[i].productImage,
                      productTitle: productsManager.products[i].productTitle,
                    );
                  }),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(productsManager.products[i].productTitle),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar:
          //? Material 3 - NavigationBar
          // NavigationBar(
          //   onDestinationSelected: (value) {
          //     selectedIndex = value;
          //     setState(() {});
          //   },
          //   selectedIndex: selectedIndex,
          //   indicatorColor: Colors.amber,
          //   destinations: const [
          //     NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          //     NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
          //     NavigationDestination(icon: Icon(Icons.person), label: "Person"),
          //   ],
          // ),

          //? Material 2 - BottomNavigationBar
          BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
            tooltip: "Settings",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
            tooltip: "Profile",
          ),
        ],
      ),
    );
  }
}
