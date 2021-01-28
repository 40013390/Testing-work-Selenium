*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary    

*** Test Cases ***
TD1_ValidateCredentials
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.royalcaribbean.com/  browser=googlechrome
    Maximize Browser Window
    FOR    ${count}    IN RANGE    0    99
        Run Keyword And Ignore Error    Click Element    //div[@class='email-capture_body']
        Run Keyword And Ignore Error    Click Element    //   span[text()='Sign In')]
        ${count}    Get Element Count    link=Create an account
        Exit For Loop If    ${count}>0 
    END
    Set Selenium Implicit Wait    40s
    #Mouse Over    //*[text()='Sign In']
    #Sleep    3s    
    #Run Keyword And Ignore Error    Click Element    //div[@class='email-capture_body']/'
                                                     #//*[name()='svg']    
     
    #Click Element    //*[contains(text(),'Sign In')]    
    
    Click Element    //a[text()='Create an account']    
    Input Text    mat-input-3   Daina   
    Input Text    mat-input-4    Lastname
    Click Element    //span[text()='Month']    
    Click Element    //span[contains(text(),' March ')]
    Click Element    //span[text()='Day']    
    #Scroll Element Into View    //*[contains(text(),'17')]
    Click Element    //span[contains(text(),'17')]
    Input Text    mat-input-5    1999 
    
    Click Element    //span[text()='Country/Region of residence']        
    Click Element    //span[contains(text(),' India ')]    
    Input Text    mat-input-2    daina@gmail.com    
    Input Password    mat-input-6    Pa$sw0rd    
    
    Click Element    //span[text()='Select one security question']    
    Click Element    //span[contains(text(),' What is the name of the street where you first lived? ')]    
    
    Input Text    mat-input-7    Answer text to fill    
    
    Select Checkbox    //input[@id='mat-checkbox-2-input']
    Click Button    //*[text()=' Done ']
    
                 
         
     