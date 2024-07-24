*** Settings ***
Documentation     Edit the timestamp and copy the desired request body
Library           SeleniumLibrary
Resource          url_hotel.resource

*** Test Cases ***
Generate Signature
    Open Browser To Merchant Page    ${snap_config}
    Login
    Fill the form
    Copy signature
    # Screenshot page
    [Teardown]    Close Browser

*** Keywords ***
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
    Input Text    timestamp    2024-07-24T16:25:00+07:00
    Input Text    http_method    POST
    Input Text    endpoint_url    /api/v1.0/transfer-va/payment
    Input Text    private_key    ${private_key}
    Click Element    body
    Press Keys    body    CTRL+v
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

Screenshot page
    Click Element    xpath=//div[@id='app']/div[4]/main/div/div/div/div/div/div/div/div/div[3]/div[2]/div[2]/div[2]/div
    Sleep    3s
    ${va_number}=    Get Text    xpath=/html/body/div[1]/div/div/div[4]/main/div/div/div/div/div/div/div[1]/div/div[3]/div[2]/div[2]/div[1]/div[2]
    Sleep    3s
    Log    ${va_number}
    Sleep    3s
    Capture Page Screenshot    filename=signature.png