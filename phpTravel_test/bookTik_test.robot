*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary 


*** Test Cases ***
TD1_BookTicket
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    browser=googlechrome 
    Set Selenium Implicit Wait    10s
    Go To    url=https://phptravels.net/ 
    #Click Element    link=USD
    #Click Element    link=INR     # or    Click Element     a[text()='INR']
#we cannnot get displayed on the UI. On UI it has USD.,inside it has INR .To avoid this ELEMENT NOT INTERACTABLE or INTECEPTED ERROR:following 3 lines would be performed
    ${ele}    Get WebElement    //a[text()='INR']
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${ele}
    sleep    5s       

    
    Maximize Browser Window
    Click Element    //a[contains(text(),'Flights')]
#selection of from location
    Click Element    //span[text()='LHE']    
    Sleep    3s 
    Press Keys    None    new york
    Click Element    xpath=//div[contains(text(),'EWR')] 
    #Input Text    xpath=(//div[@id='select2-drop']//input[@class='select2-input'])[8]    new york  
#selection of to location as sindal
    Click Element    //span[contains(text(),'DXB')]
    Sleep    1.5s    
    press Keys    None    Sindal 
    Click Element    //*[contains(text(),'CNL')]                

#it is one way to execute java sript   
    #Execute Javascript   document.getElementById('FlightsDateStart').value='2021-01-31'    
#another way of doing
    ${ele}    Get WebElement    //input[@placeholder='Depart']
    Execute Javascript    arguments[0].value='2021-01-31'    ARGUMENTS    ${ele}        
#WE CAN GIVE NO OF ARGUMENTS After ARGUMENTS    ${ele}    arg2    arg3....     (or)    arg1;arg2....
    
    
    FOR    ${i}    IN RANGE    1    4
        
        Click Element    xpath=(//button[text()='+'])[3]
    END
    
    #FOR    ${i}    IN RANGE    1    4
    #    Click Element    xpath=(//button[text()='+'])[5]
    #END    
    Click Element    xpath=(//button[contains(text(),'Search')]) [2] 
    Click Element    //button[contains(text(),'Book Now')][1]
    
    ${amount}    Get Text    //*[text()='Total Amount']/following::h5[contains(text(),'USD')]
    Log To Console    ${amount}    
    
    Element Text Should Be    //*[text()='Total Amount']/following::h5[contains(text(),'USD')]        USD 5089.92$    
    
    Execute Javascript    arguments[0].click()


