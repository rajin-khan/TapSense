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
  String? extractedText;

  Future<void> _pickImage() async {
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
    //OCR processor
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    extractedText = recognizedText.text;
    print(extractedText); //print to terminal (execute to separate screen later)
    //return extractedText
  }

  /*String? processedOutput() {
    setState(() {
      extractedText == null ? 'Pick image' : extractedText!;
    });
    return extractedText;
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'EDUCATION SCREEN',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _pickImage,
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
          ),
        ),
        //Text(processedOutput()),
        const SizedBox(height: 20),
        TextButton(
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
