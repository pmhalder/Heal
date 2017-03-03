*** Settings ***
Documentation     A common resource file for shared configuration, variables and keywords between tests.
Library           Selenium2Library
Library           String
Library           requests
Library           Collections


*** Variables ***
${DELAY}          0
${TEST_WEBSITE}      https://patient.heal.com
${REGISTRATION_PAGE}  https://patient.heal.com/register



*** Keywords ***

Set Up Test Local
    Open Browser    ${TEST_WEBSITE}    ${BROWSER}
    Maximize Browser Window


Set Up Test SauceLabs
    ${capabilities}=    Create Dictionary
    Set To Dictionary    ${capabilities}    platform    Mac
    Open Browser    http://google.com    ${BROWSER}    remote_url=http://phalder1:6dccd111-3e4b-44ce-b2c4-c6b9e6d24231@ondemand.saucelabs.com:80/wd/hub    desired_capabilities=${capabilities}
    Maximize Browser Window

Setup Test
    Run Keyword If    '''${TEST_RUN_TYPE}''' not in ('LOCAL', 'SAUCELABS')    Fail    TEST_RUN_TYPE value not supported, only 'LOCAL' and 'SAUCELABS' allowed
    Run Keyword If    '''${TEST_RUN_TYPE}''' == 'LOCAL'    Set Up Test Local
    Run Keyword If    '''${TEST_RUN_TYPE}''' == 'SAUCELABS'    Set Up Test SauceLabs


clicks on Create account Button
    Click Element  ${CREATE_ACCOUNT_BTN}

user opens registration page
    Go To  ${REGISTRATION_PAGE}
    Wait Until Element Is Visible  ${NONDISCRIMINATION_NOTICE}


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

user is able to register successfully
     Wait Until Page Contains Element  ${BOOK_VISIT}





