*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-ACC-01
    [Documentation]  This test case is to verify the valid account retrieval
    Login User
    Valid Accounts Retrieval