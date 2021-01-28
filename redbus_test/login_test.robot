*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
TC1_ValidCredential
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.redbus.in/   browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    id=i-icon-profile   
    Click Element    id=signInLink   
    #Select From List By Label    name=country_code_list
    Select Frame    //iframe[@class='modalIframe']
    Input Text    id=mobileNoInp    9999999999   
     