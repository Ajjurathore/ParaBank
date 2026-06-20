*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${API_BASE_URL}    https://parabank.parasoft.com/parabank/services/bank
${username_api}        john
${password_api}        demo
${customerId}      None
${accountId}       None

*** Keywords ***
Login User
    [Documentation]    Verify login via REST API
    [Tags]    @regression @api}
    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /login/${username_api}/${password_api}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
#    Log To Console    ${body}
#    Log To Console    ${response.text}
    ${customerId}=    Set Variable    ${body}[id]
    Set Suite Variable    ${customerId}    
    Log To Console    Customer ID: ${customerId}

Login With Invalid Credentials
    [Documentation]    Verify login API rejects invalid credentials
    [Tags]    @api    @regression    @negative

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session
    ...    bankApi
    ...    /login/invalidUser/invalidPass
    ...    expected_status=any

    Log To Console    Status Code: ${response.status_code}
    Log To Console    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    400

Login With Empty Username
    [Documentation]    Verify login API rejects empty username
    [Tags]    @api    @regression    @negative

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session
    ...    bankApi
    ...    /login//${password_api}
    ...    expected_status=any

    Log To Console    Status Code: ${response.status_code}
    Log To Console    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    404

Login With Empty Password
    [Documentation]    Verify login API rejects empty password
    [Tags]    @api    @regression    @negative

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session
    ...    bankApi
    ...    /login/${username_api}/
    ...    expected_status=any

    Log To Console    Status Code: ${response.status_code}
    Log To Console    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    404

#Valid Accounts Retrieval
#    [Documentation]    Retrieve accounts using customer ID
#    [Tags]    @api    @regression
#
#    ${headers}=    Create Dictionary    Accept=application/json
#    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
#
#    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts
#
#    Should Be Equal As Integers    ${response.status_code}    200
#
#    ${body}=    Set Variable    ${response.json()}
#    Log To Console    Accounts: ${body}
#    ${count}=    Get Length    ${body}
#    Log To Console    Total Accounts: ${count}
#    ${accountId}=    Set Variable    ${body}[0][id]
#    Set Suite Variable    ${accountId}
#    Log To Console    Account ID: ${accountId}
Valid Accounts Retrieval
    [Documentation]    Retrieve accounts using customer ID
    [Tags]    @api   @regression
     ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}

    ${accountId}=    Set Variable    ${body}[0][id]
    Set Suite Variable    ${accountId}
    Log To Console    Account ID: ${accountId}

Invalid account retrieval
    [Documentation]    Retrieve accounts using customer ID
    [Tags]    @api @regression
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session
    ...    bankApi
    ...    /customers/9999999/accounts
    ...    expected_status=any

    Should Be Equal As Integers    ${response.status_code}    400

    Log To Console    Status: ${response.status_code}
    Log To Console    Response: ${response.text}

    Should Contain    ${response.text}    customer
Get Specific Account Details
    [Documentation]    Retrieve specific account details using account ID
    [Tags]    @api    @regression

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /accounts/${accountId}

    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${body}[id]    ${accountId}
    Should Be Equal As Integers    ${body}[customerId]    ${customerId}
    Should Not Be Empty    ${body}[type]
    Should Not Be Equal    ${body}[balance]    ${None}
    Log To Console    ${body}

Get Specific Account Details with Invalid Account ID
    [Documentation]    Retrieve specific account details using invalid account ID
    [Tags]    @api    @regression    @negative

    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session
    ...    bankApi
    ...    /accounts/0000000
    ...    expected_status=any   # Allow any status code to be returned, we will validate it in the next steps

    Log To Console    Status Code: ${response.status_code}
    Log To Console    ${response.text}

    Should Be Equal As Integers    ${response.status_code}    400
    Should Contain    ${response.text}    Could not find account

#Get Specific Account Transactions
#    [Documentation]    Retrieve transactions for a specific account
#    [Tags]    @api    @regression
#
#    ${headers}=    Create Dictionary    Accept=application/json
#    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
#
#    ${response}=    GET On Session    bankApi    /accounts/${accountId}/transactions
#
#    Should Be Equal As Integers    ${response.status_code}    200
#    ${body}=    Set Variable    ${response.json()}
#    Log To Console    ${body}
#    Should Not Be Empty    ${body}
#
#
#    Should Not Be Empty    ${body}[0][id]
#    Should Not Be Empty    ${body}[0][accountId]
#    Should Not Be Empty    ${body}[0][type]
#    Should Not Be Empty    ${body}[0][date]
#    Should Not Be Empty    ${body}[0][amount]
#    Should Not Be Empty    ${body}[0][description]

Get Customer Details
    [Documentation]    Retrieve customer details using customer ID
    [Tags]    @api    @smoke    @regression

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session    bankApi    /customers/${customerId}

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Log To Console    ${body}

    Should Be Equal As Integers    ${body}[id]    ${customerId}
    Should Not Be Empty    ${body}[firstName]
    Should Not Be Empty    ${body}[lastName]
    Should Not Be Empty    ${body}[address][street]
    Should Not Be Empty    ${body}[address][city]
    Should Not Be Empty    ${body}[address][state]
    Should Not Be Empty    ${body}[address][zipCode]

Login API Response Time
    [Documentation]    Verify login API responds within 2 seconds
    [Tags]    @performance    @api

    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}
    ${response}=    GET On Session    bankApi    /login/${username_api}/${password_api}

    Should Be Equal As Integers    ${response.status_code}    200
    ${responseTime}=    Set Variable    ${response.elapsed.total_seconds()}

    Log To Console    Response Time: ${responseTime} seconds

    Should Be True    ${responseTime} < 2

Get All Accounts Response Time
    [Documentation]    Verify login + get accounts completes within 5 seconds
    [Tags]    @performance    @api

    ${start}=    Evaluate    time.time()    modules=time

    Login User
    Valid Accounts Retrieval

    ${end}=    Evaluate    time.time()    modules=time

    ${responseTimeMs}=    Evaluate    (${end}-${start})*1000

    Log To Console    Response Time: ${responseTimeMs} ms

    Should Be True    ${responseTimeMs} < 5000

Get Account By ID Response Time
    [Documentation]    Verify login + accounts + account details completes within 5 seconds
    [Tags]    @performance    @api

    ${start}=    Evaluate    time.time()    modules=time

    Login User
    Valid Accounts Retrieval
    Get Specific Account Details

    ${end}=    Evaluate    time.time()    modules=time

    ${responseTimeMs}=    Evaluate    (${end}-${start})*1000

    Log To Console    Response Time: ${responseTimeMs} ms

    Should Be True    ${responseTimeMs} < 6000

Invalid Customer ID Response Time
    [Documentation]    Verify invalid customer request completes within 2 seconds
    [Tags]    @performance    @negative    @api

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${start}=    Evaluate    time.time()    modules=time

    ${response}=    GET On Session
    ...    bankApi
    ...    /customers/9999999/accounts
    ...    expected_status=any

    ${end}=    Evaluate    time.time()    modules=time

    ${responseTimeMs}=    Evaluate    (${end}-${start})*1000

    Log To Console    Response Time: ${responseTimeMs} ms

    Should Be Equal As Integers    ${response.status_code}    400
    Should Be True    ${responseTimeMs} < 4000

Invalid Account ID Response Time
    [Documentation]    Verify invalid account request completes within 2 seconds
    [Tags]    @performance    @negative    @api

    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${start}=    Evaluate    time.time()    modules=time

    ${response}=    GET On Session
    ...    bankApi
    ...    /accounts/0000000
    ...    expected_status=any

    ${end}=    Evaluate    time.time()    modules=time

    ${responseTimeMs}=    Evaluate    (${end}-${start})*1000

    Log To Console    Response Time: ${responseTimeMs} ms

    Should Be Equal As Integers    ${response.status_code}    400
    Should Be True    ${responseTimeMs} < 4000


Create New Account
    [Documentation]  Creating a new account from customer id and account id
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${payload}=  Create Dictionary
    ...  customerId=${customer_id}
    ...  type=1          # type is in integer format
    ...  fromAccountId=${account_id}
    ${response}=  POST On Session  bank_api  /createAccount  params=${payload}
    ${acc_creation_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable    ${acc_creation_time}
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
#    Log To Console  ${body}
    ${new_acc_id}=  Set Variable  ${body}[id]
    ${new_cust_id}=  Set Variable  ${body}[customerId]
    ${type}=  Set Variable  ${body}[type]
    Set Suite Variable    ${new_acc_id}
    Set Suite Variable    ${new_cust_id}
    Set Suite Variable    ${type}

Transfer funds
    [Documentation]    Transfering funds from one account to another
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${payload}=  Create Dictionary
    ...  fromAccountId=${account_id}
    ...  toAccountId=${new_acc_id}
    ...  amount=100
    ${response}=  Post On Session  bank_api  /transfer  params=${payload}
    ${fund_transfer_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable   ${fund_transfer_time}
    Should Be Equal As Integers    ${response.status_code}  200

Get Account Transactions
    [Documentation]   Getting all the transactions for an account
    ${headers}=  Create Dictionary  Accept=Application/json
    Create Session  bank_api  ${API_BASE_URL}  verify=True  headers=${headers}
    ${response}=  Get On Session  bank_api  /accounts/${new_acc_id}/transactions
    ${acc_transac_time}=  Evaluate  $response.elapsed.total_seconds()
    Set Suite Variable    ${acc_transac_time}
    Should Be Equal As Integers    ${response.status_code}  200
    ${body}=  Set Variable  ${response.json()}
    Log To Console  ${body}


#Hybrid

Get All Accounts For Customer
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session
    ...    bankApi
    ...    /customers/${customerId}/accounts

    RETURN    ${response.text}

Validate Savings Account Type
    ${headers}=    Create Dictionary    Accept=application/json

    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session    bankApi    /accounts/${accountId}

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    Should Be Equal    ${body}[type]    SAVINGS


Get Account Balance
    [Arguments]    ${account_id}

    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session    bankApi    /accounts/${account_id}

    Should Be Equal As Integers    ${response.status_code}    200

    ${body}=    Set Variable    ${response.json()}

    RETURN    ${body}[balance]

Get Source And Destination Accounts
    ${headers}=    Create Dictionary    Accept=application/json
    Create Session    bankApi    ${API_BASE_URL}    verify=True    headers=${headers}

    ${response}=    GET On Session    bankApi    /customers/${customerId}/accounts

    ${body}=    Set Variable    ${response.json()}

    ${source}=    Set Variable    ${body}[0][id]
    ${destination}=    Set Variable    ${body}[1][id]

    RETURN    ${source}    ${destination}
