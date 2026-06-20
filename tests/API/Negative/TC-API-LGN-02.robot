*** Settings ***
Resource    ../../../resources/keywords/api_keywords.robot

*** Test Cases ***
TC-API-LGN-02
    [Documentation]  Login with Invalid Credentials
    [Tags]  @api  @negative
    Login With Invalid Credentials