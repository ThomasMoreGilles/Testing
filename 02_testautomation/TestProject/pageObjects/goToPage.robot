*** Settings ***
Resource  basePage.robot

*** Variables ***
# Pages links
${REGISTER_LNK}=            xpath://button[normalize-space()='Register']
${SIGNIN_LNK}=              xpath://button[normalize-space()='Sign in']
# Buttons
${SIGNUP}=                  xpath://button[@id='RegisterButtonComplete']
${SIGNIN}=                  xpath://button[@id='SignInButtonComplete']

*** Keywords ***
Go To Register Page
    Wait Until Element Is Visible  ${REGISTER_LNK}
    Sleep  5s
    Click Element  ${REGISTER_LNK}
    Wait Until Element Is Visible  ${SIGNUP}
    Location Should Contain  register

Go To Signin Page
    Wait Until Element Is Visible  ${SIGNIN_LNK}
    Sleep  5s
    Click Element  ${SIGNIN_LNK}
    Wait Until Element Is Visible  ${SIGNIN}
    Location Should Contain  login
