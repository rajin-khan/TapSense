import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:image_picker/image_picker.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen(this.onRestart, {super.key});
  final void Function() onRestart;

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _imageFile;

  String? _objectName;
  String outputObject = "";

  double? _objectConfidence;
  double outputConfidence = 0;

  final FlutterTts flutterTts = FlutterTts();

  Future<void> _pickImage() async {

    flutterTts.speak("You are now picking an image.");
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _processImage();
    }
  }

  Future<void> _takeImage() async {

    flutterTts.speak("You are now taking an image.");
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _processImage();
    }
  }

  Future<void> _processImage() async {
    flutterTts.speak("Your image has been picked. Tap the button on top to know what you are looking at.");
    final inputImage = InputImage.fromFilePath(_imageFile!.path);

    final objectDetector = ObjectDetector(
      //configure object detector
      options: ObjectDetectorOptions(
        mode: DetectionMode.single,
        classifyObjects: true,
        multipleObjects: false,
      ),
    );

    final List<DetectedObject> objects =
        await objectDetector.processImage(inputImage);

    for (DetectedObject detectedObject in objects) {
      //final rect = detectedObject.boundingBox;
      //final trackingId = detectedObject.trackingId;

      for (Label label in detectedObject.labels) {
        //print('${label.text} ${label.confidence}');
        _objectName = label.text;
        _objectConfidence = label.confidence;
      }
    }

    objectDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Text(
          'OBJECT DETECTION',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 250,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                outputObject = _objectName!;
                outputConfidence = (_objectConfidence! * 100);
                flutterTts.speak("I'm ${outputConfidence.toStringAsPrecision(2)}% confident you're looking at $outputObject");
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.orange,
            ),
            child: Text(
              'WHAT AM I LOOKING AT?',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers the text widgets vertically
            children: [
              Text(
                outputObject.toUpperCase(),
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "CONFIDENCE: ${outputConfidence.toStringAsPrecision(2)}%",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "(This works best if there is a single, defined subject in your image)",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 160,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.add_a_photo_rounded, color: Colors.black),
                          Text(
                            'PICK IMAGE',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 160,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _takeImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.add_a_photo_rounded, color: Colors.white),
                          Text(
                            'TAKE IMAGE',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () {
            if (outputConfidence == 0) {
              flutterTts.speak("You haven't picked an image for me to see. Pick one!");
            } else {
              flutterTts.speak("I'm ${outputConfidence.toStringAsPrecision(2)}% confident you're looking at $outputObject");
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded, color: Colors.white),
          label: const Text('READ SCREEN'),
        ),
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
