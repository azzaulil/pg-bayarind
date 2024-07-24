*** Settings ***
Documentation     Edit the url and checkinDate first
Library           SeleniumLibrary
Resource          url_hotel.resource

*** Test Cases ***
Generate VA number
    Open Browser To Merchant Page    https://esmod-payment.edusis.co.id/web/login
    Login
    Select Invoice    inv_no=INV/2024/07/0005
    Pay
    Copy VA
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Merchant Page
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3s

Login
    Input Text    login    victa.chin@edu.esmodjakarta.com
    Sleep    3s
    Input Password    password    esmod
    Sleep    3s
    Click Button    xpath=//button[@type="submit"]
    Sleep    3s
    Wait Until Page Contains    text=Dashboard    timeout=10s

Select Invoice
    [Arguments]    ${inv_no}
    Click Link    xpath=//a[@href="/my/invoices"]
    Sleep    3s
    Wait Until Page Contains    text=Invoices & Bills    timeout=10s
    Click Element    xpath=//a[contains(text(), "${inv_no}")]
    Sleep    3s
    Wait Until Page Contains    text=Make Payment

Pay
    Sleep    3s
    Click Element    xpath=//a[@data-target="#pay_with"]
    Sleep    3s
    Click Button    o_payment_form_pay
    Sleep    3s
    Scroll Element Into View    xpath=//a[@href="/my/payments/1854/cancel"]
    Sleep    3s
    Click Element    xpath=//button[@title="Pay Now"]

Copy VA
    Wait Until Element Is Visible    va-number    timeout=20s
    Click Button    btn-va-number
    Sleep    3s
    ${va_number}=    Get Element Attribute    xpath=//*[@id="va-number"]    value
    Sleep    3s
    Log    ${va_number}
    Sleep    3s
    Capture Page Screenshot    filename=payment_page_esmod.png