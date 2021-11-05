*** Settings ***
Documentation  This page is going to handle the actions needed for the test on youtube.com

Library  String
Library  SeleniumLibrary
Variables  ../../Variables/YoutubeLocators.yaml
Variables  ../../Variables/Data/YoutubeData.yaml

*** Keywords ***
Use Youtube
    
    