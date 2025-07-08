import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ravathi_store/home_screen/payment.dart';

import '../models/product_model.dart';
import '../providers/cart_provider.dart';
import '../utlis/App_color.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ViewOrderScreen extends StatelessWidget {
  final List<ProductModel> products;

  const ViewOrderScreen({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orderedItems = products
        .where((product) => cartProvider.getQuantity(product.id) > 0)
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Your Cart', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20)),
        backgroundColor: AppColor.primaryColor,
      ),

      // ✅ Bottom Navigation Bar for Total and Pay Button
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          final totalAmount = cartProvider.getTotalAmount(orderedItems); // orderedItems in scope

          return Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 🔹 Total Amount Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '₹${totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                // 🔸 Pay Button
                Container(
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [Colors.red.shade300, Color(0xFFE31E24)],// Orange to red gradient
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white, width: 2), // Optional white border
                  ),
                  child: ElevatedButton(
                    onPressed: totalAmount > 0
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentSuccessScreen(),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Order Now !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),

      body: orderedItems.isEmpty
          ? const Center(child: Text('No items ordered.'))
          : ListView.builder(
        itemCount: orderedItems.length,
        itemBuilder: (context, index) {
          final item = orderedItems[index];
          final quantity = cartProvider.getQuantity(item.id);

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: Container(
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Name, price, quantity and controls
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.clear, color: Colors.black, size: 20),
                                    onPressed: () {
                                      cartProvider.removeItem(item.id);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                '₹${item.price.toStringAsFixed(0)} x $quantity',
                                style: const TextStyle(
                                  color: AppColor.lightGreyColor,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '₹${(item.price * quantity).toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
                              ),
                              // Add / Remove Buttons
                              Padding(
                                padding: const EdgeInsets.only(right:18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () => cartProvider.decrement(item.id),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [Colors.red.shade300, const Color(0xFFE31E24)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: const Icon(Icons.remove, size: 18, color: AppColor.whiteColor),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '$quantity',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    GestureDetector(
                                      onTap: () => cartProvider.increment(item.id),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [Colors.red.shade300, const Color(0xFFE31E24)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: const Icon(Icons.add, size: 18, color: AppColor.whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        // Delete button

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
