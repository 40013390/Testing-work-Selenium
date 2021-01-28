*** Settings ***
Library    Collections
Library    OperatingSystem    
Library    String 
Library    SeleniumLibrary 
*** Variables ***
${sum}    0        
*** Keywords ***
InnerForLoop
    [Arguments]    ${range}
    FOR    ${i}    IN RANGE    1    ${range}
        Log To Console    bala    
    END
    
GetValue
    [Arguments]    ${name}
    Log To Console    ${name}    
    Return From Keyword    ${name}+${name}
*** Test Cases ***
TC1_TableValidation
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    browser=googlechrome 
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Maximize Browser Window 
    
    ${count}    Get Element Count    //table[@id='example']/tbody/tr
    
    ${total}    Set Variable    0
    FOR    ${i}    IN RANGE    1    ${count}+1
            
        ${cell}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[6]  
        ${cell}    Remove String    ${cell}    $    ,   
        ${total}    Evaluate     ${total}+ ${cell}    
        Log To Console    ${cell}    
          
    END
    Log To Console    ${total}
    
TC2_GetName
    FOR    ${i}    IN RANGE    1    5
        InnerForLoop    ${i}
    END
    
    
        
      