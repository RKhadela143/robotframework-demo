*** Settings ***
Documentation       Product page tests

Resource            ../pages/products.resource

Suite Setup         Open Browser To Login Page
Suite Teardown      Teardown
Test Setup          Navigate To Products Page


*** Test Cases ***
Verify Product List Page Loads Correctly
    [Documentation]    Check for header, footer, secondary header, inventory cards presence
    Header Element Presence Check
    Secondary Header Element Presence Check
    Check Inventory Cards Details
    Footer Element Presence Check

Verify Product Sorting By Name
    [Documentation]    Check product sorting by name a-z, z-a
    @{name_elms}   Get WebElements    ${INVENTORY_NAME}
    List Selection Should Be    ${PRODUCT_SORT}    az
    @{a_to_z_names}    Get All Text Values    @{name_elms}
    Select From List By Value    ${PRODUCT_SORT}    za
    @{name_elms}   Get WebElements    ${INVENTORY_NAME}
    @{z_to_a_names}    Get All Text Values    @{name_elms}
    Reverse List    ${z_to_a_names}
    Lists Should Be Equal    ${a_to_z_names}    ${z_to_a_names}

