*** Settings ***
Documentation  This page is going to handle the actions needed for the test on google.com

Library  String
Library  SeleniumLibrary
Variables    ../../Variables/GoogleLocators.yaml
Variables    ../../Data/GoogleData.yaml
    
*** Keywords ***
Use Google
    Wait Until Element Is Visible  ${GoogleLocators.SearchBox}
    Input Text  ${GoogleLocators.SearchBox}  ${GoogleData.SearchBox}
    Wait Until Element Is Visible  ${GoogleLocators.SearchButton}
    Click Button  ${GoogleLocators.SearchButton}
    Click Element If Enabled  ${GoogleLocators.SearchResult}