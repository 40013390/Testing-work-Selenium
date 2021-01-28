*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary    

*** Test Cases ***
TD1_ValidateCredentials
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.medibuddy.in/   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Button    id=wzrk-cancel    
    Click Element    xpath=//a[text()='Signup']
    Input Text    firstName    test
    Input Text    phone   9999999999     
    Input Text    username    usha@gmail.com
    Input Password    password    Passwd@123 
    Select Checkbox    xpath=//input[@type='checkbox']
    Click Element    xpath=//button[@type='submit']       
    close Browser