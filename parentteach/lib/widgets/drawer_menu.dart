import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';
import 'package:parentteach/model/subject.dart';
import 'package:parentteach/screen/allarticles_screen.dart';
import 'package:parentteach/screen/allsubjects_screen.dart';
import 'package:parentteach/screen/home_screen.dart';
import 'package:parentteach/screen/profile_screen.dart';

class DrawerMenu extends StatelessWidget {
  final List<Subject> subjects;
  final List<Articles> articles;

  //const DrawerMenu({super.key, required this.subjects, required this.articles});

  DrawerMenu({Key? key, required this.subjects, required this.articles}) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 6, 6, 111),
            ),

            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Closes the drawer after tap
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => ProfileScreen(subjects: subjects, articles: articles,)));
              },
              child: const Column(
                children: [
                   CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/dad.jpeg'),
                  ),
              
                  Text(
                    "Parent's Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
            ),
            // child: const Text(
            //   'Menu',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 24,
            //   ),
            // ),
            ),

            ListTile(
              leading: const Icon(Icons.home, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer after tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen())
                   );
              },
            ),

            ListTile(
              leading: const Icon(Icons.article, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Articles'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer after tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllarticlesScreen(subjects: subjects, articles: articles,))
                   );
              },
            ),

            ListTile(
              leading: const Icon(Icons.book, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Subject'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer after tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AllsubjectsScreen(subjects: subjects, articles: articles,))
                  
                   );
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.help, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer after tap
              },
            ),                                    
        ],
      ),
    );
  }
}