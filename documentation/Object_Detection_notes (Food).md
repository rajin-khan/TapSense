# **Notes on Food Detection using Google's ML Kit and TensorFlow Lite**

---

### **The Plan:**

A. **Use Google ML Kit’s Object Detection library** for real-time food identification.
B. **Reference a custom TensorFlow Lite model** specifically optimized for food detection to enhance accuracy.

*The custom model we plan on using is the **AIY Food Model** from Kaggle ([linked here](https://www.kaggle.com/models/google/aiy)).*

---

### <a href="https://www.ibm.com/topics/object-detection" target="_blank" rel="noreferrer"> <img src="https://static-00.iconduck.com/assets.00/focus-square-icon-2048x2046-qjewfyq7.png" alt="Object Detection" height="20"/></a> **What is Object Detection?**

**Object Detection** is a computer vision technique that allows us to not only identify objects in an image but also determine their location within the image. Unlike simple classification, which just tells us **what** objects are in an image, object detection identifies **where** each object is by drawing bounding boxes around them.

#### **Working Methodology**:
#####   A. Image Input: 
- We feed an image to the object detection model.
   
##### B. Feature Extraction: 
- The model processes the image to extract important features such as edges, colors, and textures. These features help the model distinguish between different objects in the image.
   
##### C. Bounding Boxes and Classification:
- The model then tries to predict the location of objects by drawing **bounding boxes** around them. Each bounding box has associated **coordinates** (X, Y, Width, Height), representing the object's position.
- Once an object is located, the model assigns a **label** to it (such as “apple,” “banana,” etc.) based on the confidence score.
   
##### D. Confidence Scores:
- For every detected object, the model provides a **confidence score**—a probability that reflects how sure it is about the detection. High confidence scores (close to 1) mean the model is more certain about the object.

---

#### **Enter Google ML Kit’s Object Detection Library**

Google ML Kit’s object detection library is a pre-trained machine learning model that detects multiple objects in real-time from the camera or static images. It is optimized for mobile applications, making it fast and efficient, while still accurate enough for most use cases, like ours, which is food detection.

---

### <a href="https://developers.google.com/ml-kit/vision/object-detection" target="_blank" rel="noreferrer"> <img src="https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png" alt="Google ML Kit Object Detection" height="30"/></a> **Google ML Kit’s Object Detection**

#### **Working Methodology**:

##### A. Initialization:
   - The library detects and locates **multiple objects** in a scene, providing **bounding boxes** around each object and giving a confidence score for each one.

##### B. Tracking Objects:
   - ML Kit has the capability to track objects across frames, allowing it to maintain recognition even as the user moves the camera or the object moves.

##### C. Real-time Detection:
   - One of the standout features of ML Kit is its ability to work in real-time, which means users can point their camera at an object, and the detection happens live, without delay.

---

#### **Implementing Google ML Kit’s Object Detection in Our App *(referenced from ChatGPT)***:

1. **Add the ML Kit Dependency**:
   - We will start by adding the object detection library to our Flutter project:
     ```yaml
     dependencies:
       google_mlkit_object_detection: ^0.1.0+1
     ```

2. **Initialize Object Detector**:
   - The next step is initializing the object detection component within the app:
     ```dart
     final objectDetector = ObjectDetector(
       options: ObjectDetectorOptions(
         classifyObjects: true,  // To enable object classification
         mode: DetectionMode.stream,  // For real-time detection
       ),
     );
     ```

3. **Process the Image**:
   - We’ll capture an image from the camera, convert it into a format that ML Kit can process, and run it through the object detector:
     ```dart
     final inputImage = InputImage.fromFilePath(imagePath);
     final detectedObjects = await objectDetector.processImage(inputImage);
     ```

4. **Handle Detected Objects**:
   - Once the image has been processed, we can loop through the detected objects and extract the details, such as bounding boxes and labels:
     ```dart
     for (final object in detectedObjects) {
       final rect = object.boundingBox;
       final labels = object.labels;
       print('Detected object: ${labels[0].text}, bounding box: $rect');
     }
     ```

---

#### The next step,
### <a href="https://developers.google.com/ml-kit/custom-models" target="_blank" rel="noreferrer"> <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/google-tensorflow-icon.png" alt="Custom TensorFlow Lite model" height="30"/></a> **Custom TensorFlow Lite Model for Food Detection**

#### **Why Use a Custom TensorFlow Lite Model?**

While Google ML Kit's object detection is great for general objects, we want to improve the accuracy for specific food items by using a custom-trained model. For this, we are planning to use the **Google AIY Food Model** from **[Kaggle](https://www.kaggle.com/)**, which has been specifically trained to detect food items.

#### **How do TensorFlow Lite Models work?**:
**TensorFlow Lite** is a mobile-optimized, lightweight version of TensorFlow designed to work efficiently on mobile devices. It allows us to deploy machine learning models that are pre-trained for specific tasks, such as food detection. We can either train a model ourselves or use a pre-trained one, like the **Google AIY Food Model**, which is designed for food recognition.

---

#### **Implementing a Custom TensorFlow Lite Model *(referenced from ChatGPT)***:

1. **Find/Train a Custom Model**:
   - In our case, we’ll use the **Google AIY Food Model** from Kaggle.
   - Link: [Google AIY Food Model](https://www.kaggle.com/models/google/aiy)

2. **Convert the Model to TensorFlow Lite** (if necessary):
   - Make sure the model is in TensorFlow Lite format (`.tflite`). If it’s not, we can convert it using TensorFlow’s conversion tool:
     ```bash
     tflite_convert --saved_model_dir=/path/to/saved_model --output_file=/path/to/model.tflite
     ```

3. **Load the Model in Flutter**:
   - We will use the `tflite` package to load and run the TensorFlow Lite model within our Flutter app.
   - In `pubspec.yaml`:
     ```yaml
     dependencies:
       tflite: ^1.1.2
     ```

4. **Initialize the Model in Flutter**:
   - Load the custom model in our app:
     ```dart
     Tflite.loadModel(
       model: "assets/model.tflite",  // Path to TensorFlow Lite model
       labels: "assets/labels.txt",   // Path to labels
     );
     ```

5. **Run Inference on the Image**:
   - Once the model is loaded, we can run inference on the image to detect food items:
     ```dart
     var recognitions = await Tflite.runModelOnImage(
       path: imagePath,  // Path to the image
       imageMean: 0.0,   // Normalize image data
       imageStd: 255.0,
       numResults: 5,    // Number of results to return
       threshold: 0.5,   // Confidence threshold
       asynch: true,
     );
     ```

6. **Process the Results**:
   - The model will return a list of detected food items, which we can use in our app:
     ```dart
     for (var recognition in recognitions!) {
       print('${recognition['label']} with confidence ${recognition['confidence']}');
     }
     ```

---
#### The final step:
### **Referencing Google ML Kit’s Custom Models**

We can further improve detection by using Google ML Kit’s custom model integration, which allows us to combine its object detection API with our custom TensorFlow Lite model.

#### **Using Custom Models with ML Kit *(referenced from ChatGPT)***:
1. **Upload the Custom Model to Firebase**:
   - Upload the TensorFlow Lite model to Firebase’s **Custom Models** section. Follow the documentation here: [Custom Models with Firebase ML](https://developers.google.com/ml-kit/custom-models).

2. **Integrate the Custom Model in the App**:
   - Reference the custom model in the app:
     ```dart
     final customModelManager = FirebaseCustomModelManager();
     final customModel = await customModelManager.getModel("my_food_model");
     final interpreter = Interpreter.fromBuffer(customModel.buffer);
     ```

3. **Run Inference Using the Custom Model**:
   - Similar to basic object detection, we feed the image to the custom model for specialized food recognition.

---

### **TL, DR**:

    1. Integrate Google ML Kit’s Object Detection for general object detection and bounding boxes around food items.

    2. Incorporate a Custom TensorFlow Lite Model** for optimized food detection, using the AIY Food Model from Kaggle.
    
    3. Combine Both: Use Google ML Kit for object detection and tracking, and run objects through the custom model for enhanced food recognition.
    
    4. Optimize Performance: Ensure that the app processes and recognizes food items in real time without any noticeable delay.

---
