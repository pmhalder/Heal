*** Settings ***
Documentation     A  resource file for functional flow specific keywords for functional tests.
Library           Selenium2Library
Library           String
Library           requests
Library           Collections

*** Variables ***
${DELAY}          0
${TEST_WEBSITE}      https://patient.heal.com
${REGISTRATION_PAGE}  https://patient.heal.com/register

*** Keywords ***

clicks on Create account Button
    Click Element  ${CREATE_ACCOUNT_BTN}



required field error messages are displayed
   Wait Until Element Is Visible  ${ERROR_MESSAGE}
   various error messages are displyed



various error messages are displyed
    Page Should Contain   First Name Is Required

    Page Should Contain   Last Name Is Required

    Page Should Contain   Email Is Required

    Page Should Contain   Password Is Required

    Page Should Contain   Phone Number Is Required.

    Page Should Contain   Zipcode Is Required.


registration page loads successfully
    Wait Until Element Is Visible   ${HEAL_LOGO}
    Wait Until Element Is Visible   ${REGISTRATION_FORM}


Log Into Dealer Portal
    [Arguments]    ${DEALER_PORTAL_USERNAME}
    Wait Until Element Is Visible    ${DEALER_PORTAL_LOGIN_BUTTON}
    Click Element    ${DEALER_PORTAL_LOGIN_BUTTON}
    Input Text    ${DEALER_PORTAL_EMAIL}    ${DEALER_PORTAL_USERNAME}
    Input Text    password    password1
    Click Element    ${DEALER_PORTAL_SUBMIT_BUTTON}

Select Dealer
    [Arguments]    ${DEALERSHIP_ID}
    Input Text    dealership_name    ${DEALERSHIP_ID}
    Click Element    xpath=//*[@id="dealership-search"]/div[2]/div/div/span/button

Select Prospects
    Click Element    ${DEALER_PORTAL_PROSPECT}
    Sleep    1 seconds
    Wait Until Page Contains Element    ${DEALER_PORTAL_OFFER_BUTTON}    30
    Click Element    ${DEALER_PORTAL_OFFER_BUTTON}

user enters registration data
    ${USERNAME}=   Generate Random String  8
    Input Text  ${FIRST_NAME_TXT_FLD}  test
    Input Text  ${LAST_NAME_TXT_FLD}  test
    Input Text  ${EMAIL}  ${USERNAME}@qa.com
    Input Text  ${PASSWORD}  Password1
    Input Text  ${CONFIRM_PASSWORD}  Password1
    Input Text  ${PHONE_NUMBER}  18002002000
    Input Text  ${ZIPCODE}  91403

user enters upsupported zip
    Input Text  ${ZIPCODE}  10040



user is able to register successfully
     Wait Until Page Contains Element  ${BOOK_VISIT}


user gets the unsupported area information
    Wait Until Page Contains Element  ${CONTINUE_BTN}
    Page Should Contain  We're Not in Your Area...yet!
