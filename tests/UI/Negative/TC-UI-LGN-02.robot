*** Settings ***
Library  SeleniumLibrary
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-LGN-02
    [Documentation]  verify the login functionality with invalid Password.
    Log In To Para Bank With Invalid Password