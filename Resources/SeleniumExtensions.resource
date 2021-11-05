*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Wait Until Button Is Enabled And Click
    [Arguments]  ${button}
    Wait Until Element Is Enabled  ${button}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${element}

Wait Until Element Is Enabled and Click
    [Arguments]  ${element}
    Wait Until Element Is Enabled  ${element}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${element}

Wait Until Checkbox Is Visible and Select
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    Wait Until Keyword Succeeds  10s  1s  Select Checkbox  ${element}
    
Wait Until Checkbox Is Visible and Unselect
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    Wait Until Keyword Succeeds  10s  1s  Unselect Checkbox  ${element}

Wait Until Element Is Visible And Input Text
    [Documentation]  Waits until the element identified by ${locator} is visible and enters ${text_to_input}
    [Arguments]  ${locator}  ${text_to_input}
    Wait Until Element Is Visible  ${locator}
    Input Text  ${locator}  ${text_to_input}

Wait Until Element Is Enabled And Input Text
    [Documentation]  Waits until the element identified by ${locator} is visible and enters ${text_to_input}
    [Arguments]  ${locator}  ${text_to_input}
    Wait Until Element Is Enabled  ${locator}
    Input Text  ${locator}  ${text_to_input}

Wait Until Button Is Visible And Click
    [Arguments]  ${button}
    Wait Until Element Is Visible  ${button}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${element}

Wait Until Element Is Visible and Click
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}
    Wait Until Keyword Succeeds  10s  1s  Click Element  ${element}    

Click Element If Visible
    [Arguments]  ${locator}
    [Documentation]  Checks to see whether a given element is visible and clicks the element if it is visible
    ...  Note that this keyword does not wait.  If waiting is required, use Wait Until Element Is Visible and Click
    ${element} =  Get WebElement  ${locator}
    ${displayed} =  Set Variable  ${element.is_displayed()}
    Log  Element displayed: ${displayed}  DEBUG
    Run Keyword If  ${displayed}  Click Element  ${element}

Click Element If Enabled
    [Arguments]  ${locator}
    [Documentation]  Checks to see whether a given element is visible and clicks the element if it is visible
    ...  Note that this keyword does not wait.  If waiting is required, use Wait Until Element Is Enabled and Click
    ${element} =  Get WebElement  ${locator}
    ${enabled} =  Set Variable  ${element.is_enabled()}
    Log  Element enabled: ${enabled}  DEBUG
    Run Keyword If  ${enabled}  Click Element  ${element}

Get Visible WebElements
    [Arguments]  ${locator}
    [Documentation]  Gets elements identified by ${locator} and returns only those elements that are visible on the page
    ...  Note that visible is based on the value of the underlying WebElement.is_displayed property
    ${visible_elements} =  Create List
    ${elements} =  Get WebElements  ${locator}
    FOR  ${element}  IN  @{elements}
        ${displayed} =  Set Variable  ${element.is_displayed()}
        Continue For Loop If  ${displayed} == ${FALSE}
        Append To List  ${visible_elements}  ${element}
    END
    [Return]  ${visible_elements}

Set Checkbox State
    [Arguments]  ${locator}  ${value}
    [Documentation]  Selects or Unselects the checkbox identified by ${locator} based on ${value}.  If no value is provided
    ...  this keyword does nothing.
    Return From Keyword If  ${value}==${None}
    Run Keyword If  ${value}==${TRUE}  Wait Until Checkbox Is Visible and Select  ${locator}
    ...    ELSE    Wait Until Checkbox Is Visible and Unselect  ${locator}