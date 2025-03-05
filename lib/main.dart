import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/app.dart';
import 'package:pizza_app/inputPizza/pizzaInputForm.dart';
// import 'package:pizza_app/simple_bloc_observer.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize Firebase App Check
  await FirebaseAppCheck.instance.activate(
    // For development, use debug provider
    // For production, use one of the attestation providers
    androidProvider: AndroidProvider.debug,
    //for production - androidProvider: AndroidProvider.playIntegrity
  );

  // Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo())); // when you want to use app
  // runApp(const PizzaInputFormScreen()); // when you want to add new pizzas
}
