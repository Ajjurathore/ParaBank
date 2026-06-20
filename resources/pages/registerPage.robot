*** Settings ***
Library  SeleniumLibrary
Resource  ../../locators/registration_loc.robot

*** Keywords ***
Register
    [Documentation]  Registering to Para Bank account
    Click Element    ${register_link}
    Input Text    ${first_name}    asr
    Input Text    ${last_name}    asr
    Input Text    ${address}    india
    Input Text    ${city}    jp
    Input Text    ${state}    Raj
    Input Text    ${zip_code}    302013
    Input Text    ${phone}    9999999999
    Input Text    ${ssn}    123
    Input Text    ${username}    asr
    Input Text    ${password}    asr
    Input Text    ${confirm_password}    asr
    Click Element    ${register_btn}
    Page Should Contain Element    ${logout_btn}

Incomplete Registration
    [Documentation]  Registering to Para Bank account with incomplete details
    Click Element    ${register_link}
    Input Text    ${first_name}    asr
    Input Text    ${last_name}    asr
    Input Text    ${city}    jp
    Input Text    ${state}    Raj
    Input Text    ${zip_code}    302013
    Input Text    ${phone}    9999999999
    Input Text    ${ssn}    123
    Input Text    ${username}    asr
    Input Text    ${password}    asr
    Input Text    ${confirm_password}    asr
    Click Element    ${register_btn}
    Page Should Not Contain    ${logout_btn}