*** Settings ***
Documentation     Open registrations
Test Setup        Set Up Test
Resource          ../keywords/common.robot
Resource          ../keywords/ui_keywords.robot
Resource          ../keywords/locators.robot

*** Variables ***
${BROWSER}        firefox

*** Test Cases ***
Test Case: Verify browser title
    [Tags]  1
    When user opens registration page
    The page title is Heal - Patient Portal


Test Case: Verify Heal Logo is displayed correctly
    [Tags]  2
    When user opens registration page
    HEAL logo is displayed correctly

Test Case: Verify different UI components are displayed
    [Tags]  3
    [Documentation]  verify  firsname, last name, email, password , confirm password , phone number , all the buttons and links are displayed
    When user opens registration page
    UI Components are displayed successfully

Test Case: Verify policy agreement text is present
    [Tags]  4
    When user opens registration page
    then user is able to view the policy agreement text


