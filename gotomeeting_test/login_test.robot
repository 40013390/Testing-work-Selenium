*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary    


*** Test Cases ***
TS1_ValidCredentials
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.gotomeeting.com/en-in   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    //a[@class='button button--primary button--small']
    Input Text    first-name   test1
    Input Text    LastName    testlstname
    Input Text    login__email    test@gmail.com
    Input Text    contact-number    9999999999
    Select From List By Label    name=JobTitle    Engineering
    Input Password    login__password    Pa$sword123
    #Mouse Over    //img[@alt='Trust Arc']    #//button[text()='Sign Up']            
    Scroll Element Into View    //img[@alt='Trust Arc']
    Select Radio Button    companySize    10-99       
    
    Click Element    //button[text()='Sign Up']        