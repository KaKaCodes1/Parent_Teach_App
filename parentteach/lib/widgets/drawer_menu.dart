import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';
import 'package:parentteach/model/subject.dart';
import 'package:parentteach/screen/allarticles_screen.dart';
import 'package:parentteach/screen/allsubjects_screen.dart';
import 'package:parentteach/screen/home_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.subjects, required this.articles});

  //const DrawerMenu({super.key, required this.subjects, required this.articles});

  final List<Subject> subjects;
  final List<Articles> articles;
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 6, 6, 111),
            ),

            child: Column(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllarticlesScreen(articles: articles,))
                   );
              },
            ),

            ListTile(
              leading: const Icon(Icons.book, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Subject'),
              onTap: () {
                try{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  AllsubjectsScreen(subjects: subjects,))
                  
                   );
                }catch(e){
                  print(e);
                }

              },
            ),
            
            ListTile(
              leading: const Icon(Icons.help, color:  Color.fromARGB(255, 6, 6, 111),),
              title: const Text('Help'),
              onTap: () {

              },
            ),                                    
        ],
      ),
    );
  }
}