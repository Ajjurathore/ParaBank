*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC_PERF_05
    [Documentation]    Verify invalid account request completes within 2 seconds
    [Tags]    @Negative    @Performance
    Invalid Account ID Response Time