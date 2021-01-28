*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary    

*** Test Cases ***
TD1_ValidateCredentials
    #Test Setup
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://demo.openemr.io/openemr/interface/login/login.php?site=default  browser=googlechrome
    
    Set Selenium Implicit Wait    30s
    
    #for giving implicit size of the window
    ${width}    ${height}    Get Window Size    
    Log To Console    ${width}    
    Log To Console    ${height}    
    
    Set Window Size    800     600   
    Maximize Browser Window
    #Login Page
    Input Text    authUser    admin    
    Input Password    clearPass    pass    
    Select From List By Label    name=languageChoice     English (Indian)       
    Click Element    xpath=//button[@type='submit']    
    #Reload Page    <--keyword to reload the page
    #Go Back        <--keyword to go back
    
    #Dashboard Page
    Page Should Contain    Flow Board    
    Mouse Over    xpath=//div[text()='Patient/Client'] 
    Click Element    xpath=//div[text()='Patients'] 
   
    #PatientFinderPage
    
    Select Frame    fin   
    Click Element    create_patient_btn1
    Unselect Frame    
    
    #SearchOrAddPatientPage
    Select Frame    name=pat
    Select From List By Label    form_title    Mr.        
    Input Text    form_fname    Suriya
    Input Text    form_lname    ShivaKumar     
    Input Text    form_DOB    2021-01-16
    Select From list By Label    form_sex    Male
    Click Button    create
    Unselect Frame
    
    Select Frame    id=modalframe
    Sleep    3s    
    Click Element    xpath=//input[@value='Confirm Create New Patient']     
    Unselect Frame
    
    ${alerttxt}    Handle Alert    ACCEPT    timeout=50s 
    Log To Console    ${alerttxt}       
    
    Run Keyword And Ignore Error    Click Element    xpath=//div[@class='closeDlgIframe']    
    #Click Element    xpath=(//input[@value='Cancel'])[2] 
    unselect Frame
    
    Select Frame    pat
    ${var}    Get Text    //h2[contains(text(),'Record Dashboard')]
    Log To Console    ${var}   
    
    Should Contain    ${var}    Suriya Kumar  
    Log To Console    ${var}     
    
    Element Should Contain    //h2[contains(text(),'Record Dashboard')]    Medical Record Dashboard    
    Unselect Frame    
               