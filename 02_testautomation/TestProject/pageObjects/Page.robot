*** Settings ***
Resource  basePage.robot

*** Variables ***
# Pages links
${SIGNIN_LNK}=              xpath://button[normalize-space()='Sign in']
${REGISTER_LNK}=            xpath://button[normalize-space()='Register']
# Input
${FIRST_NAME}=              name:firstname
${LAST_NAME}=               name:lastname
${EMAIL}=                   name:email
${PASSW}=                   name:password
${RE_PSSW}=                 name:re_password
# Buttons
${SIGNUP}=                  xpath://button[@id='RegisterButtonComplete']
${SIGNIN}=                  xpath://button[@id='SignInButtonComplete']

*** Keywords ***
# Go to pages
Go To Register Page
    Wait Until Element Is Visible  ${REGISTER_LNK}
    Sleep  5s
    Click Element  ${REGISTER_LNK}

Go To Signin Page
    Wait Until Element Is Visible  ${SIGNIN_LNK}
    Sleep  5s
    Click Element  ${SIGNIN_LNK}

# Account
Create Account
    [Arguments]  ${firstName}=${EMPTY}  ${lastName}=${EMPTY}  ${email}=${EMPTY}  ${password}=${EMPTY}
    Wait Until Element Is Visible  ${EMAIL}
    Input Text  ${FIRST_NAME}  ${firstName}
    Input Text  ${LAST_NAME}  ${lastName}
    Input Text  ${EMAIL}  ${email}
    Input Text  ${PASSW}  ${password}
    Input Text  ${RE_PSSW}  ${password}
    Sleep  2s
    Click Element  ${SIGNUP}

Login Account
    [Arguments]  ${email}=${EMPTY}  ${password}=${EMPTY}
    Wait Until Element Is Visible  ${EMAIL}
    Input Text  ${EMAIL}  ${email}
    Input Text  ${PASSW}  ${password}
    Sleep  2s
    Click Element  ${SIGNIN}

# Logout
Logout


# Add credits
Add Credits With Negative Amount


Add Credits With Normal Amount


Add Credits With Large Amount

