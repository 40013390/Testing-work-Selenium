*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary

*** Test Cases ***
TS1_Signup
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.db4free.net/   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    //b[contains(text(),'phpMyAdmin')] 
    Sleep    5s    
    ${title}    Get Title
    Log To Console    ${title}    
    #Close Window    or we can use Switch Window
    Switch Window    phpMyAdmin 
    Input Text    pma_username    admin
    Input Password    pma_password    Pa$sword123
    Click Element    input_go
     
    ${error}    Get Text    //div[contains(text(),'Cannot')] 
    Log To Console    ${error}    
    Log    ${error}       
    
    ${title1}    Get Title
    Log To Console    ${title1}      
        
    
   
           