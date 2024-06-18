import 'package:flutter/material.dart';
import 'package:parentteach/widgets/subject_dialog.dart';

import '../model/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) => const SubjectDialog(),
          );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16.0), // Ensures the top corners are rounded
                  bottom: Radius.circular(16.0), // Ensures the bottom corners are rounded
                ),
              child:Image.asset(
                subject.imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     subject.name,
              //     style: const TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //     ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}