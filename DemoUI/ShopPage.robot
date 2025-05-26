*** Settings ***
Documentation    All the page objects and keywords of landing page
Library         SeleniumLibrary

*** Variables ***
${Shop_page_load}   css:.nav-link

*** Keywords ***

wait until Element is located in the Page
    Wait Until element passed is located on Page   ${Shop_page_load}

Verify titles in the Shop page
    @{expectedList} =   Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements     css:.card-title
    @{actualList} =   Create List

    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log    ${text}
        Append To List  ${actualList}   ${text}
        #Append To List    ${actualList}     ${element.text}

    END
    Lists Should Be Equal       ${expectedList}     ${actualList}

Select the Card
    [Arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${index}=    Set Variable    0
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Exit For Loop If    '${cardName}' == '${text}'
        ${index}=    Evaluate    ${index} + 1

    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button