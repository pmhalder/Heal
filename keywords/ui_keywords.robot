*** Settings ***
Documentation     A resource file for all keywords related to UI tests
Library           Selenium2Library
Library           String
Library           requests
Library           Collections


*** Keywords ***
The page title is heal - Patient Portal
    Title Should Be  Heal - Patient Portal

HEAL logo is displayed correctly
    Wait Until Element Is Visible   ${HEAL_LOGO}

UI Components are displayed successfully
    Page Should Contain   First Name

    Page Should Contain   Last Name

    Page Should Contain   Email

    Page Should Contain   Password

    Page Should Contain   Phone Number

    Page Should Contain   Zipcode


user is able to view the policy agreement text
    Page Should Contain   By pressing Create Account you agree to our

