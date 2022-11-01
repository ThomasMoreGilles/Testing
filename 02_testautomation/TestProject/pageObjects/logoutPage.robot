*** Settings ***
Resource  basePage.robot

*** Variables ***
# Buttons
${SIGNOUT}=                 xpath://button[@id='SignOutButton']
# Input
${MAIL}=                    xpath://input[@name='email']
${PASSW}=                   xpath://input[@name='password']

*** Keywords ***
Logout Account
    Wait Until Element Is Visible  ${SIGNOUT}
    Click Element  ${SIGNOUT}
    Wait Until Element Is Visible  ${SIGNIN_LNK}
