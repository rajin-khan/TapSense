# Outline:

- ## Main Idea: 

- To build an all-in-one **accessibility app** (using **Flutter** for **cross-platform development**) for the **visually impaired** that contains features to make everyday tasks easier.

### Section A:

#### Text to Audio using Image Processing:

- The idea is to use an existing image processing library like **Firebase ML Kit** or **Google's Tesseract OCR** for text recognition from images. The user would capture an image of the text using the camera and convert the recognized characters into audio using Flutter's **Text-to-Speech (TTS)** plugin. 
*(Optionally, for Braille, libraries like **OpenCV** (to detect circles/bumps and process the grascale image) and trying to find niche libraries to handle the processing may be the best bet, although this may be **obsolete** as almost anything available **in Braille** may also be available in **plain text**)*

- **Planned usage API/Library**:

  - **Firebase ML Vision** (for image recognition)
  - **flutter_tts** (for text-to-speech conversion)

---

### Section B:

#### Voice-based Calendar and Reminder System:

- For this feature, we plan on integrating the phone’s native calendar APIs or use Flutter packages like **device_calendar** to create, update, and retrieve events. We also plan to use Flutter’s **speech_to_text** package to allow users to set reminders and events via voice commands.

- **Planned usage API/Library**:

  - **device_calendar** (for event handling)
  - **speech_to_text** (for voice recognition)
  - **flutter_local_notifications** (for reminders)

---

### Section C:

#### Real-time Directions (for Transportation):

- For this, we would like to use, perhaps the **Google Maps API** or **Mapbox SDK** to provide real-time directions. We would focus on enhancing accessibility with voice-guided directions using **flutter_tts** and vibration alerts for turns or stops with **flutter_vibration**. We would have to ensure the app pulls live data on public transport and nearby stops. Furthermore, a voice activated feature would allow the user to hold the camera in front for immediate obstacle detection and real-time feedback.

- **Planned usage API/Library**:

  - **Google Maps Flutter** or **Mapbox SDK** (for real-time directions)
  - **flutter_tts** (for voice guidance)
  - **flutter_vibration** (for haptic feedback)

---

### Section D:

#### Nutritional Analysis (Object Detection with Audio Feedback):

- For this, we may use object detection models like **TensorFlow Lite** or **Firebase ML Kit** for identifying food items. Once identified, we can integrate a nutritional database API like **Edamam** or **Nutritionix** to fetch nutritional information and provide audio feedback with **flutter_tts**.

- **Planned usage API/Library**:

  - **TensorFlow Lite** or **Firebase ML Kit** (for object detection)
  - **Edamam API** or **Nutritionix API** (for nutritional data)
  - **flutter_tts** (for audio feedback)

---
