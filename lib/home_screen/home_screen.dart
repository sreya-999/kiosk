import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ravathi_store/home_screen/view_order_screen.dart';
import 'package:ravathi_store/utlis/App_color.dart';
import 'package:ravathi_store/utlis/App_image.dart';

import '../providers/cart_provider.dart';
import '../providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final categories = provider.categories;
    final products = provider.selectedCategoryProducts;
    final cartProvider = Provider.of<CartProvider>(context);
    final totalAmount = cartProvider.getTotalAmount(products); // products must be accessible here


    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.primaryColor, // Customize as needed
            title: Container(
              padding: const EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 8), // Optional: inner padding
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5), // 👈 White border
                borderRadius: BorderRadius.circular(8), // Optional: rounded corners
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'THE REVATHI STORE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    'THE BEST SHOP',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            final totalAmount = cartProvider.getTotalAmount(products); // ensure products is in scope

            return Container(
              height: 95, // Increased to accommodate both lines
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${totalAmount.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient:  LinearGradient(
                            colors: [Colors.red.shade300, Color(0xFFE31E24)],// Orange to red gradient
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ElevatedButton(
                          onPressed: totalAmount > 0
                              ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ViewOrderScreen(products: products),
                              ),
                            );
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Order Now !',
                            style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold,),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            );
          },
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔶 Banner at the top
              Image.network(
                'https://www.shutterstock.com/image-vector/delicious-homemade-burger-chili-bbq-600nw-1804330342.jpg',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchCartRow(),
              ),

              // 🔹 Horizontal Category List
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isSelected = cat.id == provider.selectedCategoryId;

                    return GestureDetector(
                      onTap: () {
                        provider.selectCategory(cat.id);
                      },
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: isSelected ? 1.0 : 0.0),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: isSelected ? 1.05 : 1.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 80,
                                    height: 80,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected ? const Color(0xFFFFEBEE) : Colors.white,
                                      border: Border.all(
                                        color: isSelected ? Colors.redAccent : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                      boxShadow: isSelected
                                          ? [
                                        BoxShadow(
                                          color: Colors.redAccent.withOpacity(0.3),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        cat.image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    cat.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              // 🔸 Product Grid (wrapped in fixed-height container to work inside scroll view)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true, // important
                  physics: const NeverScrollableScrollPhysics(), // disable inner scroll
                  key: ValueKey(provider.selectedCategoryId),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final cartProvider = Provider.of<CartProvider>(context);
                    final quantity = cartProvider.getQuantity(product.id);

                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 900),
                      columnCount: 2,
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Shimmer.fromColors(
                                            baseColor: Colors.grey.shade300,
                                            highlightColor: Colors.grey.shade100,
                                            child: Container(
                                              color: Colors.white,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) => const Center(
                                            child: Icon(Icons.broken_image,
                                                size: 40, color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '₹${product.price.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => cartProvider.decrement(product.id),
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
                                          child: const Icon(Icons.remove,
                                              size: 18, color: AppColor.whiteColor),
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
                                        onTap: () => cartProvider.increment(product.id),
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
                                          child: const Icon(Icons.add,
                                              size: 18, color: AppColor.whiteColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
class SearchCartRow extends StatelessWidget {
  final int cartItemCount;

  const SearchCartRow({super.key, this.cartItemCount = 4});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Box
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search, color: Colors.redAccent),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.redAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Filter Button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.redAccent),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),

        // Cart Button with Badge
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              final cartItemCount = cartProvider.totalItems;

              return badges.Badge(
                showBadge: cartItemCount > 0,
                badgeContent: Text(
                  cartItemCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                position: badges.BadgePosition.topEnd(top: -4, end: -4),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.redAccent,
                  shape: badges.BadgeShape.circle,
                  padding: EdgeInsets.all(5),
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.redAccent),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(
                    //   //   builder: (_) => ViewOrderScreen(
                    //   //     products: p, // Replace with actual product list
                    //   //   ),
                    //   // ),
                    // );
                  },
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}