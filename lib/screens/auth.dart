import 'dart:io';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

// widgets
import 'package:flutter_chat_app/widgets/user_image_picker.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredUsername = '';
  File? _selectedImage;
  bool _isAuthenticating = false;

  void _submit() async {
    _isAuthenticating = true;
    setState(() {});

    final isValid = _formKey.currentState!.validate();

    if (!isValid || (!_isLogin && _selectedImage == null)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred. Please check your input.'),
        ),
      );
      _isAuthenticating = false;
      setState(() {});
      return;
    }

    _formKey.currentState!.save();

    try {
      if (_isLogin) {
        //DELETEME
        // ignore: unused_local_variable
        final userCredential = await _firebase.signInWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
        final storageRef = FirebaseStorage.instance.ref().child('user_images').child('${userCredential.user!.uid}.jpg');
        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        await FirebaseFirestore.instance.collection('users').doc('${userCredential.user!.uid}').set({
          'userName': _enteredUsername,
          'email': _enteredEmail,
          'image_url': imageUrl,
        });
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'An error occurred'),
        ),
      );
      _isAuthenticating = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/chat.png',
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!_isLogin) UserImagePicker(onPickImage: (pickedImage) => _selectedImage = pickedImage),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Email Adress'),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty || !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                decoration: const InputDecoration(labelText: 'Username'),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length < 4) {
                                    return 'Please enter a valid username (at least 4 characters)';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredUsername = value!;
                                },
                              ),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            if (_isAuthenticating) const CircularProgressIndicator(),
                            if (!_isAuthenticating)
                              ElevatedButton(
                                onPressed: _submit,
                                child: Text(_isLogin ? 'Login' : 'Signup'),
                              ),
                            if (!_isAuthenticating)
                              TextButton(
                                onPressed: () {
                                  _isLogin = !_isLogin;
                                  setState(() {});
                                },
                                child: Text(
                                  _isLogin ? 'Create an account' : "I already have an account",
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
