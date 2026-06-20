*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-ACC-07
    [Documentation]    GEt account with invalid account ID
    [Tags]    @api    @negative
    Get Specific Account Details with Invalid Account ID