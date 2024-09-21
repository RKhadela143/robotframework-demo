*** Settings ***
Documentation       Product page

Resource            login.resource


*** Variables ***
${FIRST_NAME_IP}        id=first-name
${LAST_NAME_IP}         id=last-name
${POSTAL_CODE_IP}       id=postal-code
${CONTINUE_BTN}         id=continue
${SUBTOTAL}             class=summary_subtotal_label
${FINISH_BTN}           id=finish
${CHECKOUT_TITLE}       class=title
${CHECKOUT_MESSAGE}     class=complete-header


*** Keywords ***
Set Firstname
    [Documentation]    Set first name
    [Arguments]    ${name}
    Input Text    ${FIRST_NAME_IP}    ${name}

Set Lastname
    [Documentation]    Set last name
    [Arguments]    ${name}
    Input Text    ${LAST_NAME_IP}    ${name}

Set Postal Code
    [Documentation]    Set postal code
    [Arguments]    ${code}
    Input Text    ${POSTAL_CODE_IP}    ${code}

Continue To Checkout Overview
    [Documentation]    Navigate to checkout overview page
    Click Element    ${CONTINUE_BTN}

Fullfill Checkout Information
    [Documentation]    Enter checkout information required
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    Set Firstname    ${firstname}
    Set Lastname    ${lastname}
    Set Postal Code    ${postalcode}
    Continue To Checkout Overview

Get Item Total
    [Documentation]    Get item total
    ${item_total}    Get Text    ${SUBTOTAL}
    ${item_total}    Get Regexp Matches    ${item_total}    \\d+\\.\\d+
    ${item_total}    Evaluate    float(${item_total}[0])
    RETURN    ${item_total}

Finish Overview
    [Documentation]    Finish overview
    Click Element    ${FINISH_BTN}

Get Checkout Status Message
    [Documentation]    Get checkout message
    ${title}    Get Text    ${CHECKOUT_TITLE}
    RETURN    ${title}

Get Checkout Complete Message
    [Documentation]    Get checkout complete message
    ${message}    Get Text    ${CHECKOUT_MESSAGE}
    RETURN    ${message}
