*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary 

*** Test Cases ***
TS1_popupsTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=http://www.echoecho.com/javascript4.htm   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Sleep    3s
    Click Element    B2
    ${var}    Handle Alert    ACCEPT    timeout=30s
    Log To Console    ${var}     