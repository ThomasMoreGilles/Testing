*** Settings ***
Resource  00_basePage.robot

*** Variables ***
# Buttons
${submitRegister}=          //button[normalize-space(@type)='submit']
# Input
${firstNameRegister}=       //input[contains(normalize-space(@name),'firstname')]
${lastNameRegister}=        //input[contains(normalize-space(@name),'lastname')]
${emailRegister}=           //input[contains(normalize-space(@name),'email')]
${passwordRegister}=        //input[contains(normalize-space(@name),'password')]
${rePasswordRegister}=      //input[contains(normalize-space(@name),'re_password')]

*** Keywords ***
Go To Register Page
    Go To    ${BASE_URL}register
    Wait For Page With Element  ${submitRegister}

Create Account
    Go To Register Page
    [Arguments]  ${firstNameInput}=${EMPTY}  ${lastNameInput}=${EMPTY}  ${emailInput}=${EMPTY}  ${passwordInput}=${EMPTY}
    Wait For Page With Element  ${submit}
    Click And Input  ${firstNameRegister}  ${firstNameInput}
    Click And Input  ${lastNameRegister}  ${lastNameInput}
    Click And Input  ${emailRegister}  ${emailInput}
    Click And Input  ${passwordRegister}  ${passwordInput}
    Click And Input  ${rePasswordRegister}  ${passwordInput}
    Wait And Click  ${submitRegister}
