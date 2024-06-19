import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parentteach/screen/home_screen.dart';
import 'package:parentteach/screen/settings_screen.dart';
import '../model/subject.dart';
import 'package:parentteach/model/articles.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/drawer_menu.dart';

class ProfileScreen extends StatefulWidget {
  final List<Subject> subjects;
  final List<Articles> articles;

 ProfileScreen({Key? key, required this.subjects, required this.articles}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

    /*A GlobalKey<ScaffoldState> is used to control the Scaffold. 
  This key allows you to access and manipulate the state of the Scaffold, including opening and closing the drawer.*/
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ButtonStyle thisbutton = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40), 
    backgroundColor: const Color.fromARGB(255, 249, 249, 207),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

    int _selectedIndex= 1;

    //To be able to navigate back to home page using navbar
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen()
            )
          );
      }
      else if(index == 2){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsScreen(subjects: widget.subjects, articles: widget.articles,))
        );
      }      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 254, 230, 119),
      endDrawer:  DrawerMenu(subjects: widget.subjects, articles: widget.articles),//The drawer menu will appear on the right side
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/dad.jpeg'),
            ),
        
            const SizedBox(height: 20,),
        
            itemProfile('Username', "Parent's Username", CupertinoIcons.person),
            const SizedBox(height: 20,),
        
            itemProfile('Phone Number', "0123456789", CupertinoIcons.phone),
            const SizedBox(height: 20,),
        
            itemProfile('Email', "example@gmail.com", CupertinoIcons.mail),
            const SizedBox(height: 20,),
        
            itemProfile('Location', "City, Country", Icons.location_on),
            const SizedBox(height: 20,),
            
            ElevatedButton.icon(
              onPressed: (){
                // Navigator.of(context).pop();
              }, 
              icon: const Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 111),),
              label: const Text(
                'Edit Details',
                style: TextStyle(
                    color: Color.fromARGB(255, 6, 6, 111),
                ),
              ),
              style: thisbutton,
              ),
            
          ],
        ),
      ),
    ),
    
    //bottom navbar
    bottomNavigationBar: BottomNavbar(currentIndex: _selectedIndex, onTap: _onItemTapped,)      

    );
  }

    itemProfile(String title, String subtitle, IconData icon){
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
              subtitle:  Text(subtitle),
              leading:  Icon(icon),
              trailing: const Icon(Icons.arrow_forward_ios),
              //tileColor: Colors.white,
            ),
        );
    }
}