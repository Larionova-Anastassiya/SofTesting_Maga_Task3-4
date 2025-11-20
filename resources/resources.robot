*** Variables ***
${URL}            https://www.demoblaze.com/
${BROWSER}        chrome
${CHROMEDRIVER}   ${CURDIR}/../drivers/chromedriver.exe
${USERNAME}       LarionovaAnastassiya2003
${PASSWORD}       Nastya003


*** Keywords ***
Open Demo Blaze
    
    Open Browser    ${url}  chrome
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//nav    10s

Close Demo
    Close Browser

Wait Until Element Is Clickable
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}

Sign Up User
    Wait Until Element Is Clickable    id=signin2
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username    5s
    Input Text       id=sign-username    ${USERNAME}
    Input Text       id=sign-password    ${PASSWORD}
    Click Button     xpath=//button[text()='Sign up']
    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Sleep    1s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='signInModal']//button[@class='close']
    Sleep    1s

Login User
    [Arguments]    ${username}=${USERNAME}    ${password}=${PASSWORD}
    Wait Until Element Is Clickable    id=login2
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername    5s
    Input Text       id=loginusername    ${username}
    Input Text       id=loginpassword    ${password}
    Click Button     xpath=//button[text()='Log in']
    ${alert_status}=    Run Keyword And Return Status    Handle Alert    action=ACCEPT
    Sleep    1s
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='logInModal']//button[@class='close']
    Sleep    1s
    ${login_success}=    Run Keyword And Return Status    Wait Until Page Contains    Welcome ${username}    10s
    Run Keyword If    not ${login_success}    Fail    Login failed for user '${username}'

Logout User
    Wait Until Element Is Clickable    id=logout2
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2    5s

Buy Product
    Wait Until Element Is Clickable    xpath=//a[text()='Samsung galaxy s6']
    Click Link    xpath=//a[text()='Samsung galaxy s6']
    Wait Until Element Is Clickable    xpath=//a[text()='Add to cart']    5s
    Click Element    xpath=//a[text()='Add to cart']
    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Click Link    xpath=//a[text()='Cart']
    Wait Until Page Contains    Samsung galaxy s6    5s
