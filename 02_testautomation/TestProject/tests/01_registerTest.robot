*** Settings ***
Resource            ../pageObjects/01_basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
${inCorrect}=       f@+

*** Keywords ***
RandomString
    ${randomString}=  Generate Random String    5-20    [LETTERS]
    [Return]  ${randomString}

*** Test Cases ***
# Register
Register With InCorrect Email
    ${randomString}=  RandomString
    ${randomString0}=  RandomString
    ${randomString1}=  RandomString
    Create Account  ${randomString}  ${randomString0}  ${inCorrect}  ${randomString1}
    Wait For Page
    Location Should Contain  register

Register With InCorrect Password
    ${randomString}=  RandomString
    ${randomString0}=  RandomString
    ${randomString1}=  RandomString
    Create Account  ${randomString}  ${randomString0}  ${randomString}@gmail.com  ${inCorrect}
    Wait For Page
    Location Should Contain  register

Register With Correct Information
    ${randomString}=  RandomString
    ${randomString0}=  RandomString
    ${randomString1}=  RandomString
    Create Account  ${randomString}  ${randomString0}  ${randomString}@gmail.com  ${randomString1}
    Wait For Page
    Location Should Contain  login
