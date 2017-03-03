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




user opens registration page
    Go To  ${REGISTRATION_PAGE}
    Wait Until Element Is Visible  ${NONDISCRIMINATION_NOTICE}



