<p align="center">
  <img src="https://i.imgur.com/IXTcRvh.png" width="400"/>
</p>

<h1 align="center">✨ An Accessibility App for the Visually Impaired ✨</h1>

<div align="center">

![Flutter](https://img.shields.io/badge/Framework-Flutter-blue?style=for-the-badge&logo=flutter)
![Google ML Kit](https://img.shields.io/badge/AI-Google%20ML%20Kit-FFD700?style=for-the-badge&logo=google)
![iOS](https://img.shields.io/badge/Platform-iOS-white?style=for-the-badge&logo=apple)
![Android](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android)

![Contributions](https://img.shields.io/badge/Contributions-Welcome-crimson?style=for-the-badge&logo=git)
![Accessibility](https://img.shields.io/badge/Accessibility-Priority-FFB6C1?style=for-the-badge&logo=accessible-icon)

</div>

---

<div align="center">

## **🌟 Overview**

**Tap_Sense** is a thoughtfully designed accessibility app tailored for visually impaired users. The app provides intuitive tools to simplify daily tasks, paired with a minimalistic user interface. 

- **Dynamic "READ SCREEN" Buttons**: Ensures easy-to-access text-to-speech functionality at the bottom of every section.
- **Cross-Platform Compatibility**: Developed using **Flutter**, ensuring availability on both iOS and Android platforms.

###### *Please note that the videos used in the demos are in GIF format to give you an idea of what the app looks like. The actual app is much smoother and responsive.*

### **Features at a Glance**
| Section       | Functionality                                       |
|---------------|----------------------------------------------------|
| **Reader**    | Scan text from images and convert it to speech     |
| **To-Do**     | Voice-powered dynamic to-do list creation          |
| **Navigation**| Fetch directions dynamically with voice commands   |
| **Detection** | Identify objects in a scene with confidence levels |

---
![Main Menu Demo](https://github.com/rajin-khan/capstone-sem-8/raw/main/documentation/demovids/mainmenu.gif)

---

## **🔍 Reader**

### **Description**
Leverages **OCR (Optical Character Recognition)** powered by **TensorFlow Lite (TFLite)** to scan text from images and convert it to readable output.
Users can select an image from their gallery or capture one using their device’s camera.

### **Technologies Used**
| Dependency                    | Purpose                             |
|-------------------------------|-------------------------------------|
| **Image Picker Library**      | For selecting or capturing images   |
| **Google ML Kit's Text Recognition** | For extracting text from images     |
| **Flutter's Text-to-Speech**  | For converting text to speech       |

---
![Reader Demo](https://github.com/rajin-khan/capstone-sem-8/raw/main/documentation/demovids/reader.gif)

---

## **🗒️ To-Do**

### **Description**
Uses **speech-to-text** technology to create, store, and delete to-do items dynamically.
Aimed at increasing productivity for visually impaired users by leveraging voice commands.

### **Technologies Used**
| Dependency                    | Purpose                            |
|-------------------------------|------------------------------------|
| **Speech-to-Text Package**    | For voice input                         |
| **Flutter's Text-to-Speech**  | For audio feedback                      |
  | **Hive**                    | NoSQL Database for persistent storage   |

---
![To-Do Demo](https://github.com/rajin-khan/capstone-sem-8/raw/main/documentation/demovids/todo.gif)

---

## **🗺️ Navigation**

### **Description**
Fetches and reads out dynamic directions based on user input via **speech-to-text**.
Copies instructions to the clipboard for convenience and displays a scrollable list of available locations.

### **Technologies Used**
| Dependency                     | Purpose                             |
|--------------------------------|-------------------------------------|
| **Speech-to-Text Package**     | For capturing voice input           |
| **Flutter's Text-to-Speech**   | For voice-guided navigation         |
| **LatLong Package**            | For geolocation                     |
| **Dio Package**                | For making API requests             |

---
![Navigation Demo](https://github.com/rajin-khan/capstone-sem-8/raw/main/documentation/demovids/navigation.gif)

---

## **👓 Detection**

### **Description**
Uses **Google ML Kit's Object Detection model** to identify objects within a scene.
Allows users to either select an image from their gallery or take a live image for detection.
Displays confidence levels for identified objects.

### **Technologies Used**
| Dependency                          | Purpose                            |
|-------------------------------------|------------------------------------|
| **Image Picker Library**            | For selecting or capturing images  |
| **Google ML Kit's Object Detection**| For identifying objects in a scene |
| **Flutter's Text-to-Speech**        | For reading detection results aloud|

---
![Detection Demo](https://github.com/rajin-khan/capstone-sem-8/raw/main/documentation/demovids/detection.gif)

---

## **🎯 Dynamic Features Across All Sections**

- **Text-to-Speech Outputs**: Provides real-time audio feedback for every button, ensuring a consistent and accessible experience.
- **Consistent UI**: The "READ SCREEN" button is always located above the "BACK" button for easy navigation and reduced learning curve.

---

## **🤝 How to Contribute**
We would love contributions from you guys to make **Tap_Sense** even better. You can contribute in a lot of ways:

- **Report Bugs**: Found an issue? Please [open an issue](https://github.com/your-repo/issues) on our GitHub repository.
- **Propose Features**: Have ideas for new features? Let us know through an issue or a pull request.
- **Submit Pull Requests**: Fix bugs or add features by submitting a pull request to our repository.
- **Documentation**: Help improve the README or other documentation files.

### Steps to Contribute:
- Fork the repository.
- Create a new branch (`git checkout -b feature-name`).
- Commit your changes (`git commit -m "Description of changes"`).
- Push to your fork (`git push origin feature-name`).
- Open a pull request.

Your contributions are always appreciated!

---

## **👥 Development Team:**
This project was developed by:

| Name                      | Institution             | ID |
|---------------------------|-------------------------|--  |
| **Rajin Khan**            | North South University | 2212708042 |
| **Saumik Saha Kabbya**    | North South University | 2211204042 |

Star the repo if you wanna support more projects like this!

</div>
