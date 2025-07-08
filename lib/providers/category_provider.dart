import 'package:flutter/material.dart';

import '../models/ctageory_models.dart';
import '../models/product_model.dart';


class CategoryProvider with ChangeNotifier {
  int _selectedCategoryId = 1;

  final List<CategoryModel> _categories = [
    CategoryModel(id: 1, name: 'Burger', image: 'https://img.pikbest.com/origin/09/17/77/71vpIkbEsTIN8.png!sw800'),
    CategoryModel(id: 2, name: 'Fresh Juice', image: 'https://media.istockphoto.com/id/1316298380/photo/champagne-coupe-glass-of-refreshing-orange-cocktail-with-ice-served-on-gray-table-surface.jpg?s=612x612&w=0&k=20&c=U-Yupox-haVt4rXzyQDdkMKl8tTTRTXL9GCbpCWkTJI='),
    CategoryModel(id: 3, name: 'Pizza', image: 'https://media.istockphoto.com/id/1149135424/photo/group-of-sweet-and-salty-snacks-perfect-for-binge-watching.jpg?s=612x612&w=0&k=20&c=YAVqRyUJgj_nXpltYUPpaW_PYtd4v2TC5Mo0DtVFuoo='),
    CategoryModel(id: 4, name: 'Biriyani', image: 'https://www.chilipeppermadness.com/wp-content/uploads/2024/10/Chicken-Biryani-Recipe-SQ-scaled.jpg'),

  ];

  final List<ProductModel> _products = [
    ProductModel(id: 1, name: 'Cheese Burger', image: 'https://m.media-amazon.com/images/X/bxt1/M/wbxt1hR1J8QMeq3._SL828_QL90_FMwebp_.png', categoryId: 1, price: 20),
    ProductModel(id: 2, name: 'Veg Burger', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT22nvoGHoamepBZfcdK6IjT1-hd6nQIRlIrw&s', categoryId: 1, price: 15),
    ProductModel(id: 3, name: 'Apple Juice', image: 'https://images.onlymyhealth.com/imported/images/2022/November/19_Nov_2022/main-applejuicebenefits.jpg', categoryId: 2, price: 78),
    ProductModel(id: 4, name: 'Chikoo Juice', image: 'https://5.imimg.com/data5/SELLER/Default/2021/7/CR/CO/FE/26828545/chickoo-juice-500x500.jpg', categoryId: 2, price: 55),
    ProductModel(id: 5, name: 'Veg Pizza', image: 'https://www.orchidsandsweettea.com/wp-content/uploads/2019/05/Veggie-Pizza-2-of-5-e1691215701129.jpg', categoryId: 3, price: 60),
    ProductModel(id: 6, name: 'Butter Pizza', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5q2KjScnELyjvrEWMhwWRQvx2qs6mxKpAg&s', categoryId: 3, price: 90),
    ProductModel(id: 7, name: 'Chicken', image: 'https://cookingfromheart.com/wp-content/uploads/2020/09/Thalassery-Egg-Biriyani-2.jpg', categoryId: 4, price: 90),
    ProductModel(id: 8, name: 'Beef', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxAOW7aTEqMA8kpWO2iaDA85jZoZf2LGqLJA&s', categoryId: 4, price: 90),
    ProductModel(id: 9, name: 'Mutton', image: 'https://www.cubesnjuliennes.com/wp-content/uploads/2021/03/Best-Mutton-Biryani-Recipe.jpg', categoryId: 4, price: 90),
    ProductModel(id: 10, name: 'Mango Juice', image: 'https://images.pexels.com/photos/16557598/pexels-photo-16557598/free-photo-of-fresh-juice-in-a-glass-and-fruits.jpeg', categoryId: 2, price: 30),
    ProductModel(id: 11, name: 'Grilled veg', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWrGAD8JI-54eclD-AXh-K1wuQSpisaHMgNQ&s', categoryId: 3, price: 30),

  ];

  List<CategoryModel> get categories => _categories;

  int get selectedCategoryId => _selectedCategoryId;

  void selectCategory(int id) {
    _selectedCategoryId = id;
    notifyListeners();
  }

  List<ProductModel> get selectedCategoryProducts =>
      _products.where((p) => p.categoryId == _selectedCategoryId).toList();
}
