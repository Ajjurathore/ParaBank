*** Settings ***
Library  SeleniumLibrary
Resource  ../../../resources/pages/LoginPage.robot
Resource  ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-LGN-05
    [Documentation]  verify the login functionality with empty fields.
    Log In With Both Field Empty