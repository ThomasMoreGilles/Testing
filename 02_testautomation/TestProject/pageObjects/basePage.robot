*** Settings ***
Resource  ../helpers/browser.robot
Resource  goToPage.robot
Resource  loginPage.robot
Resource  registerPage.robot
Resource  logoutPage.robot

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}