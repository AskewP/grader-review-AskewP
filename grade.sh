CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -f "student-submission/ListExamples.java" ]; then
    echo "File found"
else
    echo "file ListExamples.java" not found
    exit 1
fi

cp student-submission/ListExamples.java grading-area/
cp TestListExamples.java grading-area/
cp -r lib grading-area

cd grading-area
javac -cp "$CPATH" *.java

if [ $? -ne 0 ]; then
    echo "Compliation Error"
    exit 1
else
    echo "Program compiled successfully!"
fi

java -cp "$CPATH" org.junit.runner.JUnitCore TestListExamples

if [ $? -ne 0 ]; then
    echo "Your Tests Failed"
    exit 1
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
