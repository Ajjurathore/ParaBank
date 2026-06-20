*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot


*** Test Cases ***
TC-PERF-03
    [Documentation]    Verify login + accounts + account details completes within 5 seconds
    [Tags]    @performance @api
    Get Account By ID Response Time
