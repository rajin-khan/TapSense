import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen(this.onRestart, {super.key});
  final void Function() onRestart;

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  File? _imageFile; //creates the image file

  String? extractedText; //for storing the text after processing
  String scannedText = "Nothing scanned yet. Tap the button above to scan from an image!";

  final FlutterTts flutterTts = FlutterTts();

  Future<void> _pickImage() async {
    //image picker function
    //image picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _processImage();
    }
  }

  Future<void> _processImage() async {
    //image processor
    //OCR processor
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    extractedText = recognizedText.text;
  }

  void _processedOutput() {
    //for showing the processed output
    setState(() {
      scannedText = extractedText!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        Text(
          'TEXT RECOGNITION',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        ElevatedButton(
          onPressed: _pickImage,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            backgroundColor: Colors.black,
          ),
          child: const Icon(Icons.add_rounded,
              color: Colors.orange), // icon of the button
        ),
        const SizedBox(height: 18),
        TextButton(
          onPressed: _processedOutput,
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.orange,
            padding: const EdgeInsets.all(10),
            textStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text('SHOW OUTPUT'),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  scannedText,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          //screen reader
          onPressed: () {
            flutterTts.speak(
              //check utterance id to verify working
              scannedText,
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded),
          label: const Text('READ SCREEN'),
        ),
        const SizedBox(height: 5),
        TextButton(
          //back button
          onPressed: widget.onRestart,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('BACK'),
        ),
      ],
    );
  }
}
