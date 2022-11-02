*** Settings ***
Resource  01_basePage.robot

*** Variables ***
# Buttons
${submit}=          //button[normalize-space(@type)='submit']
${signOut}=         //button[contains(normalize-space(),'Sign out')]

# Input
${firstName}=       //input[contains(normalize-space(@name),'firstname')]
${lastName}=        //input[contains(normalize-space(@name),'lastname')]
${email}=           //input[contains(normalize-space(@name),'email')]
${password}=        //input[contains(normalize-space(@name),'password')]
${rePassword}=      //input[contains(normalize-space(@name),'re_password')]

*** Keywords ***
# Register
Go To Register Page
    Go To    ${BASE_URL}register
    Wait For Page With Element  ${submit}

Create Account
    Go To Register Page
    [Arguments]  ${firstNameInput}=${EMPTY}  ${lastNameInput}=${EMPTY}  ${emailInput}=${EMPTY}  ${passwordInput}=${EMPTY}
    Wait For Page With Element  ${submit}
    Click And Input  ${firstName}  ${firstNameInput}
    Click And Input  ${lastName}  ${lastNameInput}
    Click And Input  ${email}  ${emailInput}
    Click And Input  ${password}  ${passwordInput}
    Click And Input  ${rePassword}  ${passwordInput}
    Click Element  ${submit}

# Login
Go To Signin Page
    Go To    ${BASE_URL}login
    Wait For Page With Element  ${submit}

Login Account
    Go To Signin Page
    [Arguments]  ${emailInput}=${EMPTY}  ${passwordInput}=${EMPTY}
    Wait For Page With Element  ${submit}
    Click And Input  ${email}  ${emailInput}
    Click And Input  ${password}  ${passwordInput}
    Click Element  ${submit}

# Logout
Logout Account
    [Arguments]  ${email}  ${password}
    Login Account  ${email}  ${password}
    Wait For Page With Element  ${signOut}
    Click Element  ${signOut}


