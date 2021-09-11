@ignore
Feature: base login feature - enters login info and clicks 'Sign in'

Background: 
    * def signinpage = read('classpath:pages.json').signinpage

Scenario: enter login info and click 'Sign in'
    * waitForEnabled(signinpage.email_textbox).input(email)
    * waitForEnabled(signinpage.password_textbox).input(password)
    * waitForEnabled(signinpage.signin_button).click()
