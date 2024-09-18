# Project Proposal

## The Problem

The visually impaired, whose number exceeds 295 million people, face numerous challenges in their daily lives. One significant issue they encounter is the **inaccessibility to everyday technology**. They often rely on niche products and services that are either paid or exploitative for performing even the simplest tasks. Although good free services exist, functionalities are scattered across different apps, making it cumbersome to manage.

**Our project** aims to eliminate these problems by providing an **all-in-one solution** in one app that is easy to use and always free.

---

## Introduction

We propose to create an application that empowers individuals with **blindness** or **Moderate Severe Visual Impairment (MSVI)** to perform everyday tasks efficiently and easily through a suite of accessibility tools and features.

Key functionalities include:
- **OCR (Optical Character Recognition)** to generate text-to-speech.
- A **voice-controlled calendar** and reminder system.
- **Real-time navigation** for transportation.
- **Nutritional analysis** using object detection with audio feedback.

The app will integrate existing **APIs** and **frameworks** to deliver fast, reliable, and user-friendly assistance, enhancing the users' independence and daily functionality.

---

## Planned Features

We aim to empower the visually impaired by enhancing four main aspects of their daily lives:

### 1. Education

- **Text Recognition & Audio Output**:  
  Allow users to point their phone at any text, and via OCR, generate audio output for seamless reading.

### 2. Productivity

- **Voice-controlled Calendar and Reminders**:  
  Users can manage their schedules, set reminders, and retrieve events using voice commands.

### 3. Navigation

- **Real-time Navigation and Obstacle Detection**:  
  Provide vocal directions for outdoor navigation and detect obstacles in real-time with camera input.

### 4. Nutrition

- **Nutritional Label Analysis**:  
  Utilize object detection models to analyze food items, read nutritional labels, and provide nutritional data via audio feedback.

---

## Technologies

The following technologies will be utilized for the app (this may be subject to change):

### Education:
- **[Firebase ML Vision](https://firebase.google.com/products/ml)** (Image Recognition)
- **[Google Tesseract](https://github.com/tesseract-ocr/tesseract)** (Text Recognition)
- **[flutter_tts](https://pub.dev/packages/flutter_tts)** (Text-to-Speech Conversion)

### Productivity:
- **[device_calendar](https://pub.dev/packages/device_calendar)** (Event Handling)
- **[speech_to_text](https://pub.dev/packages/speech_to_text)** (Voice Recognition)
- **[flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)** (Reminders)

### Navigation:
- **[Google Maps API](https://developers.google.com/maps)** (Real-time Directions)
- **[Mapbox SDK](https://docs.mapbox.com/flutter/)** (Real-time Directions)
- **[flutter_vibration](https://pub.dev/packages/vibration)** (Haptic Feedback)

### Nutrition:
- **[TensorFlow Lite](https://www.tensorflow.org/lite)** (Object Detection)
- **[Firebase ML Kit](https://firebase.google.com/products/ml)** (Object Detection)
- **[Edamam API](https://developer.edamam.com)** (Nutritional Data)
- **[Nutritionix API](https://www.nutritionix.com/business/api)** (Nutritional Data)
- **[flutter_tts](https://pub.dev/packages/flutter_tts)** (Audio Feedback)


---

## Conclusion

We hope our project can be completed within the given timeframe and have a positive impact on the visually impaired community. Our goal is to create a seamless experience that will improve the lives of millions of users worldwide.
