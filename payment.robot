*** Settings ***
Library    RequestsLibrary
Library    Collections
Suite Setup    Authenticate as Admin

*** Test Cases ***
Get Bookings from Restful Booker
    ${body}    Create Dictionary    firstname=John
    ${response}    GET    https://restful-booker.herokuapp.com/booking    ${body}
    Status Should Be    200
    Log List    ${response.json()}
    FOR  ${booking}  IN  @{response.json()}
        ${response}    GET    https://restful-booker.herokuapp.com/booking/${booking}[bookingid]
        TRY
            Log    ${response.json()}
        EXCEPT
            Log    Cannot retrieve JSON due to invalid data
        END
    END

Create a Booking at Restful Booker
    ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
    ${body}    Create Dictionary    firstname=Hans    lastname=Gruber    totalprice=200    depositpaid=false    bookingdates=${booking_dates}
    ${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
    ${id}    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${id}
    ${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[lastname]    Gruber
    Should Be Equal    ${response.json()}[firstname]    Hans   
    Should Be Equal As Numbers    ${response.json()}[totalprice]    200
    Dictionary Should Contain Value     ${response.json()}    Gruber

Delete Booking
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${response}    DELETE    url=https://restful-booker.herokuapp.com/booking/${id}    headers=${header}   
    Status Should Be    201    ${response}

Payment VA
    ${header}    Create Dictionary    X-TIMESTAMP=2024-07-23T16:00:00+07:00    
    ...    X-SIGNATURE=    
    ...    X-PARTNER-ID=    
    ...    X-EXTERNAL-ID=    
    ...    CHANNEL-ID=1021
    ${paidAmount}    Create Dictionary    value=219000.00    currency=IDR
    ${body}    Create Dictionary    partnerServiceId=   77124    
    ...    customerNo=14603628212079494    
    ...    virtualAccountNo=   7712414603628212079494    
    ...    virtualAccountName=QA Testing    
    ...    paymentRequestId=20240723    
    ...    trxId=662FD8172VA4569    
    ...    paidAmount=${paidAmount}
    ${response}    POST    url=https://bayarind-converter.santikadev.com/api/v1.0/transfer-va/payment    headers=    json=${body}

*** Keywords ***
Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}