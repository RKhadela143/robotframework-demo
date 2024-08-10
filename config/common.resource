*** Settings ***
Library     SeleniumLibrary
Resource    config.robot


*** Keywords ***
Get Child Webelement
    [Arguments]    ${element}    ${locator}

    ${element}    Get WebElement    ${element}
    ${children}    Call Method
    ...    ${element}
    ...    find_element
    ...    by=xpath    value=${locator}

    RETURN    ${children}
