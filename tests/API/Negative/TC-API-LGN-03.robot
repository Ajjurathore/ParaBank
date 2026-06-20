*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-LGN-03
    [Documentation]  Login With Empty username
    [Tags]  @api  @negative
    Login With Empty Username