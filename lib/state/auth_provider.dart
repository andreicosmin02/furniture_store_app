import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userRole;

  bool get isLoggedIn => _isLoggedIn;
  String? get userRole => _userRole;

  void login(String email, String password) {
    // Mock login - will be replaced with actual login logic later
    _isLoggedIn = true;
    _userRole = email.contains('admin') ? 'admin' : 'user';
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userRole = null;
    notifyListeners();
  }

  
}