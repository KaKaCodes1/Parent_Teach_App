import 'package:google_ml_kit/google_ml_kit.dart';

Future<String> recognizeText(String imagePath) async {
  final inputImage = InputImage.fromFilePath(imagePath);

  final textDetector = GoogleMlKit.vision.textDetector();

  final RecognisedText recognizedText =
      await textDetector.processImage(inputImage);
  await textDetector.close();

  String extractedText = '';
  for (TextBlock block in recognizedText.blocks) {
    for (TextLine line in block.lines) {
      extractedText += line.text + '\n';
    }
  }

  return extractedText;
}
