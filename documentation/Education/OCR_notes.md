# **Notes on OCR and AI/ML Concepts**

---

## **OCR (Optical Character Recognition) in a nutshell:**

OCR, or **Optical Character Recognition**, is a technology that allows computers to "read" and understand text from images. When an image is captured (*whether it's a handwritten note, a printed page, or a digital document*) the computer only sees **shapes, colors, and patterns**. OCR steps in to analyze these shapes (*letters, numbers, etc.*) and converts them into actual editable text that we can work with.

---

### **Working methodology**:

#### *A. Image Pre-processing:*

   This step prepares the image to make the text clearer for the OCR algorithm. The goal is to clean up any noise in the image. Techniques include things like:

   - **Grayscale conversion**: Turning the image into shades of gray to make text stand out.
   - **Thresholding**: Separating the foreground text from the background by converting the image into pure black and white.
   - **Noise reduction**: Removing any unwanted dots, smudges, or irregularities to make the text clearer.

#### *B. Character recognition:*

   Once the image is cleaned up, the OCR software starts recognizing individual characters. It does this by comparing the shapes of letters in the image with a database of known characters. For instance, when it sees the shape of an "A," it matches it with the "A" in its database.

#### *C. Post-Processing:*

   After recognizing the characters, the OCR software needs to ensure the text is readable and makes sense. This involves correcting any errors, especially with words that might not have been recognized correctly. Sometimes OCR tools use language models to predict and correct words based on context.

---


## THE TWO CHOICES:

###  <a href="https://firebase.google.com/docs/ml-kit" target="_blank" rel="noreferrer"> <img src="https://koenig-media.raywenderlich.com/uploads/2018/08/ML-Kit-for-Firebase-badge-light.png" alt="Firebase ML" height="30"/></a> **Firebase ML Vision:**

Firebase ML Vision is a tool by **Google’s Firebase platform** that lets devs add machine learning capabilities to their apps without needing to build complex models from scratch. It includes stuff like **image labeling**, **face detection**, and most importantly for our project, **text recognition (OCR)**.

#### **Working methodology for Firebase ML Vision:**:

#### *A. Integration with Flutter:* 

   Firebase ML Vision is easy to integrate with Flutter (which we will be using it for our project). Once Firebase is set up, we just need to add the necessary dependencies and connect the app to Firebase's ML Kit. Afterward, we can use its **on-device OCR capabilities** to recognize text from images locally without requiring an internet connection. This is great because it’s fast and doesn’t rely on network speed.

#### *B. Text Recognition:* 

   In the case of OCR, Firebase ML Vision scans the image, looks for recognizable text, and converts it into a machine-readable format. This works for printed text in documents, signs, and labels. One of the cool features of Firebase ML Vision is that it’s optimized for mobile apps, meaning it’s lightweight and can work offline, making it perfect for fast, real-time text recognition.

#### *C. How it fits in our app:*  

   By using Firebase ML Vision for text recognition, we can let users take a picture of something (like a printed document) and quickly convert the image into text that they can listen to or save for later. The fact that Firebase does a lot of the heavy lifting makes it easier for us to focus on the app's user interface and experience (along with the implementation).

---

### The alternate choice: 
### <a href="https://github.com/tesseract-ocr/tesseract" target="_blank" rel="noreferrer"> <img src="https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png" alt="Tesseract OCR repo" height="30"/></a> *Google Tesseract OCR:*

**Google Tesseract OCR** is an open-source OCR engine that's been around for a while and is known for its flexibility and accuracy in recognizing text in images. It's offers a bit more control than Firebase ML Vision, meaning we have to do more of the work, but it offers more customization, especially when dealing with complex documents or multiple languages, which is why it was considered at all in the first place.

#### **Working methodology for Tesseract OCR:**:

#### *A. Installation and setup:*

   Tesseract is a standalone tool, so we have to install it separately and set it up to work within the Flutter app. Once we have it configured, we can call it to perform OCR on any images we capture within the app.

#### *B. Image Pre-processing:* 

   The main thing about Tesseract is that it performs best when the images are pre-processed properly. That includes tasks like:

   - **Grayscale conversion** and **thresholding**, just like in general OCR, to clean up the image.
   - **Deskewing**: Correcting any tilt in the image so that the text is properly aligned.
   - **Noise removal**: Getting rid of background noise that might confuse the OCR engine.

#### *C. Character Recognition:*

   Tesseract then goes through the image and identifies each character by comparing the shapes of the letters in the image to known characters in its database. Tesseract is known for supporting a wide variety of languages, which is really useful if we ever need to expand the app's language support.

#### *D. Output:*

   Once Tesseract recognizes the text, it outputs it as editable text. This can be saved, displayed in the app, or converted to audio (which is one of the key features we'll be working on). The advantage of Tesseract is that it’s highly customizable and works well with different languages and formats, but it might be slower and require more pre-processing than Firebase ML Vision.

---


##### *The Final Choice:*

- **Firebase ML Vision** is faster, easier to implement, and works offline, which makes it ideal for mobile apps that need quick text recognition. It’s also more user-friendly since Google has optimized it for app development.

- **Tesseract** offers more flexibility and can be highly customized for different types of documents, languages, and complex layouts. It requires more setup but is more powerful for advanced OCR tasks.

---

All things considered, as mentioned earlier because of its ease of use and available integration with Flutter, we will be using the Firebase ML kit, and it's Vision library.

---

Videos used for reference on OCR starting point:

*https://www.youtube.com/watch?v=or8AcS6y1xg*

*Additional learning material concepts were also understood using ChatGPT.*