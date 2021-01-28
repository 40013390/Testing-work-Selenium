*** Settings ***
Library    OperatingSystem    
Library    SeleniumLibrary


*** Test Cases ***
TS1_PrimaryTest
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.jcpenney.com/   browser=googlechrome
    ${actualtitle}    Get Title
    Log To Console    ${actualtitle}
    Log     ${actualtitle}
    
    ${currentURL}    Get Location
    Log To Console    ${currentURL}
    Log     ${currentURL}
    
TS2_AddToCart
    Append To Environment Variable    Path    ${OUTPUT_DIR}${/}driver 
    Open Browser    url=https://www.jcpenney.com/   browser=googlechrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=searchInputId    Acdc mens Crew Neck Short Sleeve Music Graphic T-shirt    
    Click Element    //button[@data-automation-id='searchIconBlock'] 
    #Click Element    //button[@title='search']
    Click Button    large   
    #Click Element //button[text()='large']
    Select From List By Label   quantity    2    
    Click Element    //p[@data-automation-id='addToCart']    
    Click Element   //button[text()='View Cart & Checkout'] 
     
    Run Keyword And Ignore Error    Click Element    id=MetricalCloseArea
    
    ${qtySelected}    Get Selected List Label    //select[@data-automation-id='product-quantity-block']  
    Log    ${qtySelected}    
    Click Element    //button[text()='Remove']    
  
    