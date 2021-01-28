*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary



*** Test Cases ***
TC1_ValidCredential
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://netbanking.hdfcbank.com/netbanking/    browser=ff
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Select Frame    name=login_page
    Input Text    fldLoginUserId    test123
    Click Element     xpath=//img[@alt='continue']
    Unselect Frame