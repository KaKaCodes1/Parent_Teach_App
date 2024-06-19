import 'package:flutter/material.dart';
import 'package:parentteach/screen/home_screen.dart';
import 'package:parentteach/screen/login_screencopy.dart';
import 'package:parentteach/screen/profile_screen.dart';

import '../model/articles.dart';
import '../model/subject.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/drawer_menu.dart';

class SettingsScreen extends StatefulWidget {
  final List<Subject> subjects;
  final List<Articles> articles;

  SettingsScreen({Key? key, required this.subjects, required this.articles}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //styling the button
  final ButtonStyle thisbutton = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40), 
    backgroundColor: const Color.fromARGB(255, 249, 249, 207),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );  

  /*A GlobalKey<ScaffoldState> is used to control the Scaffold. 
  This key allows you to access and manipulate the state of the Scaffold, including opening and closing the drawer.*/
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //this is used to manage the navigation on the bottom navbar
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(subjects: widget.subjects, articles: widget.articles,))
        );
      }
      else if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen())
        );
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 254, 230, 119),
      endDrawer: DrawerMenu(subjects: widget.subjects, articles: widget.articles,),//The drawer menu will appear on the right side
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

          ],
        ),
        backgroundColor: const Color.fromARGB(255, 254, 230, 119),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context)=>ProfileScreen(subjects: widget.subjects, articles: widget.articles))
                    );
                },
                child: itemProfile('Change Personal Data', Icons.person),
        
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              GestureDetector(
                onTap: () {
                   Navigator.of(context).pop();
                },
                child: itemProfile('Change Password', Icons.lock),
        
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              GestureDetector(
                onTap: () {
                   Navigator.of(context).pop();
                },
                child: itemProfile('Change Language', Icons.language),              
        
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              GestureDetector(
                onTap: () {
                   Navigator.of(context).pop();
                },
                child: itemProfile('Get Premium', Icons.star),              
        
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              GestureDetector(
                onTap: () {
                   Navigator.of(context).pop();
                }, 
                child: itemProfile('Refer & Earn', Icons.share),             
        
              ),
        
              const SizedBox(
                height: 50,
              ),
        
              Center(
                child: 
                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(builder: (context) =>const LoginScreencopy()),
                        (Route<dynamic> route) => false, // This removes all previous routes
                        );
                    }, 
                    icon: const Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 111),),
                    label: const Text(
                      'Log Out!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 6, 6, 111),
                      ),
                    ),
                    style: thisbutton,
                    ),              
              )   
                      
            ],
          ),
        
        
        ),
      ),

      //bottom navbar
      bottomNavigationBar: BottomNavbar(currentIndex: _selectedIndex, onTap: _onItemTapped,)      
     
    );
  }
    itemProfile(String title, IconData icon){
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 7,
              spreadRadius: 2,
              offset: const Offset(0,3),
            )
          ]
          ),
          child: ListTile(
            title:  Text(title),
            leading:  Icon(icon),
            trailing: const Icon(Icons.arrow_forward_ios),
            //tileColor: Colors.white,
          ),
      );
  }
}