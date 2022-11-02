*** Settings ***
Resource  ../helpers/browser.robot
Resource  02_accountPage.robot
Resource  03_transactionsPage.robot

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}
    Wait For Page

Wait For Page
     Wait For Condition	return document.readyState == "complete"
     Sleep  1.5s

Wait For Page With Element
    [Arguments]  ${element}
    Wait Until Page Contains Element  ${element}
    Wait For Page

Click And Input
    [Arguments]  ${location}  ${input}
    Click Element  ${location}
    Input Text  ${location}  ${input}