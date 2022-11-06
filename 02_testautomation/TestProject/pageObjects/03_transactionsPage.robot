*** Settings ***
Resource  00_basePage.robot

*** Variables ***
# Buttons
${addCredits}=              //button[contains(normalize-space(),'add credits')]
${submitCredits}=           //button[normalize-space(@type)='submit']
# Input
${amount}=                  //input[contains(normalize-space(@name),'amount')]
# Credits
${credits}=                 class:css-cpr2ex

*** Keywords ***
Go To Profile Page
    Go To    ${BASE_URL}profile
    Wait For Page With Element  ${addCredits}

Check Credits
    Go To Profile Page
    ${currentCredits}=  Get Text  ${Credits}

Add Credits
    [Arguments]  ${CreditsToAdd}=${EMPTY}
    Wait For Page With Element  ${addCredits}
    Click Element  ${addCredits}
    Click And Input  ${amount}  ${creditsToAdd}
    Click Element  ${submitCredits}

Difference Before After
    [Arguments]  ${creditsBefore}  ${creditsAfter}
    ${creditsBefore}=  Convert To Number ${creditsBefore}
    ${creditsAfter}=  Convert To Number ${creditsAfter}
    ${difference}=  ${creditsAfter}-${creditsBefore}
    ${difference}=  Convert To String ${difference}
    [Return]  ${difference}

