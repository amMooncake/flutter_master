import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pizza_repository/pizza_repository.dart';
import 'pizzaCollection.dart';

class PizzaInputFormScreen extends StatefulWidget {
  const PizzaInputFormScreen({super.key});

  @override
  State<PizzaInputFormScreen> createState() => _PizzaInputFormScreenState();
}

class _PizzaInputFormScreenState extends State<PizzaInputFormScreen> {
  PizzaCollectionRepository pizzaCollectionRepository = PizzaCollectionRepository();

  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  final _discountController = TextEditingController();

  final _caloriesController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatController = TextEditingController();
  final _proteinsController = TextEditingController();

  final _nameController = TextEditingController();
  final _picturePathController = TextEditingController();
  final _priceController = TextEditingController();
  final _spicyController = TextEditingController();

  bool _isVegetarian = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    _discountController.dispose();
    _caloriesController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _proteinsController.dispose();
    _nameController.dispose();
    _picturePathController.dispose();
    _priceController.dispose();
    _spicyController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final PizzaCollection newPizza = PizzaCollection(
        description: _descriptionController.text,
        discount: int.parse(_discountController.text),
        isVeg: _isVegetarian,
        name: _nameController.text,
        picture: _picturePathController.text,
        price: int.parse(_priceController.text),
        spicy: int.parse(_spicyController.text),
        calories: int.parse(_caloriesController.text),
        carbs: int.parse(_carbsController.text),
        fat: int.parse(_fatController.text),
        proteins: int.parse(_proteinsController.text),
      );

      if (await pizzaCollectionRepository.CreatePizza(newPizza)) {
        print("ok");
      } else {
        print("nie ok");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade200,
          onSurface: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Basic Information'),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Pizza Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _picturePathController,
                      decoration: const InputDecoration(
                        labelText: 'Picture Path',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _priceController,
                      decoration: const InputDecoration(
                        labelText: 'Price (\$)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _discountController,
                      decoration: const InputDecoration(
                        labelText: 'discount (\$)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 75,
                          child: TextFormField(
                            controller: _spicyController,
                            decoration: const InputDecoration(
                              labelText: 'spicy',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^[1-3]')),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter 1, 2 or 3';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          children: [
                            const Text('Vegetarian'),
                            const SizedBox(width: 10),
                            Switch(
                                value: _isVegetarian,
                                onChanged: (value) {
                                  setState(() {
                                    _isVegetarian = value;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Nutritional Info
                    const Text('Nutritional Information'),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _caloriesController,
                            decoration: const InputDecoration(
                              labelText: 'Calories',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _proteinsController,
                            decoration: const InputDecoration(
                              labelText: 'Proteins (g)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _fatController,
                            decoration: const InputDecoration(
                              labelText: 'Fat (g)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _carbsController,
                            decoration: const InputDecoration(
                              labelText: 'Carbs (g)',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: _submitForm,
                        child: const Text('Save Pizza', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          // Clear all text controllers
                          // Instead of clear(), set text directly
                          _nameController.text = '';
                          _picturePathController.text = '';
                          _descriptionController.text = '';
                          _priceController.text = '';
                          _discountController.text = '';
                          _spicyController.text = '';
                          _caloriesController.text = '';
                          _carbsController.text = '';
                          _fatController.text = '';
                          _proteinsController.text = '';
                          setState(() {
                            _isVegetarian = false;
                          });
                        },
                        child: const Text('clear Inputs', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
