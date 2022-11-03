*** Settings ***
Resource  ../helpers/browser.robot
Resource  01_registerPage.robot
Resource  02_loginPage.robot
Resource  03_transactionsPage.robot

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}
    Wait For Page

Wait For Page
     Wait For Condition	return document.readyState == "complete"
     Sleep  5s

Wait For Page With Element
    [Arguments]  ${element}
    Wait Until Page Contains Element  ${element}
    Wait For Page

Click And Input
    [Arguments]  ${location}  ${input}
    Click Element  ${location}
    Input Text  ${location}  ${input}

Wait And Click
    [Arguments]  ${element}
    Sleep  5s
    Click Element  ${element}
