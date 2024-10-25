#!/bin/bash

function check_dependencies() {
    if ! command -v g++ &> /dev/null; then
        echo "g++ not found, installing..."
        apt-get update
	sudo apt-get install g++
    fi

    if ! command -v scrot &> /dev/null; then
        echo "scrot not found, installing..."
        sudo apt-get install scrot
    fi

    if ! python3 -c "import docx" &> /dev/null; then
        echo "Installing python-docx..."
        pip3 install --user python-docx
    fi
}

check_dependencies

echo "Your roll no: "
read roll_no
echo "your name: "
read name
count=$(find Desktop/ass_test/codes -type f -name "*.cpp" | wc -l)

mkdir -p Desktop/ass_test/outputs
FOLDER="Desktop/ass_test/outputs"
for (( i=1; i<=$count; i++ ))
do

     g++ Desktop/ass_test/codes/q$i.cpp -o ~/Desktop/ass_test/codes/a.out
     if [ $? -eq 0 ]; then
        ~/Desktop/ass_test/codes/a.out
         FILENAME="OUTPUT_$i.png"
         sleep 1
         scrot "$FOLDER/$FILENAME"
         echo "Screenshot saved as $FOLDER/$FILENAME"
     else
         echo "Compilation failed for q$i.cpp"
     fi
     clear
done
mv /home/kartik/Desktop/ass_test /home/kartik/Desktop/24mcf1r19_kartik
mkdir /home/kartik/Desktop/ass_test
cp -rv /home/kartik/Desktop/24mcf1r19_kartik/codes /home/kartik/Desktop/ass_test
python3.13 generate_doc.py
cd Desktop
mv /home/kartik/Desktop/24mcf1r19_kartik /home/kartik/Desktop/24mcf1r${roll_no}_${name}
zip -r 24mcf1r${roll_no}_${name}.zip 24mcf1r${roll_no}_${name}
mv Code_and_Output_Document.docx 24mcf1r${roll_no}_${name}.docx

