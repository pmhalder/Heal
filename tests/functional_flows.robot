*** Settings ***
Documentation     Open registrations
Test Setup        Set Up Test
Test Teardown     Close All Browsers
Suite Teardown    Close All Browsers
Resource          ../keywords/common.robot
Resource          ../keywords/locators.robot

*** Variables ***
${BROWSER}        firefox

*** Test Cases ***
Scenario: Registration Page load
    [Tags]  UI
    When user opens registration page
    then registration page loads successfully


Scenario: Registration without requied data
    [Tags]  functional
    When user opens registration page
    and clicks on Create account Button #without providing the data
    then Required field error messages are displayed

Scenario: Successful Registration
     [Tags]  tag
     When user opens registration page
     and user enters registration data
     and clicks on Create account Button
     then user is able to register successfully



