*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary 


*** Test Cases ***
TD1_GetElementDetails
     Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.google.com/    browser=googlechrome 
    Maximize Browser Window
    ${linkcount}    Get Element Count    //a
    Log To Console    ${linkcount}    
    
    ${text}    Get Text    xpath=//a    #(//a)[2]
    Log To Console    ${text}    
    
    ${href}    Get Element Attribute    //a    href
    Log To Console    ${href}    
    
    Set Selenium Implicit Wait    40s 
    
TC2_GetWebElement
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.google.com/    browser=googlechrome 
    Maximize Browser Window
    Set Selenium Implicit Wait    40s 
    
    ${element}    Get WebElement    //a
    Log To Console    ${element}   
    
    ${txt}    Get WebElement    ${element}    
    Log To Console    ${txt}    
    #Click Element ${element} or //a 

TC3_GetWebElementsTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.google.com/    browser=googlechrome 
    Maximize Browser Window
    Set Selenium Implicit Wait    40s   
        
    ${count}    Get Element Count    //a
    Log To Console    ${count}    
    
    ${count}    Get Text    //a


    FOR    ${i}    IN RANGE    0    27
        ${ListOfElements}    Get WebElements    //a
        ${textat}    Get Text    ${ListOfElements}[${i}]
        Log To Console    ${textat}    
        ${href}    Get Element Attribute    ${ListOfElements}[${i}]    href
        Log To Console    ${href}    
    END
  #  ${ListOfElements}    Get WebElements    //a
  # ${textat}    Get Text    ${ListOfElements}[0]
  # Log To Console    ${textat} 
  
TC4_GetWebTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.google.com/    browser=googlechrome 
    Maximize Browser Window
    Set Selenium Implicit Wait    40s   
        
    ${count}    Get Element Count    //a
    ${ListOfElements}    Get WebElements    //a
    
    FOR    ${i}    IN RANGE    0    ${count}
        ${text}    Get Text    ${ListOfElements}[${i}]
        Log To Console    ${text}    
        Run Keyword If    '${text}==Images'    Click Element    ${ListOfElements}[${i}]       
        Exit For Loop If    '${text}==Images'
    END
          

TC5_GetWebForTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.google.com/    browser=googlechrome 
    Maximize Browser Window
    Set Selenium Implicit Wait    40s   
        
    
    ${ListOfElements}    Get WebElements    //a
    
    FOR    ${ele}    IN    @{ListOfElements}    
        ${text}    Get Text    ${ele}
        Log To Console    ${text}    
    END