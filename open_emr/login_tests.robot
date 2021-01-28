*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary

*** Test Cases ***
TC1_ValidCredential
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver                       
    Open Browser    url=https://demo.openemr.io/b/openemr/interface/login/login.php?site=default    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
   
    Input Text    authUser    admin    
    Input Password    clearPass    pass    
    
    Select From List By Label    name=languageChoice     English (Indian)       
    Click Element    xpath=//button[@type='submit']  
    Page Should Contain    Flow Board    
    #Click Element    //li[@data-bind='click: Logout']
    Mouse Over    //span[@data-bind="text:fname"]
   
    
    Click Element    //li[text()='Logout']        