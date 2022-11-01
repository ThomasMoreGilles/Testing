*** Settings ***
Resource  basePage.robot

*** Variables ***
# Buttons
${SIGNUP}=                  xpath://button[@id='RegisterButtonComplete']
# Input
${FIRST_NAME}=              xpath://input[@name='firstname']
${LAST_NAME}=               xpath://input[@name='lastname']
${MAIL}=                    xpath://input[@name='email']
${PASSW}=                   xpath://input[@name='password']
${RE_PSSW}=                 xpath://input[@name='re_password']

*** Keywords ***
Create Account
    Go To Register Page
    [Arguments]  ${firstName}=${EMPTY}  ${lastName}=${EMPTY}  ${email}=${EMPTY}  ${password}=${EMPTY}
    Wait Until Element Is Visible  ${SIGNUP}
    Input Text  ${FIRST_NAME}  ${firstName}
    Input Text  ${LAST_NAME}  ${lastName}
    Input Text  ${MAIL}  ${email}
    Input Text  ${PASSW}  ${password}
    Input Text  ${RE_PSSW}  ${password}
    Click Element  ${SIGNUP}

