*** Settings ***
Resource  ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-TXN-01
    [Documentation]
    Login User
    Valid Accounts Retrieval
    Create New Account
    Transfer funds
    Get Account Transactions
