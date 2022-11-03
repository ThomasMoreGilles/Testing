*** Settings ***
Resource            ../pageObjects/00_basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
${inCorrect}=       f#`+
${@}=            @gmail.com

*** Keywords ***
Random String
    ${randomString}=  Generate Random String    5-20
    [Return]  ${randomString}

Random String Letters
    ${randomString}=  Generate Random String    5-20    [LETTERS]
    [Return]  ${randomString}

*** Test Cases ***
# Register
Register With InCorrect Email
    ${firstName}=  Random String Letters
    ${lastName}=  Random String Letters
    ${password}=  Random String
    Create Account  ${firstName}  ${lastName}  ${inCorrect}  ${password}
    Wait For Page
    Location Should Contain  register

Register With InCorrect Password
    ${firstName}=  Random String Letters
    ${lastName}=  Random String Letters
    Create Account  ${firstName}  ${lastName}  ${firstName}${@}  ${inCorrect}
    Wait For Page
    Location Should Contain  register

Register With Correct Information
    ${firstName}=  Random String Letters
    ${lastName}=  Random String Letters
    ${password}=  Random String
    Create Account  ${firstName}  ${lastName}  ${firstName}${@}  ${password}
    Wait For Page
    Location Should Contain  login
