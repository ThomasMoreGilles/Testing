*** Settings ***
Resource            ../pageObjects/basePage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser
*** Variables ***
# Input
${R_F_NAME}=              firstname
${R_L_NAME}=              lastname
${R_EMAIL}=               name@gmail.com
${R_PASSW}=               Password123
${R_INCORRECT}=           f@+

*** Test Cases ***
# Register
Register With InCorrect Email
    Create Account  ${R_F_NAME}  ${R_L_NAME}  ${R_INCORRECT}  ${R_PASSW}
    Location Should Contain  register

Register With InCorrect Password
    Create Account  ${R_F_NAME}  ${R_L_NAME}  ${R_EMAIL}  ${R_INCORRECT}
    Location Should Contain  register

Register With Correct Information
    Create Account  ${R_F_NAME}  ${R_L_NAME}  ${R_EMAIL}  ${R_PASSW}
    Location Should be  ${BASE_URL}



# Login
Login With InCorrect Email
    Login Account  ${R_INCORRECT}  ${R_PASSW}
    Sleep  1s
    Location Should Contain  login

Login With InCorrect Password
    Login Account  ${R_EMAIL}  ${R_INCORRECT}
    Sleep  1s
    Location Should Contain  login

Login With Correct Information
    Login Account  ${R_EMAIL}  ${R_PASSW}
    Sleep  1s
    Location Should be  ${BASE_URL}

# Logout
Logout
    Login Account  ${R_EMAIL}  ${R_PASSW}
    Logout Account
    Sleep  5s

# Add credits
Add Credits With Negative Amount


Add Credits With Normal Amount


Add Credits With Large Amount
