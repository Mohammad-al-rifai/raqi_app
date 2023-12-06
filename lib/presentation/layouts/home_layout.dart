import 'package:flutter/material.dart';
import 'package:raqi_test_app/app/resources/colors_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.primary,
        selectedItemColor: ColorManager.darkPrimary,
        unselectedItemColor: ColorManager.lightPrimary,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Apple',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Businees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Tesla',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Wall Street',
          ),
        ],
      ),
    );
  }
}
