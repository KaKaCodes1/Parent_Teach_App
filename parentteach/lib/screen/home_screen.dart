import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';
import 'package:parentteach/screen/allsubjects_screen.dart';
import 'package:parentteach/widgets/article_card.dart';
import 'package:parentteach/widgets/subject_card.dart';

import '../model/subject.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Subject> subjects= [
    Subject(name: 'Math', imageUrl: 'assets/images/math.gif'),
    Subject(name: 'English', imageUrl: 'assets/images/eng.gif'),
    Subject(name: 'Technology', imageUrl: 'assets/images/tech.gif'),
    Subject(name: 'Science', imageUrl: 'assets/images/science.gif'),
    Subject(name: 'Art', imageUrl: 'assets/images/art.gif'),
    Subject(name: 'Geography', imageUrl: 'assets/images/geo.gif'),
    Subject(name: 'History', imageUrl: 'assets/images/history.gif'),
  ];

  final List<Articles> articles =[
    Articles(articleTitle: 'ParentTeach Semminar', articleImageUrl: 'assets/images/small logo (1).png', articleDescription: 'Preview of what happened at our annual seminar'),
    Articles(articleTitle: 'How AI is changing Education', articleImageUrl: 'assets/images/aischool.jpeg', articleDescription: 'New age in technology is here. See how it is being used in schools'),
    Articles(articleTitle: "Importance of Both Parents' Involvement In Their children's education", articleImageUrl: 'assets/images/onboarding1.png', articleDescription: 'See why we encourage both parents to get involved'),
    Articles(articleTitle: 'ParentTeach Updates', articleImageUrl: 'assets/images/small logo (1).png', articleDescription: "Here are our recent updates. Don't be left behind, stay in the loop. "),  
    ];

  bool showAll = false; //This will help me  choose how many cards will be seen on the listview

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 254, 230, 119), 
      body: ListView(
        children: [
          Padding(
          padding: const EdgeInsets.all(15.0),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/small logo (1).png',
                height: 50,
                width: 50,
                ),
        
                const Icon(
                  Icons.menu, 
                  color: Colors.black,
                  ),
            ],
          ),
          ),
      
          const Padding(
            padding:  EdgeInsets.only(left: 15.0),
            child: Text(
              'Browse Subjects',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ),
      
            const SizedBox(height: 15.0),
      
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 158,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: showAll ? subjects.length : 4 + 1, // 4 cards + 1 for More button
                        itemBuilder: (context, index){
                          // return SubjectCard(subject: subjects[index]);
                          if(!showAll && index == 4){
                            return Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => AllsubjectsScreen(subjects: subjects,)
                                      ),
                                      );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove default padding
                                ), 
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/moreicon.png',
                                      width: 40,
                                      height: 40,
                                    ),
                              
                                    const SizedBox(height: 3,),
                              
                                    const Text('More',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)
                                      )
                                  ]          
                                )
                          ),
                            );
                          }
                          else{
                            return SubjectCard(subject: subjects[index]);
                          }
                        }
                        ),
                    ),
                  ),
      
                  
                ],
              ),
            ), 
        
            const SizedBox(height: 20.0),
      
            const Padding(
            padding:  EdgeInsets.only(left: 15.0),
            child: Text(
              'Browse Articles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ),
      
            ListView.builder(
              //shrinkWrap and NeverScrollableScrollPhysics() prevent scroll conflict
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index){
                  return ArticleCard(articles: articles[index]);
                }
              ),
        ]
      ),
    );
  }
}