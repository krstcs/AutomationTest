Feature: invalid login tests

Background: start browser and navigate to initial url
    * def startUrl = "http://automationpractice.com"
    * def pages = read("classpath:pages.json")
    * def loginData = read("this:login-data.json").invalid
    * def email = loginData.email
    * def password = loginData.password
    * call read('classpath:features/browser/start-browser.feature')
    * waitForEnabled(pages.homepage.signinlink)

Scenario Outline: attempt login with invalid information - email: <email>, password: <password>
    Given match driver.url == startUrl + '/index.php'
    When waitForEnabled(pages.homepage.signinlink).click()
    And call read('classpath:features/login.feature') { email: "<email>", password: "<password>" }
    Then match text(pages.signinpage.error_message) contains "There is 1 error"

    Examples:
    | loginData |