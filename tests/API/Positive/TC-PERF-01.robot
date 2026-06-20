*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-PERF-01
    [Documentation]    Verify login api within 2 sec
    [Tags]    @performance @api
    Login API Response Time