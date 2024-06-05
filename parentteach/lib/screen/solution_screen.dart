import 'dart:io';
import 'package:flutter/material.dart';
import 'image_capture_screen.dart';
import '../service/ocr_service.dart';
import '../service/openai_service.dart';

class SolutionScreen extends StatefulWidget {
  @override
  _SolutionScreenState createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  String _solution = '';
  File? imageFile;

  Future<void> processImage() async {
    if (imageFile != null) {
      String extractedText = await recognizeText(imageFile!.path);
      String solution = await getSolution(extractedText);
      setState(() {
        _solution = solution;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Solution')),
      body: Column(
        children: [
          if (_solution.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_solution),
            ),
          ElevatedButton(
            onPressed: () async {
              imageFile = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageCaptureScreen()),
              );
              processImage();
            },
            child: Text('Get Solution'),
          ),
        ],
      ),
    );
  }
}
