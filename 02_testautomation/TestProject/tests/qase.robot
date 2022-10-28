*** Settings ***
Resource            ../pageObjects/Page.robot

Suite Setup  Open My Website
Suite Teardown  Close browser
Library    String

*** Test Cases ***

# Register
Register With InCorrect Email
    Go To Register Page
    Create Account  firstname  lastname  F  Password123

Register With InCorrect Password
    Go To Register Page
    Create Account  firstname  lastname  name@gmail.com  F

Register With Correct Information
    Go To Register Page
    Create Account  firstname  lastname  name@gmail.com  Password123

# Login
Login With InCorrect Email
    Go To Signin Page
    Login Account  F  Password123

Login With InCorrect Password
    Go To Signin Page
    Login Account  name@gmail.com  F

Login With Correct Information
    Go To Signin Page
    Login Account  name@gmail.com  Password123

# Logout
Logout
    Go To Signin Page
    Login Account  name@gmail.com  Password123
    # ...


# Add credits
Add Credits With Negative Amount


Add Credits With Normal Amount


Add Credits With Large Amount
