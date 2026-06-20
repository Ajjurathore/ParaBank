*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/TransferFunds_loc.robot

*** Keywords ***
Transfer Funds Between Accounts
    Wait Until Element Is Visible    ${transfer_funds_btn}  10s
    Click Element    ${transfer_funds_btn}

    Input Text    ${amount_input}    100
    Wait Until Element Is Visible    ${from_acc_dropdown}    10s

    Click Element    ${to_acc_dropdown}
    Wait Until Element Is Visible    ${diff_acc}    10s
    Click Element    ${diff_acc}

    Click Element    ${transfer_btn}
    Page Should Contain    Transfer Complete!

Transfer Funds With Empty Amount
    Wait Until Element Is Visible    ${transfer_funds_btn}  10s
    Click Element    ${transfer_funds_btn}

    Wait Until Element Is Visible    ${from_acc_dropdown}    10s

    Click Element    ${to_acc_dropdown}
    Wait Until Element Is Visible    ${diff_acc}    10s
    Click Element    ${diff_acc}

    Click Element    ${transfer_btn}
    Page Should Contain    Error!

Transfer Funds With Negative Amount
    Wait Until Element Is Visible    ${transfer_funds_btn}  10s
    Click Element    ${transfer_funds_btn}

    Input Text    ${amount_input}    -50
    Wait Until Element Is Visible    ${from_acc_dropdown}    10s

    Click Element    ${to_acc_dropdown}
    Wait Until Element Is Visible    ${diff_acc}    10s
    Click Element    ${diff_acc}

    Click Element    ${transfer_btn}
#    Page Should Contain    Error!

Transfer Funds Between Accounts With Decimal Amount
    Wait Until Element Is Visible    ${transfer_funds_btn}  10s
    Click Element    ${transfer_funds_btn}

    Input Text    ${amount_input}    25.50
    Wait Until Element Is Visible    ${from_acc_dropdown}    10s

    Click Element    ${to_acc_dropdown}
    Wait Until Element Is Visible    ${diff_acc}    10s
    Click Element    ${diff_acc}

    Click Element    ${transfer_btn}
    Page Should Contain    Transfer Complete!