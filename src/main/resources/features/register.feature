@ignore
Feature: fills out registration information

Background:
    * def registrationpage = read('classpath:pages.json').registrationpage

Scenario: 
    * waitForEnabled(registrationpage.personalinfo_firstname_textbox).input(data.firstname)
    * input(registrationpage.personalinfo_lastname_textbox, data.lastname)
    * input(registrationpage.password_textbox, data.password)
    * input(registrationpage.address_line1_textbox, data.addressLine1)
    * input(registrationpage.city_textbox, data.city)
    * select(registrationpage.state_dropdown, '{}' + data.state)
    * input(registrationpage.zip_textbox, data.zip)
    * input(registrationpage.mobilephone_textbox, data.mobilephone)
    * click(registrationpage.register_button)
    