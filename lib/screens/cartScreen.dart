import 'package:flutter/material.dart';

import '../helper/Color.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

bool _isBagLoading = false;

class _CartscreenState extends State<Cartscreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Brown Jacket',
      'size': 'XL',
      'price': 83.97,
      'image':
          'https://www.snitch.co.in/cdn/shop/files/2822ccd617ea287b66f68e19e742ee4a.webp?v=1725950534',
      'quantity': 1
    }
  ];

  double deliveryFee = 25.00;
  double discount = -35.00;

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]['quantity'] += change;
      if (cartItems[index]['quantity'] < 1) cartItems[index]['quantity'] = 1;
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double calculateTotal() {
    double subtotal = cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
    return subtotal + deliveryFee + discount;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          title: Text(
            "My Cart",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(cartItems[index]['title']),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      removeItem(index);
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: ListTile(
                        leading: Image.network(cartItems[index]['image'],
                            width: 60, height: 60, fit: BoxFit.cover),
                        title: Text(cartItems[index]['title']),
                        subtitle: Text("Size: ${cartItems[index]['size']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () => updateQuantity(index, -1),
                            ),
                            Text(cartItems[index]['quantity'].toString(),
                                style: TextStyle(fontSize: 16)),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () => updateQuantity(index, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: checkoutSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkoutSection() {
    double subtotal = cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          TextField(
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'Promo Code',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: primaryBrown),
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: primaryBrown),
                borderRadius: BorderRadius.circular(50),
              ),
              hintStyle: TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins',
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Apply"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBrown,
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          buildTotalRow("Sub-Total", subtotal),
          buildTotalRow("Delivery Fee", deliveryFee),
          buildTotalRow("Discount", discount),
          Divider(thickness: 1),
          buildTotalRow("Total Cost", calculateTotal(), bold: true),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Proceed to Checkout",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalRow(String label, double amount, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
