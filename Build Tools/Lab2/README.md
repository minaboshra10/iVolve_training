# Lab 2: Building and Packaging a Java Application with Gradle

## Objective
Build, test, package, and run a Java calculator application using Gradle.

## Prerequisites
- Java 21
- Gradle 8.14.4

## Steps Performed

### 1. Clone the Repository
```bash
git clone https://github.com/Ibrahim-Adel15/CalculatorGradleApp.git
```

### 2. Run Unit Tests
```bash
gradle test
```
**Result:** BUILD SUCCESSFUL.

### 3. Build the Application
```bash
gradle clean build
```
**Result:** BUILD SUCCESSFUL. The JAR was generated at `build/libs/calculator.jar`.

### 4. Run the Application
```bash
java -jar build/libs/calculator.jar
```

**Sample Input**
- First number: 15
- Second number: 33

**Expected Output**
```text
Sum: 48.0
Subtract: -18.0
Multiply: 495.0
Divide: 0.45454545454545453
```

## Conclusion
The calculator application was successfully tested, packaged into an executable JAR, and executed using Gradle and Java.
