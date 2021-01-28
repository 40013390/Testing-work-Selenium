*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary    




*** Test Cases ***
TD1_ValidateCredentials
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.royalcaribbean.com/  browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    40s
    FOR    ${count}    IN RANGE    0    99
        Run Keyword And Ignore Error    Click Element    //div[@class='email-capture_body']
        Run Keyword And Ignore Error    Click Element    //span[text()='Sign In')]
        ${count}    Get Element Count    link=Create an account
        Exit For Loop If    ${count}>0 
    END
    