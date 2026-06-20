*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/AccountOverview_loc.robot

*** Keywords ***
Go To Account Overview Page
    [Documentation]    Navigate to Account Overview page and verify all accounts are displayed.

    Click Element    ${acc_overview}

    Wait Until Page Contains    Accounts Overview

    # Verify account table is visible
    Element Should Be Visible    xpath=//table

    # Verify account details columns are present    
    Page Should Contain    Account
    Page Should Contain    Balance
    Page Should Contain    Available Amount