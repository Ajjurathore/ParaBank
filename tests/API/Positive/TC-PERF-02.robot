*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-PERF-02
    [Documentation]    Verify login + get accounts completes within 5 seconds
    [Tags]    @performance @api
    Get All Accounts Response Time
