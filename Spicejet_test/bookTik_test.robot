*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary


*** Test Cases ***
TS1_BookingTikTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.spicejet.com/  browser=googlechrome
    Set Selenium Implicit Wait    30s
    Click Element    xpath=//*[@id='ctl00_mainContent_rbtnl_Trip_1']    
    Click Element    locator    
    