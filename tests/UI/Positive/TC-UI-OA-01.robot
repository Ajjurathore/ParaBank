*** Settings ***
Library  SeleniumLibrary
Resource    ../../../resources/pages/OpenAccountPage.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-OA-01
    [Documentation]  Verify that user can open new account successfully
    Temp Login
    Open Account    CHECKING

