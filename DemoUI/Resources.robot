*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     12345678
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${browser_name}         Chrome

*** Keywords ***
Open the browser with the Mortgage payment url
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Create Webdriver    Chrome    options=${options}
    Go To   ${url}
    Maximize Browser Window

open the browser with the url
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --incognito
    Create Webdriver    ${browser_name}     options=${options}
    Go To   ${url}
    Maximize Browser Window

Close Browser Session
    Close Browser

Wait Until element passed is located on Page
    [arguments]     ${page_locator}
    Wait Until Element Is Visible   ${page_locator}     timeout=10