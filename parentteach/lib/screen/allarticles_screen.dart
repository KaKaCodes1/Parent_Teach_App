import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';

import '../widgets/article_card.dart';

class AllarticlesScreen extends StatelessWidget {
  final List<Articles> articles;
  
  const AllarticlesScreen({ required this.articles});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 230, 119),
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

            Icon(
              Icons.menu, 
              color: Colors.black,
            ),
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