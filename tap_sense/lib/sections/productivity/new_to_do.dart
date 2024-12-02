import 'package:flutter/material.dart';
import 'package:tap_sense/models/to_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NewToDo extends StatefulWidget {
  const NewToDo({super.key, required this.onAddToDo});

  final void Function(ToDo toDo) onAddToDo;

  @override
  State<NewToDo> createState() {
    return _NewToDoState();
  }
}

class _NewToDoState extends State<NewToDo> {
  final _titleController = TextEditingController();

  final SpeechToText _speechToText =
      SpeechToText(); //creates speechtotext object
  bool _speechEnabled = false; //bc it's not listening initially
  String _wordsSpoken = "";

  @override
  void initState() {
    super.initState();
    initSpeech(); //call the stt object initializer
  }

  void initSpeech() async {
    _speechEnabled =
        await _speechToText.initialize(); //we wait for it to initialize
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
        onResult: _onSpeechResult); //as we listen, we show the confidence level
    setState(() {
      //_confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    //the method that stores the spoken words
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      //_confidenceLevel = result.confidence;
    });
    //print(_wordsSpoken);
  }

  void _submitToDoData() {
    if (_wordsSpoken.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Text(
            'Invalid input',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          content: Text(
            'Please make sure a valid title was entered.',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Okay',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddToDo(
      ToDo(title: _wordsSpoken),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _wordsSpoken, //this is where we show the words being recognized
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          IconButton(
            onPressed:
                _speechToText.isListening ? _stopListening : _startListening,
            icon: Icon(
              _speechToText.isNotListening
                  ? Icons.mic_off_rounded
                  : Icons.mic_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _speechToText
                    .isListening //ternary operator to show one thing if listening
                ? "Listening..."
                : _speechEnabled //another nested ternary operator
                    ? "Tap the microphone to input an item!"
                    : "Speech not available",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); //closes currently open menu and reverts to last one
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _submitToDoData();
                },
                child: Text(
                  'Save To-Do',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
