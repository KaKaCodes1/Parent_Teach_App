import 'package:flutter/material.dart';
// import 'package:parentteach/widgets/subject_card.dart';
import 'package:parentteach/model/articles.dart';
import '../model/subject.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/subject_dialog.dart';

class AllsubjectsScreen extends StatelessWidget {
  final List<Subject> subjects;
  final List<Articles> articles;

  AllsubjectsScreen({Key? key, required this.subjects, required this.articles})
      : super(key: key);
  /*A GlobalKey<ScaffoldState> is used to control the Scaffold. 
  This key allows you to access and manipulate the state of the Scaffold, including opening and closing the drawer.*/
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 254, 230, 119),
        endDrawer: DrawerMenu(
          subjects: subjects,
          articles: articles,
        ), //The drawer menu will appear on the right side
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subjects',
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
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
              childAspectRatio:
                  1.0, // Aspect ratio of each tile (width / height)

              //childAspectRatio: 1,
            ),
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const SubjectDialog(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        subjects[index].imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
