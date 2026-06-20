*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-CUST-01
    [Documentation]    Get Customer Details by ID
    [Tags]    @regression @api
    Login User
    Valid Accounts Retrieval
    Get Customer Details