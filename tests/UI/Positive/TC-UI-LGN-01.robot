*** Settings ***
Library  SeleniumLibrary
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-LGN-01
    [Documentation]  This test case is to verify the login functionality of Para Bank application.
    Log in to Para Bank
