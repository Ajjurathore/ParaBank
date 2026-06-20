*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-LGN-04
    [Documentation]  Login with empty password
    [Tags]  @api  @negative
    Login With Empty Password