*** Settings ***
Documentation     Edit the timestamp and copy the desired request body
Library           SeleniumLibrary
Resource          url_hotel.resource
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Variables    variable.py

*** Test Cases ***
Generate Signature
    ${current_record}    Load JSON From File   request_body.json
    ${json_string}=    Convert Json To String    ${current_record}
    Log    ${json_string}
    Set Suite Variable    ${current_record}
    # Create Conflict - request body    customerNo=${conflict}
    Open Browser To Merchant Page    ${snap_config}
    Login
    Fill the form    request_body=${json_string}
    Copy signature
    # Screenshot page
    [Teardown]    Close Browser

Payment VA
    ${header}    Create Dictionary    
    ...    X-TIMESTAMP=${timestamp}    
    ...    X-SIGNATURE=${signature}
    ...    X-PARTNER-ID=${partnerId}
    ...    X-EXTERNAL-ID=${externalId} 
    ...    CHANNEL-ID=${channelId}
    # Create Conflict - request body    customerNo=${conflict}
    ${response}    POST    ${santika_url}    headers=${header}    json=${current_record}
    Log    ${response.json()}

*** Keywords ***
Create Conflict - request body
    [Arguments]    ${customerNo}
    ${paidAmount}    Create Dictionary    
    ...    value=${value}    
    ...    currency=${currency}

    ${additionalInfo}    Create Dictionary    
    ...    insertId=${insertId}    
    ...    tagId=${insertId}    
    ...    flagType=${flagType}    
    ...    passApp=${passApp}    
    ...    idApp=${idApp}

    ${body}    Create Dictionary    
    ...    partnerServiceId=${partnerServiceId}   
    ...    customerNo=${customerNo}    
    ...    virtualAccountNo=${partnerServiceId}${customerNo}    
    ...    virtualAccountName=${virtualAccountName}    
    ...    channelCode=${channelCode}        
    ...    paymentRequestId=${paymentRequestId}    
    ...    paidAmount=${paidAmount}
    ...    referenceNo=${referenceNo}
    ...    trxId=${trxId}    
    ...    trxDateTime=${timestamp}    
    ...    flagAdvise=${flagAdvise}
    ...    additionalInfo=${additionalInfo}
    ${json_string}=    json.dumps(${body})
    ${json_body}=    Convert String To Json    json_string=${json_string}
    Set Suite Variable    ${json_body}

Open Browser To Merchant Page
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    text=Log in    loglevel=TRACE

Login
    Input Text    email    snapconfigurator@bayarind.id
    Sleep    1s
    Input Password    password    Rahasia123$
    Sleep    1s
    Submit Form
    Wait Until Page Contains    text=Generate Asymmetric Signature 

Fill the form
    [Arguments]    ${request_body}
    Input Text    timestamp    ${timestamp}
    Input Text    http_method    POST
    Input Text    endpoint_url    /api/v1.0/transfer-va/payment
    Input Text    private_key    ${private_key}
    Click Element    body
    Input Text    body    text=${request_body}
    # Press Keys    body    CTRL+v
    Submit Form    xpath=//*[@id="app"]/div/div[1]/main/div/div/div/div/div/form
    # Scroll Element Into View    xpath=//*[contains(text(), "Generate")]
    # Sleep    2s
    # Click Element    xpath=//*[contains(text(), "Generate")]
    Wait Until Page Contains Element    xpath=//*[@id="app"]/div/div[1]/main/div/div/div/div/div/div[2]/p    timeout=10s

Copy signature
    Scroll Element Into View    xpath=//*[@id="app"]/div/div[1]/main/div/div/div/div/div/div[2]/p
    Sleep    1s
    ${signature}    Get Text    xpath=//*[@id="app"]/div/div[1]/main/div/div/div/div/div/div[1]/p
    # Sleep    2s
    Log    ${signature}
    Set Suite Variable    ${signature}