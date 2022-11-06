*** Settings ***
Resource  00_basePage.robot

*** Variables ***
# Buttons
${submitLogin}=          //button[normalize-space(@type)='submit']
${signOutLogin}=         //button[contains(normalize-space(),'Sign out')]
# Input
${emailLogin}=           //input[contains(normalize-space(@name),'email')]
${passwordLogin}=        //input[contains(normalize-space(@name),'password')]

*** Keywords ***
Go To Signin Page
    Go To    ${BASE_URL}login
    Wait For Page With Element  ${submitLogin}

Login Account
    Go To Signin Page
    [Arguments]  ${emailInput}=${EMPTY}  ${passwordInput}=${EMPTY}
    Wait For Page With Element  ${submitLogin}
    Click And Input  ${emailLogin}  ${emailInput}
    Click And Input  ${passwordLogin}  ${passwordInput}
    Wait And Click  ${submitLogin}

# Logout
Logout Account
    [Arguments]  ${emailLogin}  ${password}
    Login Account  ${emailLogin}  ${password}
    Wait For Page With Element  ${signOutLogin}
    Click Element  ${signOutLogin}


