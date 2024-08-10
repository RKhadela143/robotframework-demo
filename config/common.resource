*** Settings ***
Library     SeleniumLibrary
Resource    config.resource


*** Keywords ***
Get Child Webelement
    [Documentation]    To get child webelement
    [Arguments]    ${element}    ${locator}

    ${element}    Get WebElement    ${element}
    ${children}    Call Method
    ...    ${element}
    ...    find_element
    ...    by=xpath    value=${locator}

    RETURN    ${children}

Get All Text Values
    [Documentation]    Get all elements text in list
    [Arguments]    @{elements}
    ${count}   Get Length    ${elements}
    IF    ${count} > 0
        VAR    @{list}
        FOR    ${elm}    IN   @{elements}
            ${text}    Get Text    ${elm}
            Append To List    ${list}    ${text}
        END
    ELSE
        Log To Console    message=No items in list
    END
    RETURN    ${list}
