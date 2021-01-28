*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary 


*** Test Cases ***
TC1_TableValidation
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    browser=googlechrome 
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Maximize Browser Window 

    Table Should Contain    xpath=//table[@id='example']    Brenden Wagner
    
    ${cell}    Get Table Cell    xpath=//table[@id='example']    1    2   
    Log To Console    ${cell}  
    
    Table Cell Should Contain    xpath=//table[@id='example']    1    2    Name 
    
    Table Row Should Contain    xpath=//table[@id='example']    1    Age  
    
TC2_TableHandlingTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    browser=googlechrome 
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    Maximize Browser Window 
    #To get count of rows and print in for loop
    ${count}    Get Element Count    //table[@id='example']


    # 1to 11
    FOR    ${i}    IN RANGE    1    11
        Log To Console    ${count+1} 
           
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2]
        Run Keyword If    '${name}'=='Brenden Wagner'    Click Element    //table[@id='example']/tbody/tr[${i}]/td[1]
        Log To Console    ${name}    
        Exit For Loop    #Exit For Loop If    '${name}'=='Brenden Wagner' <----or we can use instead of 3 lines of Run Keyword If
    END
    

TC3_InsertRowTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    browser=googlechrome 
    Set Selenium Implicit Wait    10s
    Go To    url=https://editor.datatables.net/
    Maximize Browser Window 
    Click Element    //*[text()='Brenden Wagner']
    Click Element    //*[text()='Edit']
    Input Text    //*[@id='DTE_Field_position']    QA Engineer
    Click Element    //*[text()='Update']
    Sleep    5s
    ${name}    Get Text    //table[@id='example']/tbody/tr[5]/td[3]    #//table[@id='example']/tbody/tr[5]/td[1]
    Log To Console    ${name}
    Table Row Should Contain    xpath=//table[@id='example']    5    Brenden Wagner
    FOR    ${i}    IN RANGE    1    11
        ${name}    Get Text    //table[@id='example']/tbody/tr[${i}]/td[2]
        Run Keyword If    '${name}'=='Brenden Wagner'    Click Element    //table[@id='example']/tbody/tr[${i}]/td[1]
        Log To Console    ${name}    
        Exit For Loop   
    END
    
    
    

         