*** Settings ***
Resource            ../pageObjects/01_basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
# Input
${email}=           registered@gmail.com
${password}=        Password123!
${amount}=          5

*** Test Cases ***
Add Credits With Normal Amount
    Login Account  ${email}  ${password}
    Go To Profile Page
    ${creditsBefore}=  Check Credits
    Add Credits  ${amount}
    ${creditsAfter}=  Check Credits
    ${difference}=  Difference Before After  ${creditsBefore}  ${creditsAfter}
    Should Be Equal As Strings    ${amount}    ${difference}

Add Credits With Negative Amount
    Login Account  ${email}  ${password}
    Go To Profile Page
    ${creditsBefore}=  Check Credits
    Add Credits  -5
    ${creditsAfter}=  Check Credits
    ${difference}=  Difference Before After  ${creditsBefore}  ${creditsAfter}
    Should Be Equal As Strings    ${amount}    ${difference}

Add Credits With Large Amount
    Login Account  ${email}  ${password}
    Go To Profile Page
    ${creditsBefore}=  Check Credits
    Add Credits  99999999999999
    ${creditsAfter}=  Check Credits
    ${difference}=  Difference Before After  ${creditsBefore}  ${creditsAfter}
    Should Be Equal As Strings    ${amount}    ${difference}
