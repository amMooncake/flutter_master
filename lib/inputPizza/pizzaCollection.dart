import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:pizza_repository/pizza_repository.dart';

class PizzaCollection {
  String description;
  int discount;
  bool isVeg;
  String name;
  String picture;
  int price;
  int spicy;

  int calories;
  int carbs;
  int fat;
  int proteins;

  PizzaCollection({
    required this.description,
    required this.discount,
    required this.isVeg,
    required this.name,
    required this.picture,
    required this.price,
    required this.spicy,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.proteins,
  });
}

class PizzaCollectionRepository {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');
  static const uuid = Uuid();

  Future<bool> CreatePizza(PizzaCollection pizza) async {
    try {
      var id = uuid.v1();
      await pizzaCollection.doc(id).set({
        'description': pizza.description,
        'discount': pizza.discount,
        'isVeg': pizza.isVeg,
        'macros': {
          'calories': pizza.calories,
          'carbs': pizza.carbs,
          'fat': pizza.fat,
          'proteins': pizza.proteins,
        },
        'name': pizza.name,
        'picture': pizza.picture,
        'pizzaId': id,
        'price': pizza.price,
        'spicy': pizza.spicy,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
