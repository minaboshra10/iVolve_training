# Lab 1: Building and Packaging a Java Application with Maven

## Objective
Build, test, package, and run a Java calculator application using Maven.

## Prerequisites
- Java JDK 21
- Apache Maven 3.6.3

## Steps Performed

### 1. Clone the Repository
```bash
git clone https://github.com/Ibrahim-Adel15/CalculatorMavenApp.git
```

### 2. Run Unit Tests
```bash
mvn test
```
**Result:** 5 tests executed, 0 failures, 0 errors, and 0 skipped.

### 3. Package the Application
```bash
mvn package
```
**Result:** The executable JAR was generated at `target/calculator.jar`.

### 4. Run the Application
```bash
java -jar target/calculator.jar
```

**Sample Input**
- First number: 12
- Second number: 22

**Expected Output**
```text
Sum: 34.0
Subtract: -10.0
Multiply: 264.0
Divide: 0.5454545454545454
```

## Conclusion
The Java calculator application was successfully tested, packaged into an executable JAR, and executed using Java.
