*** Settings ***
Documentation     Edit the url and checkinDate first
Library           SeleniumLibrary
Resource          url_hotel.resource

*** Test Cases ***
Generate VA number
    Open Browser To Merchant Page    ${HOTEL_SANTIKA_GARUT}
    Select Room
    Fill in Data
    Review
    Continue to Payment
    Select payment BCA and checkbox
    Pay
    View Payment Instruction
    Copy VA
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Merchant Page
    [Arguments]    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[@id='hotel-general']/div[2]/div[2]/div/div/button/div    timeout=10s

Select Room
    Click Element    xpath=//div[@id='hotel-general']/div[2]/div[2]/div/div/button/div
    Sleep    1s
    Click Element    xpath=//div[@id='room-list']/div/div/div[4]/div/div[4]/div/button/div
    Sleep    1s
    Click Element    xpath=//div[@id='room']/div/div/div[2]/div/div/div/div/div[4]/button/div
    
Fill in Data
    Wait Until Location Is    expected=https://web.santikadev.com/booking    timeout=20s
    Sleep    1s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/div/div/div/div/div/div
    Sleep    1s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div/div/div/div/p
    Sleep    1s
    Click Element    xpath=//input[@type='email']
    Sleep    1s
    ${RANDOM INT}=    Evaluate    random.randint(1,100)    random
    Input Text    xpath=//input[@type='email']    test${RANDOM INT}@gmail.com
    Sleep    1s
    Input Text    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div[2]/div/form/div[2]/div/div/div/div/div/input    text=QA
    Sleep    1s
    Input Text    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div[2]/div/form/div[2]/div[2]/div/div/div/div/input    text=Testing
    Sleep    1s
    ${random_part1}    Evaluate    random.randint(100, 999)
    ${random_part2}    Evaluate    random.randint(1000, 9999)
    ${phone_number}    Set Variable    ${area_code}${random_part1}${random_part2}
    Input Text    name:telephone    ${phone_number}

Review
    Wait Until Element Is Visible    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/div[3]/button/div    timeout=10s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/div[3]/button/div

Continue to Payment
    Wait Until Element Is Visible    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[2]/div/div/div[3]/button/div    timeout=10s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[2]/div/div/div[3]/button/div
    Wait Until Element Is Visible    xpath=//*[contains(text(), "BCA Transfer")]    timeout=10s

Select payment BCA and checkbox
    Sleep    2s
    Click Element    xpath=//*[contains(text(), "BCA Transfer")]
    Click Element    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[5]/div/div/div/div/div/div/div
    Wait Until Element Is Visible    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[5]/div[2]/button/div    timeout=10s

Pay
    Sleep    2s
    Click Element    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[5]/div[2]/button/div
    Wait Until Element Is Visible    xpath=//div[@id='app']/div[2]/div/div/div[3]/button/div    timeout=10s

View Payment Instruction
    Sleep    2s
    Click Element    xpath=//div[@id='app']/div[2]/div/div/div[3]/button/div
    Wait Until Location Is    https://web.santikadev.com/payment-instruction    timeout=10s
    Wait Until Element Is Visible    xpath=//div[@id='app']/div[4]/main/div/div/div/div/div/div/div/div/div[3]/div[2]/div[2]/div[2]/div    timeout=10s

Copy VA
    Sleep    1s
    Click Element    xpath=//div[@id='app']/div[4]/main/div/div/div/div/div/div/div/div/div[3]/div[2]/div[2]/div[2]/div
    Sleep    1s
    ${va_number}=    Get Text    xpath=/html/body/div[1]/div/div/div[4]/main/div/div/div/div/div/div/div[1]/div/div[3]/div[2]/div[2]/div[1]/div[2]
    Sleep    1s
    Log    ${va_number}
    Capture Page Screenshot    filename=payment_page.png