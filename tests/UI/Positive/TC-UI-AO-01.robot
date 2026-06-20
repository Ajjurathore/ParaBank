*** Settings ***
Library  SeleniumLibrary
Resource    ../../../resources/pages/AccountOverviewPage.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-AO-01
    [Documentation]    Verify that the user can successfully navigate to the Account Overview page after logging in.
    [Tags]    Positive    Smoke
    Temp Login
    Go To Account Overview Page
