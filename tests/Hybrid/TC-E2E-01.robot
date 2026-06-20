*** Settings ***
Resource    ../../resources/pages/E2E.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-E2E-01
    [Documentation]    Create Account via UI and Validate via API
    [Tags]    E2E    Hybrid
    E2E Test1



