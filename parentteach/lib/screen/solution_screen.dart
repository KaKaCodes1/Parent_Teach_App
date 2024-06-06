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
      appBar: AppBar(
        title: Text('Solution'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_solution.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _solution,
                      style: TextStyle(
                        color: Colors
                            .white, // Ensure text is readable on the background
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    File? pickedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageCaptureScreen()),
                    );
                    if (pickedImage != null) {
                      setState(() {
                        imageFile = pickedImage;
                      });
                      processImage();
                    }
                  },
                  child: Text('Get Solution'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
