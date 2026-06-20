*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-PERF_04
    [Documentation]    Verify invalid customer request completes within 2 seconds
    [Tags]    @performance @api @negative
    Invalid Customer ID Response Time
    