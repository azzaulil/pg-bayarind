*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}      https://web.santikadev.com/hotel?hotelId=66&checkInDate=2024-07-30&duration=1&rooms=1&specialRateCode
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Merchant Page
    Select Room
    Fill in Data
    Review
    Continue to Payment
    Select payment BCA VA
    Check
    Pay
    View Payment Instruction
    Copy VA
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Merchant Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Hotel Santika Bandung | Bandung Hotel - Santika Indonesia Hotels and Resorts

Select Room
    Click Element    xpath=//div[@id='hotel-general']/div[2]/div[2]/div/div/button/div
    Sleep    3s
    Click Element    xpath=//div[@id='room-list']/div/div/div[4]/div/div[4]/div/button/div
    Sleep    3s
    Click Element    xpath=//div[@id='room']/div/div/div[2]/div/div/div/div/div[4]/button/div
    Sleep    3s
    
Fill in Data
    Location Should Be    https://web.santikadev.com/booking
    Sleep    3s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/div/div/div/div/div/div
    Sleep    3s
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div/div/div/div/p
    Sleep    3s
    Click Element    xpath=//input[@type='email']
    Sleep    3s
    Input Text    xpath=//input[@type='email']    test1@gmail.com
    Sleep    3s
    Input Text    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div[2]/div/form/div[2]/div/div/div/div/div/input    text=QA
    Sleep    3s
    Input Text    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/ul/li/div[2]/div/form/div[2]/div[2]/div/div/div/div/input    text=Testing
    Sleep    3s
    Input Text    name:telephone    8123456789
    Sleep    3s

Review
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div/div/div/div[3]/button/div
    Sleep    3s

Continue to Payment
    Click Element    xpath=//div[@id='app']/div[12]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[2]/div/div/div[3]/button/div
    Sleep    3s

Select payment BCA VA
    Click Element    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[3]/div/div/div/div[2]/div/div/div
    Sleep    3s

Check
    Click Element    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[5]/div/div/div/div/div/div/div
    Sleep    3s

Pay
    Click Element    xpath=//div[@id='app']/div[13]/main/div/div/div/div/div/div[2]/div/div/div[2]/div[3]/div/div/div[5]/div[2]/button/div
    Sleep    3s

View Payment Instruction
    Click Element    xpath=//div[@id='app']/div[2]/div/div/div[3]/button/div
    Sleep    3s
    Location Should Be    url=https://web.santikadev.com/payment-instruction
    Sleep    3s

Copy VA
    Click Element    xpath=//div[@id='app']/div[4]/main/div/div/div/div/div/div/div/div/div[3]/div[2]/div[2]/div[2]/div
    Sleep    3s
    ${va_number}=    Get Text    xpath=/html/body/div[1]/div/div/div[4]/main/div/div/div/div/div/div/div[1]/div/div[3]/div[2]/div[2]/div[1]/div[2]
    Sleep    3s
    Log    ${va_number}
    Sleep    3s
    Capture Page Screenshot    filename=payment_page.png