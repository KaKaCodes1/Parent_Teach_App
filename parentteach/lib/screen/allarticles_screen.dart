import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';
import '../model/subject.dart';
import '../widgets/article_card.dart';
import '../widgets/drawer_menu.dart';

class AllarticlesScreen extends StatelessWidget {
  final List<Subject> subjects;
  final List<Articles> articles;
  
  AllarticlesScreen({Key? key, required this.articles, required this.subjects}) : super(key: key);

    /*A GlobalKey<ScaffoldState> is used to control the Scaffold. 
  This key allows you to access and manipulate the state of the Scaffold, including opening and closing the drawer.*/
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 254, 230, 119),
      endDrawer: DrawerMenu(subjects: subjects, articles: articles,),//The drawer menu will appear on the right side
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Articles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            // Icon(
            //   Icons.menu, 
            //   color: Colors.black,
            // ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 254, 230, 119),
        elevation: 0,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length , 
        itemBuilder: (context, index){
          return ArticleCard(articles: articles[index]);
        }
      )
    );
  }
}