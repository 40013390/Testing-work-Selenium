*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary


*** Test Cases ***
TC1_ValidCredential45
    Append To Environment Variable    Path    C:\\Users\\CTEA\\Testing                       
    Open Browser    url=https://magento.com/    browser=ff
    close Browser