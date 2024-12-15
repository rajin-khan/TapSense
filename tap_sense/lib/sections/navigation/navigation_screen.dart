import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:tap_sense/models/lat_long.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tap_sense/models/location_coordinates.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(this.onRestart, {super.key});

  final void Function() onRestart;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();
  final SpeechToText _speechToText = SpeechToText();
  final LocationCoordinates locationFinder = LocationCoordinates();

  // ignore: unused_field
  bool _speechEnabled = false;
  bool _listeningForStart = false;

  @override
  void initState() {
    super.initState();
    _initializeSpeechRecognition();
  }

  void _initializeSpeechRecognition() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening(bool forStartLocation) async {
    _listeningForStart = forStartLocation;
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      if (_listeningForStart) {
        _startController.text = result.recognizedWords;
      } else {
        _destinationController.text = result.recognizedWords;
      }
    });
  }

  String extractInstructions(String input) {
    String result = '';
    RegExp regExp = RegExp(r'instruction:\s*([^,]+),');
    Iterable<RegExpMatch> matches = regExp.allMatches(input);

    for (RegExpMatch match in matches) {
      result += '${match.group(1)!.trim()}, ';
    }

    return result.endsWith(', ')
        ? result.substring(0, result.length - 2)
        : result;
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  Future<void> fetchRoute(LatLng start, LatLng destination) async {
    const String apiKey =
        'insert your api key here';
    const String baseUrl =
        'https://api.openrouteservice.org/v2/directions/driving-car';
    final Dio dio = Dio();

    try {
      final response = await dio.post(
        baseUrl,
        data: {
          "coordinates": [
            [start.longitude, start.latitude],
            [destination.longitude, destination.latitude]
          ],
          "geometry": true
        },
        options: Options(headers: {"Authorization": apiKey}),
      );

      String extractedInstructions =
          extractInstructions(response.data.toString());

      flutterTts.speak(extractedInstructions);
      Clipboard.setData(ClipboardData(text: extractedInstructions));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Directions copied to clipboard.')),
      );
    } catch (e) {
      print('Error fetching route: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to fetch route. Check inputs or API key.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var locationFinder = LocationCoordinates();

    // Extract location names
    List<String> locationNames = locationFinder.getLocationNames();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        Text(
          'NAVIGATION SCREEN',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _startController,
                  cursorColor:
                      Colors.orange.withOpacity(0.8), // Set the cursor color
                  decoration: InputDecoration(
                    labelText: 'START LOCATION',
                    labelStyle: GoogleFonts.poppins(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(
                            0.8), // Set the input line color when focused
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(
                            0.6), // Set the input line color when not focused
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _speechToText.isListening && _listeningForStart
                            ? Icons.mic_rounded
                            : Icons.mic_off_rounded,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        _speechToText.isListening
                            ? _stopListening()
                            : _startListening(true);
                      },
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _destinationController,
                  cursorColor:
                      Colors.grey.withOpacity(0.8), // Set the cursor color
                  decoration: InputDecoration(
                    labelText: 'DESTINATION LOCATION',
                    labelStyle: GoogleFonts.poppins(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(
                            0.8), // Set the input line color when focused
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(
                            0.6), // Set the input line color when not focused
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _speechToText.isListening && !_listeningForStart
                            ? Icons.mic_rounded
                            : Icons.mic_off_rounded,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        _speechToText.isListening
                            ? _stopListening()
                            : _startListening(false);
                      },
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    final startCoords = locationFinder
                        .getCoordinates(_startController.text.toUpperCase())
                        .split(',');
                    final destCoords = locationFinder
                        .getCoordinates(
                            _destinationController.text.toUpperCase())
                        .split(',');

                    if (startCoords.length == 2 && destCoords.length == 2) {
                      try {
                        final start = LatLng(
                          double.parse(startCoords[0].trim()),
                          double.parse(startCoords[1].trim()),
                        );
                        final destination = LatLng(
                          double.parse(destCoords[0].trim()),
                          double.parse(destCoords[1].trim()),
                        );

                        fetchRoute(start, destination);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Invalid coordinates. Use Lat,Lng format.')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Please make sure the spelling of the name of the location is correct.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.orange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.assistant_navigation),
                      Text(
                        'FETCH ROUTE',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '- AVAILABLE LOCATIONS -',
                        style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListView.builder(
                            itemCount: locationNames.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 8.0),
                                child: Text(
                                  locationNames[index],
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () {
            flutterTts
                .speak('Available locations are: ${locationNames.toString()}');
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(Icons.multitrack_audio_rounded),
          label: const Text('READ SCREEN'),
        ),
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
