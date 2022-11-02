*** Settings ***
Resource  01_basePage.robot

*** Variables ***
# Buttons
${addCredits}=              //button[contains(normalize-space(),'add credits')]
${submit}=                  //button[normalize-space(@type)='submit']
# Input
${amount}=                  //input[contains(normalize-space(@name),'amount')]
# Credits
${credits}=                 class:css-cpr2ex

*** Keywords ***
Go To Profile Page
    Go To    ${BASE_URL}profile
    Wait For Page With Element  ${AddCredits}

Check Credits
    Go To Profile Page
    ${currentCredits}=  Get Text  ${Credits}

Add Credits
    [Arguments]  ${CreditsToAdd}=${EMPTY}
    Wait For Page With Element  ${addCredits}
    Click Element  ${addCredits}
    Click And Input  ${amount}  ${creditsToAdd}
    Click Element  ${submit}

Difference Before After
    [Arguments]  ${creditsBefore}  ${creditsAfter}
    ${creditsBefore}=  Convert To Number ${creditsBefore}
    ${creditsAfter}=  Convert To Number ${creditsAfter}
    ${difference}=  ${creditsAfter}-${creditsBefore}
    ${difference}=  Convert To String ${difference}
    [Return]  ${difference}

