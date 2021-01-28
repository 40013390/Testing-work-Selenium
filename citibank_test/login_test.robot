*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary


*** Test Cases ***
TS1_TestCredentials
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.online.citibank.co.in/   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    //a[text()='APPLY FOR CREDIT CARDS']
    Switch Window    Online Credit Card Application Form | Citi India
    
    ${message}    Get Text    //h1[contains(text(),'Get')] 
    Log To Console    ${message}    
    Log    ${message}    
    Click Element    //a[contains(text(),'Travel')]   
    Input Text    Email_Id    text@gmail.com
    Input Text    mobile_number    9999999999
    Select From List By Label    salutations-select-1598329735325    Mx.
    Input Text    FirstName    usha chinnu    
    Select Radio Button    radioButton-radio-group-1598330658729    No
    Select From List By Label    salutations-select-1598332596260    Mr.   
    #Scroll Element Into View    locator                    
    Input Text    Father_FirstName    Neeli 
    Input Text    Father_MiddleName    jai 
    Input Text    Father_LastName    shankar    
    Input Text    exist_dob_dd    17
    Input Text    exist_dob_mm    07
    Input Text    exist_dob_yy    1999
    Select Radio Button    radiobttn Married    Unmarried
    Select Radio Button    radiobttn N_India    Indian
    Select Radio Button    radioButton-radio-group-1598334736134    Resident Individual
    
                   
        