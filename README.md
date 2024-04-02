# Sauce Demo Website Test Automation
This is a Robot Framework test automation project for the BWP Index website (https://bwpool.azurewebsites.net/). The project includes test cases covering various functionalities of the website, such as API Call Test, attaching a partner based on the API message and checking the attached values. 

## Prerequisites
- Chrome Browser
- Chrome POM Builder extension
- Python 3.x (Robot Framework is Python-based)
- Robot Framework (Installation: ```pip install robotframework```)
- Robot Framework SeleniumLibrary (Installation: ```pip install --upgrade robotframework-seleniumlibrary```)
- Robot Framework RequestsLibrary (Installation:```pip install robotframework-requests```)
- Visual Studio Code install
- Robot Code extension for Visual Studio Code
- GIT

## Installation
1. Clone the repository:
```
git clone https://github.com/Adamsky25/bwpool_project.git
```

2. Navigate to the project directory:
```
cd bwpool_project
```

3. Install the required Python libraries:
```
pip install -r requirements.txt
```

## Running Tests
To run the entire test suite, use the following command:

```
robot -d ./results ./tests
```

This will execute all the test cases and generate a report and log files in the results directory.

You can also run specific test cases or suites by providing their respective paths. For example:
```
robot -d ./results ./tests/login.robot
```

This will run only the test cases in the login_tests.robot file.

## Test Case
The project includes the following test case:

- bwpool_tests.robot