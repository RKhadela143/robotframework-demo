*** Settings ***
Documentation       Checkout page tests

Resource            ../pages/checkout.resource
Resource            ../pages/products.resource

Suite Setup         Open Browser To Login Page
Suite Teardown      Teardown
Test Setup          Login    ${USERNAME}    ${PASSWORD}


*** Test Cases ***
Verify Checkout
    [Documentation]    Verify end to end checkout
    Reset App State
    ${product_qty_in_cart}    Evaluate    random.randint(1, 6)    modules=random
    VAR    @{products_in_cart}    @{EMPTY}
    VAR    @{products_index_list}    @{EMPTY}
    FOR    ${i}    IN RANGE    ${product_qty_in_cart}
        ${product_index}    Set Variable    ${-1}
        WHILE    (${product_index} == ${-1} or ${product_index} in ${products_index_list})
            ${product_index}    Evaluate    random.randint(1, 6)    modules=random
        END
        Append To List    ${products_index_list}    ${product_index}
        ${name}    Get Item Title By Index    ${product_index}
        ${price}    Get Items Price By Index    ${product_index}
        VAR    &{product_dict}    index=${product_index}    title=${name}    price=${price}
        Append To List    ${products_in_cart}    ${product_dict}

        Add Item To Cart By Index    ${product_index}
    END

    Access Cart
    VAR    ${total_value}    ${0}

    FOR    ${product}    IN    @{products_in_cart}
        @{titles}    Get Items Titles
        List Should Contain Value    ${titles}    ${product}[title]
        @{prices}    Get Items Prices
        List Should Contain Value    ${prices}    ${product}[price]
        ${total_value}    Evaluate    ${total_value}+${product}[price]
    END

    Go To Checkout
    Fullfill Checkout Information    Carlos    Montoya    123
    ${total}    Get Item Total
    Should Be Equal    ${total_value}    ${total}

    Finish Overview
    ${msg}    Get Checkout Status Message
    Should Be Equal    ${msg}    Checkout: Complete!
