*** Settings ***
Documentation       Product page tests

Resource            ../pages/products.resource

Suite Setup         Open Browser To Login Page
Suite Teardown      Teardown


*** Test Cases ***
Verify Product Title Present
    [Documentation]    Verify that correct title should be present on the page
    [Template]    Check Correct Product Title Present
    ${USERNAME}    ${PASSWORD}
    ${PROBLEM_USERNAME}    ${PASSWORD}
    ${PERFORMANCE_GLITCH_USERNAME}    ${PASSWORD}

Verify Product Sort Dropdown Present
    [Documentation]    Verify that product sort option visible
    [Template]    Check Product Sort Option Visible
    ${USERNAME}    ${PASSWORD}
    ${PROBLEM_USERNAME}    ${PASSWORD}
    ${PERFORMANCE_GLITCH_USERNAME}    ${PASSWORD}

Verify Product List Page Loads Correctly
    [Documentation]    Check for header, footer, secondary header, inventory cards presence
    Header Element Presence Check
    Secondary Header Element Presence Check
    Check Inventory Cards Details
    Footer Element Presence Check

Verify Product Sorting By Name
    [Documentation]    Check product sorting by name a-z, z-a
    @{name_elms}    Get WebElements    ${INVENTORY_NAME}
    List Selection Should Be    ${PRODUCT_SORT}    az
    @{a_to_z_names}    Get All Text Values    @{name_elms}
    Select From List By Value    ${PRODUCT_SORT}    za
    @{name_elms}    Get WebElements    ${INVENTORY_NAME}
    @{z_to_a_names}    Get All Text Values    @{name_elms}
    Reverse List    ${z_to_a_names}
    Lists Should Be Equal    ${a_to_z_names}    ${z_to_a_names}

Verify Products Detail Page By Clicking On Product
    [Documentation]    Verify that product details are accessible by clicking on a product.
    Navigate To Each Products Details

Verify Add To Cart Button
    [Documentation]    Verify add to cart button
    Click Add To Cart Button    Sauce Labs Backpack
    Element Text Should Be    ${SHOPPING_CART_BADGE}    1
    Click Element    ${SHOPPING_CART_BADGE}
    Element Text Should Be    css=[data-test="title"]    Your Cart
    Element Text Should Be    css=[data-test="item-quantity"]    1
    Element Text Should Be    css=[data-test="inventory-item-name"]    Sauce Labs Backpack
