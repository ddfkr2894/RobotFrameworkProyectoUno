*** Settings ***
Documentation  This is for some information about the test
Library  SeleniumLibrary
Resource  ../Resources/BrowserMoves.robot
Resource  ../Resources/SeleniumExtensions.resource
Resource  ../Resources/PageObjects/GoogleMainPage.robot

*** Test Cases ***
User Can Look For Information At The Browser
    [Documentation]  Some basic information about this test case
    [Tags]  CRUD
    Opening Google Chrome Browser
    Use Google
    Closing Google Chrome Browser