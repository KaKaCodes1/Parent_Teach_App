import 'package:flutter/material.dart';
import 'package:parentteach/model/articles.dart';

class ArticleCard extends StatelessWidget {
  final Articles articles;
  
  const ArticleCard({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      articles.articleImageUrl,
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
            
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            articles.articleTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
            
                          const SizedBox(height: 8),
            
                          Text(
                            articles.articleDescription,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      )
                      ),
                ],
              ),
              ),
          ),
        ),
      ),
    );
  }
}