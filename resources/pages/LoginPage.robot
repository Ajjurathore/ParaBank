*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/login_loc.robot

*** Keywords ***
Log in to Para Bank
    [Documentation]  logging in to Para Bank account
    Input Text    ${username_txt}    john
    Input Text    ${password_txt}    demo
    Click Element    ${login_btn}
    Wait Until Element Is Visible    ${logout_btn}  10s
    Page Should Contain Element    ${logout_btn}

Log in to Para Bank with invalid Password
    [Documentation]  logging in to Para Bank account with invalid Password
    Input Text    ${username_txt}    asr
    Input Text    ${password_txt}    asr123
    Click Element    ${login_btn}
    Page Should Not Contain Element    ${logout_btn}
Log in with both field Empty
    [Documentation]  logging in to Para Bank account with both field Empty
    Click Element    ${login_btn}
    Page Should Not Contain Element    ${logout_btn}

Logout Functionality
    [Documentation]  logging out from Para Bank account
    Click Element    ${logout_btn}
    Page Should Contain Element    ${login_btn}


temp login
    [Documentation]  logging in to Para Bank account
    Wait Until Element Is Visible    ${username_txt}  3s
    Input Text    ${username_txt}    john
    Input Text    ${password_txt}    demo
    Click Element    ${login_btn}
    Page Should Contain Element    ${logout_btn}