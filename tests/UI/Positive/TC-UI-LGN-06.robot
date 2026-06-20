*** Settings ***
Library  SeleniumLibrary
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-LGN-06
    [Documentation]  verify the login functionality with invalid password.
    Log In To Para Bank
    Logout Functionality