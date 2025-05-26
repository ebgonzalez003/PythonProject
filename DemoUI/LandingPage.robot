*** Settings ***
Documentation    All the page objects and keywords of landing page
Library         SeleniumLibrary
Resource        resource.robot

*** Variables ***

${Error_Message_Login}  css:.alert-danger

*** Keywords ***

Fill the login form
    [arguments]    ${username}      ${password}
    Input Text      id:username     ${username}
    Input Password  id:password     ${password}
    Click Button    id:signInBtn

wait until Element is located in the Page
    Wait Until element passed is located on Page    ${Error_Message_Login}

Verify the error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_Message_Login}  Incorrect username/password.

Fill the Login Details and Loging Form
    Input Text      id:username     rahulshettyacademy
    Input Password  id:password     learning
    Click Element   css:input[value='user']
    Wait Until Element Is Visible   css:.modal-body
    Click Button   id:okayBtn
    Click Button   id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value     css:select.form-control     teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms