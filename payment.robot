*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables    variable.py
# Suite Setup    Authenticate as Admin

*** Test Cases ***
# Create a Booking at Restful Booker
#     ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
#     ${body}    Create Dictionary    
#     ...    firstname=Hans    
#     ...    lastname=Gruber    
#     ...    totalprice=200    
#     ...    depositpaid=false    
#     ...    bookingdates=${booking_dates}
#     ${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
#     ${id}    Set Variable    ${response.json()}[bookingid]
#     Set Suite Variable    ${id}
#     ${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
#     Log    ${response.json()}
#     Should Be Equal    ${response.json()}[lastname]    Gruber
#     Should Be Equal    ${response.json()}[firstname]    Hans   
#     Should Be Equal As Numbers    ${response.json()}[totalprice]    200
#     Dictionary Should Contain Value     ${response.json()}    Gruber

Payment VA
    ${header}    Create Dictionary    
    ...    X-TIMESTAMP=${timestamp}    
    ...    X-SIGNATURE=test
    ...    X-PARTNER-ID=${partnerId}
    ...    X-EXTERNAL-ID=${externalId} 
    ...    CHANNEL-ID=${channelId}

    ${paidAmount}    Create Dictionary    
    ...    value=${value}    
    ...    currency=${currency}

    ${additionalInfo}    Create Dictionary    
    ...    insertId=${insertId}    
    ...    tagId=${tagId}    
    ...    flagType=${flagType}    
    ...    passApp=${passApp}    
    ...    idApp=${idApp}

    ${body}    Create Dictionary    
    ...    partnerServiceId=${partnerServiceId}   
    ...    customerNo=${customerNo}    
    ...    virtualAccountNo=${virtualAccountNo}    
    ...    virtualAccountName=${virtualAccountName}    
    ...    channelCode=${channelCode}        
    ...    paymentRequestId=${paymentRequestId}    
    ...    paidAmount=${paidAmount}
    ...    referenceNo=${referenceNo}
    ...    trxId=${trxId}    
    ...    trxDateTime=${trxDateTime}    
    ...    additionalInfo=${additionalInfo}

    ${response}    POST    url=https://bayarind-converter.santikadev.com/api/v1.0/transfer-va/payment    headers=${header}    json=${body}
    Log    ${response.json()}

*** Keywords ***
Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}