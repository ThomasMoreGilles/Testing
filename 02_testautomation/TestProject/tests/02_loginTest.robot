*** Settings ***
Resource            ../pageObjects/01_basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***
# Input
${email}=         registered@gmail.com
${password}=      Password123!
${inCorrect}=     f@+

*** Test Cases ***
# Login
Login With InCorrect Email
    Login Account  ${inCorrect}  ${password}
    Wait For Page
    Location Should Contain  login

Login With InCorrect Password
    Login Account  ${email}  ${inCorrect}
    Wait For Page
    Location Should Contain  login

Login With Correct Information
    Login Account  ${email}  ${password}
    Wait For Page
    Location Should be  ${BASE_URL}

# Logout
Logout
    Logout Account  ${email}  ${password}
    Go To Profile Page
    Location Should Contain    login



