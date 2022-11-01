*** Settings ***
Resource  ../pageObjects/signInPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Test Cases ***

Login With Wrong Password
    Log In With Account  tomsmith  incorrectPassword
    ${errorMessage}=  Get Flash Message
    Should Contain  ${errorMessage}  Your password is invalid!

Login With Wrong Username
    Log In With Account  tom  incorrectPassword
    ${errorMessage}=  Get Flash Message
    Should Contain  ${errorMessage}  Your username is invalid!

Login With Existing Account
    Log In With Account  tomsmith  SuperSecretPassword!
    ${succesMessage}=  Get Flash Message
    Should Contain  ${succesMessage}  You logged into a secure area!
    Logout

Logout From Account
    Log In With Account  tomsmith  SuperSecretPassword!
    Logout
    ${succesMessage}=  Get Flash Message
    Should Contain  ${succesMessage}  You logged out of the secure area!

