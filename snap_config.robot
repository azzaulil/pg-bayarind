*** Settings ***
Documentation     Snap Configurator
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://snaptest-configurator.bayarind.id/login
${Email}          snapconfigurator@bayarind.id
${Password}       Rahasia123$

*** Test Cases ***
Check merchant data
    Open Browser To Snap Page
    Login
    Select merchant    merchant=Santika Bangka
    Copy data
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Snap Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3s

Login
    Input Text    email    ${Email}
    Input Password    password    ${Password}
    Click Element    xpath=//button[@type='submit']
    Sleep    3s
    Page Should Contain    text=Admin Configurator    loglevel=TRACE

Select merchant
    [Arguments]    ${merchant}
    Click Element    xpath=//*[@id="app"]/div/div[1]/nav/div[1]/div/div[1]/div[3]/a
    Sleep    3s
    Input Text    name:searchInput-global    ${merchant}
    Sleep    3s
    Click Element    xpath=//*[@id="app"]/div/div[1]/main/div/div/div/div/div/div[5]/div/div/div/table/tbody/tr/td[5]/div/a
    Wait Until Page Contains    Snap Merchant Information
    Sleep    1s

Copy data
    Click Element    merch_name
    Press Keys    merch_name    CTRL+A    CTRL+C    #copy merchant name
    Sleep    1s
    Capture Page Screenshot    filename=merchant_detail.png