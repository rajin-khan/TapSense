import 'dart:io';
import 'package:flutter/material.dart';

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
  String scannedText = ''; //placeholder for output text on screen

  Future<void> _pickImage() async { //image picker function
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

  Future<void> _processImage() async { //image processor
    //OCR processor
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    extractedText = recognizedText.text;
  }

  void _processedOutput() { //for showing the processed output
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
        Text( //header
          'ADD AN IMAGE',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18),
        TextButton.icon( //button for image picking
          onPressed: _pickImage,
          label: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        TextButton( //output viewer button
          onPressed: _processedOutput,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text('SHOW OUTPUT'),
        ),
        Container( //output section
          height: 550,
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Text(
              scannedText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton( //back button
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
