import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyShoppingList extends StatelessWidget { 
  const MyShoppingList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
     child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Shopping List',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ShoppingList(
              products: [
                Product(name: 'Eggs'),
                Product(name: 'Flour'),
                Product(name: 'Chocolate chips'),
              ],
            ),
          ),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangedCallback = void Function(Product product, bool inCart);

class ShoppingItem extends StatelessWidget {
  ShoppingItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ValueKey(product.name));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onCartChanged(product, inCart),
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});
  final List<Product> products;
  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children:
          widget.products.map((product) {
            return ShoppingItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged,
            );
          }).toList(),
    );
  }
}