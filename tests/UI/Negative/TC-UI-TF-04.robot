*** Settings ***
Library    SeleniumLibrary
Resource    ../../../resources/pages/TransferFundPage.robot
Resource    ../../../resources/keywords/common_keywords.robot
Resource    ../../../resources/pages/LoginPage.robot
Resource    ../../../resources/pages/OpenAccountPage.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-TF-04
    [Documentation]  Test case to transfer funds between two accounts with empty amount filed
    Temp Login
    Open Account    SAVINGS
    Transfer Funds With Empty Amount