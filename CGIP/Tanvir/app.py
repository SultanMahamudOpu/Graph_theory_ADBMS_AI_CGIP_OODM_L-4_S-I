import streamlit as st
import tensorflow as tf
from PIL import Image, ImageOps
import numpy as np
import os

# Set page config
st.set_page_config(page_title="Tomato Disease Detection", page_icon="🍅", layout="centered")

@st.cache_resource
def load_model():
    model_path = r"c:\Users\Sultan Mahamud Opu\Desktop\Tanvir\tomato_disease_model.h5"
    if not os.path.exists(model_path):
        return None
    model = tf.keras.models.load_model(model_path)
    return model

model = load_model()

st.title("🍅 Tomato Disease Detection System")
st.markdown("Upload an image of a tomato leaf to detect if it's healthy or diseased.")

file = st.file_uploader("Please upload a tomato leaf image", type=["jpg", "png", "jpeg"])

def import_and_predict(image_data, model):
    size = (256, 256)    
    image = ImageOps.fit(image_data, size, Image.Resampling.LANCZOS)
    img = np.asarray(image)
    img_reshape = img[np.newaxis,...]
    prediction = model.predict(img_reshape)
    return prediction

if file is None:
    st.text("Please upload an image file")
else:
    if model is None:
        st.error("Model not found! Please train the model first by running 'train_model.py'.")
    else:
        image = Image.open(file)
        st.image(image, use_column_width=True)
        
        # Determine class names (Must match training order)
        # Based on alphabetical order of folders:
        # 1. Tomato___Early_blight
        # 2. Tomato___Late_blight
        # 3. Tomato___healthy
        # Wait, os.listdir order might vary, but image_dataset_from_directory sorts alphabetically.
        # Let's verify the list_dir output from earlier:
        # Tomato___Early_blight/
        # Tomato___healthy/
        # Tomato___Late_blight/
        # Alphabetical order:
        # 0: Tomato___Early_blight
        # 1: Tomato___Late_blight
        # 2: Tomato___healthy
        # Actually 'h' comes before 'L' in healthy vs Late_blight? No. 
        # 'E'arly...
        # 'L'ate...
        # 'h'ealthy...
        # ASCII: 'L' (76) comes before 'h' (104). So Capitalized folders come first?
        # Let's be careful. The previous tool `list_dir` output:
        # Tomato___Early_blight/
        # Tomato___healthy/
        # Tomato___Late_blight/
        # But `image_dataset_from_directory` sorts typically. 
        # Let's assume standard alphabetical sort on folder names.
        # strings: "Tomato___Early_blight", "Tomato___Late_blight", "Tomato___healthy"
        # 'E' < 'L' < 'h'. Wait, 'h' is lowercase in the folder name?
        # Re-checking ls output:
        # Tomato___Early_blight/
        # Tomato___healthy/
        # Tomato___Late_blight/
        # If 'h' is lowercase, it comes AFTER 'L'. 
        # But if it is "Tomato___Healthy", then 'H' vs 'L'.
        # Let's hardcode the class names based on standard sorting or read from directory.
        
        class_names = ['Tomato___Early_blight', 'Tomato___Late_blight', 'Tomato___healthy']
        # Wait, looking at the previous ls output:
        # list_dir output:
        # Tomato___Early_blight/
        # Tomato___healthy/
        # Tomato___Late_blight/
        # This output might not be sorted.
        
        # Safest way is to define them here, but ensure training used same order. 
        # `image_dataset_from_directory` sorts class names alphanumeric.
        # 'Tomato___Early_blight'
        # 'Tomato___Late_blight'
        # 'Tomato___healthy'  <-- if healthy starts with lowercase 'h', it comes last in ASCII sort.
        # Let's double check with python sort.
        
        # Let's assume the user can update this list if it's wrong, or I can try to read it dynamically if the dataset folders exist.
        dataset_dir = r"c:\Users\Sultan Mahamud Opu\Desktop\Tanvir\dataset"
        if os.path.exists(dataset_dir):
            class_names = sorted([d for d in os.listdir(dataset_dir) if os.path.isdir(os.path.join(dataset_dir, d))])
        else:
             # Fallback
            class_names = ['Tomato___Early_blight', 'Tomato___Late_blight', 'Tomato___healthy']

        st.write("Classifying...")
        predictions = import_and_predict(image, model)
        score = predictions[0]
        predicted_class = class_names[np.argmax(predictions[0])]
        confidence = 100 * np.max(score)
        
        st.success(f"Prediction: {predicted_class}")
        st.info(f"Confidence: {confidence:.2f}%")
        
        st.write("Probability Distribution:")
        # Create a dictionary for the chart
        probs = {name: float(predictions[0][i]) for i, name in enumerate(class_names)}
        st.bar_chart(probs)
