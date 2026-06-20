*** Settings ***
Library  SeleniumLibrary
Resource    ../../../resources/pages/registerPage.robot
Resource    ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-REG-02
    [Documentation]  This test case is to verify the registration functionality of Para Bank application.
    Incomplete Registration