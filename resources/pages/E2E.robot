*** Settings ***
Library  SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/pages/LoginPage.robot
Resource    ../../resources/pages/TransferFundPage.robot
Resource    ../../resources/pages/OpenAccountPage.robot

*** Keywords ***
E2E Test1
    [Documentation]    Create Account via UI and Validate via API
    [Tags]    E2E    Hybrid
    Log In To Para Bank
    ${new_acc_id}=    Open Account And Get ID    CHECKING
    Login User
    ${accounts}=    Get All Accounts For Customer
    Should Contain    ${accounts}    ${new_acc_id}

E2E Test2
    [Documentation]    Create Savings Account via UI – Validate Type via API
    [Tags]    E2E    Hybrid
    Log In To Para Bank
    ${new_acc_id}=    Open Account And Get ID    SAVINGS
    Set Suite Variable    ${accountId}    ${new_acc_id}
    Login User
    Validate Savings Account Type

E2E Test3
    [Documentation]  Transfer Funds via UI – Validate Balances via API
    [Arguments]  ${acc_type}

    Log In To Para Bank
    Open Account    SAVINGS

    Login User

    ${source_acc}    ${dest_acc}=    Get Source And Destination Accounts

    ${source_before}=    Get Account Balance    ${source_acc}
    ${dest_before}=      Get Account Balance    ${dest_acc}

    Transfer Funds Between Accounts

    ${source_after}=    Get Account Balance    ${source_acc}
    ${dest_after}=      Get Account Balance    ${dest_acc}    

    ${expected_source}=    Evaluate    float(${source_before}) - 100
    ${expected_dest}=      Evaluate    float(${dest_before}) + 100

    Should Be Equal As Numbers    ${source_after}    ${expected_source}
    Should Be Equal As Numbers    ${dest_after}      ${expected_dest}