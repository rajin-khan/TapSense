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






Videos used for reference on OCR starting point:
###### https://www.youtube.com/watch?v=or8AcS6y1xg

Additional learning material concepts were also understood using ChatGPT.
