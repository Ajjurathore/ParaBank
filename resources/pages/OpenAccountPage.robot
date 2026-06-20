*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/openAccount_loc.robot


*** Keywords ***
Open Account
    [Documentation]  Opening DIFFERENT types of accounts
    [Arguments]  ${acc_type}
    Wait Until Page Contains Element    ${acc_btn}  10s
    Click Element  ${acc_btn}

    Wait Until Page Contains Element    ${dropdown_acc_type}  10s
    Page Should Contain List    ${dropdown_acc_type}
    Select From List By Label    ${dropdown_acc_type}  ${acc_type}
    Press Keys  ${open_acc_btn}   ENTER
    Wait Until Page Contains Element    ${new_acc_chk}

Open Account And Get ID
    [Arguments]    ${acc_type}
    Open Account    ${acc_type}
    Wait Until Element Is Visible    ${acc_num}    10s
    ${account_id}=    Get Text    ${acc_num}

    RETURN    ${account_id}