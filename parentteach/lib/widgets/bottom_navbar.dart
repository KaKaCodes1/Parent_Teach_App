import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbar({super.key,required this.currentIndex,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
          )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 6, 6, 111),
            unselectedItemColor:  Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                ),
          
            ],

          currentIndex: currentIndex,
          onTap: onTap,
              
            
            ),
        ),
      );
  }
}