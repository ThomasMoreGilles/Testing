*** Settings ***
Resource  basePage.robot

*** Variables ***
# Buttons
${SIGNIN}=                  xpath://button[@id='SignInButtonComplete']
# Input
${MAIL}=                    xpath://input[@name='email']
${PASSW}=                   xpath://input[@name='password']

*** Keywords ***
Login Account
    Go To Signin Page
    [Arguments]  ${email}=${EMPTY}  ${password}=${EMPTY}
    Wait Until Element Is Visible  ${SIGNIN}
    Input Text  ${MAIL}  ${email}
    Input Text  ${PASSW}  ${password}
    Click Element  ${SIGNIN}
