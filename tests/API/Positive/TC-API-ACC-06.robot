*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-ACC-06
    [Documentation]  GEt specific account details using account ID
    Login User
    Valid Accounts Retrieval
    Get Specific Account Details
