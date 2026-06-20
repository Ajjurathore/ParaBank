*** Settings ***
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/E2E.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-03
    [Documentation]    Transfer Funds via UI – Validate Balances via API
    [Tags]    E2E    Hybrid
    E2E Test3    SAVINGS