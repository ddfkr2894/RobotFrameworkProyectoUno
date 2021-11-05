*** Settings ***
Documentation  This page is just to handle the browser behaviors.

***Variables***

${URL}  https://www.google.com
${BROWSER}  googlechrome


*** Keywords ***
Closing Google Chrome Browser
    [Documentation]  This kw is just to close the browser that we are going to use
    Close Browser

Opening Google Chrome Browser
    [Documentation]  Opens the specified browser and navigates to the specified URL
    ${desired_caps} =  Configure Chrome Webdriver Capabilities
    Open Browser  ${URL}  ${BROWSER}
    ...  desired_capabilities=${desired_caps}

Configure Chrome Webdriver Capabilities
    [Documentation]  Sets chrome webdriver options and capabilities.
    ${prefs} =  Create Dictionary
    ...    safebrowsing.enabled=${TRUE}
    ...    credentials_enable_service=${FALSE}
    ...    profile.password_manager_enabled=${FALSE}
    @{args_list} =  Create List  --start-maximized  --disable-web-security  --disable-gpu  --disable-plugins  --no-sandbox  --incognito
    Log To Console  ${args_list}
    ${exclude_switches}  Create List  enable-automation
    ${chrome_options} =  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${chrome_options}  add_experimental_option  prefs  ${prefs}
    FOR  ${arg}  IN  @{args_list}
        Call Method  ${chrome_options}  add_argument  ${arg}
    END
    Call Method  ${chrome_options}  add_experimental_option  excludeSwitches  ${exclude_switches}
    ${capabilities} =  Call Method  ${chrome_options}  to_capabilities
    [Return]  ${capabilities}