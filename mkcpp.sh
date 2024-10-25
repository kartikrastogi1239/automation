#!/bin/bash

function check_dependencies() {
    if ! command -v g++ &> /dev/null; then
        echo "g++ not found, installing..."
        sudo apt-get update
        sudo apt-get install -y g++
    fi

    if ! command -v scrot &> /dev/null; then
        echo "scrot not found, installing..."
        sudo apt-get install -y scrot
    fi

    if ! python3 -c "import docx" &> /dev/null; then
        echo "Installing python-docx..."
        pip3 install --user python-docx
    fi
}

check_dependencies

# Prompt for user inputs
echo "Your roll no: "
read roll_no
echo "Your name: "
read name

# Count the number of C++ files in the codes directory
count=$(find "${HOME}/Desktop/ass_test/codes" -type f -name "*.cpp" | wc -l)


# Create output directory if it doesn't exist
mkdir -p "${HOME}/Desktop/ass_test/outputs"
FOLDER="${HOME}/Desktop/ass_test/outputs"
clear
# Loop to compile and execute each C++ file
for (( i=1; i<=$count; i++ ))
do
    # Compile the C++ file
    g++ "${HOME}/Desktop/ass_test/codes/q$i.cpp" -o "${HOME}/Desktop/ass_test/codes/a.out"
    if [ $? -eq 0 ]; then
        # Run the compiled output
        "${HOME}/Desktop/ass_test/codes/a.out"
        FILENAME="OUTPUT_$i.png"
        sleep 1
        # Take a screenshot
        scrot "$FOLDER/$FILENAME"
        echo "Screenshot saved as $FOLDER/$FILENAME"
    else
        echo "Compilation failed for q$i.cpp"
    fi
    clear
done


# Move and rename the directory
mv "${HOME}/Desktop/ass_test" "${HOME}/Desktop/24mcf1r19_kartik"
mkdir -p "${HOME}/Desktop/ass_test"
cp -rv "${HOME}/Desktop/24mcf1r19_kartik/codes" "${HOME}/Desktop/ass_test"

# Run the Python script to generate the docx file
python3.13 "${HOME}/automation/generate_doc.py"

# Change to the Desktop directory
cd "${HOME}/Desktop"

# Rename the directory with the roll number and name
mv "${HOME}/Desktop/24mcf1r19_kartik" "${HOME}/Desktop/24mcf1r${roll_no}_${name}"

# Create a zip file of the renamed directory
zip -r "24mcf1r${roll_no}_${name}.zip" "24mcf1r${roll_no}_${name}"
echo "document has succesfully created THANK YOU for using this"
# Rename the generated docx file
mv "Code_and_Output_Document.docx" "24mcf1r${roll_no}_${name}.docx"
