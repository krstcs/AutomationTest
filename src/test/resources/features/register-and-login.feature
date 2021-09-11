Feature: register and login tests

Background: start browser and navigate to initial url
    * def startUrl = "http://automationpractice.com"
    * def pages = read("classpath:pages.json")
    * def loginData = read("this:login-data.json").valid
    * call read('classpath:features/browser/start-browser.feature')

Scenario: register and then login with valid information
    Given match driver.url == startUrl + '/index.php'
    When waitForEnabled(pages.homepage.signinlink).click()
    And waitForEnabled(pages.signinpage.email_create_textbox).input(loginData.email)
    And click(pages.signinpage.create_account_button)
    And call read('classpath:features/register.feature') {"data": #(loginData)}
    And waitForEnabled(pages.homepage.signoutlink).click()
    When waitForEnabled(pages.homepage.signinlink).click()
    And call read('classpath:features/login.feature') {"email": #(loginData.email), "password": #(loginData.password)}
    Then match text("{^span}" + loginData.firstname + " " + loginData.lastname) == loginData.firstname + " " + loginData.lastname
