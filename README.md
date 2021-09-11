# AutomationTest
#### Credit
This project is based on the open-source Karate framework ([docs](https:intuit.github.io/karate/), [github](https://github.com/intuit/karate)) create by Peter Thomas, licensed under the MIT license.  Note: I do not make any changes to Karate, I only use it as a library for automation, pulling from MavenCentral.  

#### About
Karate is a Java test framework that allows for UI, API, and load testing (using Gatling).  The DSL is based loosely on Cucumber's Gherkin syntax, but is a true DSL.

The reason I used this framework is because it is what I'm currently using in my present position.  I could have also done the same things in Selenium with a PageObject model, but I felt that this would be faster and show something many haven't seen yet.

I used VS Code as my IDE.

#### Challenges
The challenges I had were:
1. Getting the project setup, although I have some examples to use for that.
2. Getting the email address to not be duplicated every test run. I insert the current epoch time (JavaScript Date.now())) before the '@' in the email address to get around this. 


#### Running
The project is a gradle project and includes the gradle wrapper that will download v7.2 into the project directory upon first run.

Prerequisites: Java 11 and Chrome

Note: Karate can use WebDriver executables, but in this case I'm using the Chrome API for brevity.  All scripts work the same either way, only the browser configuration changes.

To execute the tests, from the root directory of the project:
Linux: `./gradlew build` or `./gradlew test`
Windows: `gradlew.bat build` or `gradlew.bat test`

Gradle will download the gradle runtime and the Karate library dependency, build the project and run the tests.

To view the test report, open `./build/reports/tests/test/index.html` after running the above.