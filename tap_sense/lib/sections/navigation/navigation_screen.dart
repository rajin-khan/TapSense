import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tap_sense/models/lat_long.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
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

  String extractInstructions(String input) {
    String result = '';

    // Use a regular expression to find all occurrences of "instruction: (text until the next comma)"
    RegExp regExp = RegExp(r'instruction:\s*([^,]+),');

    // Extract all matches
    Iterable<RegExpMatch> matches = regExp.allMatches(input);

    for (RegExpMatch match in matches) {
      // Group 1 contains the instruction text
      result += '${match.group(1)!.trim()}, ';
    }

    // Remove the trailing comma and space, if any
    if (result.endsWith(', ')) {
      result = result.substring(0, result.length - 2);
    }

    return result;
  }

  Future<void> fetchRoute(LatLng start, LatLng destination) async {
    const String apiKey =
        'your api key';
    const String baseUrl =
        'https://api.openrouteservice.org/v2/directions/driving-car';
    final Dio dio = Dio();

    final FlutterTts flutterTts = FlutterTts();

    try {
      // Make API request
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

      // Log the full API response
      print('API Response: ${response.data}');
      flutterTts.speak(extractInstructions(response.data.toString()));
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
                  style: const TextStyle(color: Colors.white),
                  controller: _startController,
                  decoration: const InputDecoration(
                    labelText: 'Start (Lat,Lng)',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _destinationController,
                  decoration: const InputDecoration(
                    labelText: 'Destination (Lat,Lng)',
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
                    final startCoords = locationFinder.getCoordinates(_startController.text).split(',');
                    final destCoords = locationFinder.getCoordinates(_destinationController.text).split(',');

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
                        print('Invalid coordinate format: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Invalid coordinates. Use Lat,Lng format.')),
                        );
                      }
                    } else {
                      print('Invalid input format.');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Please enter valid coordinates in Lat,Lng format.')),
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
            ],
          ),
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
