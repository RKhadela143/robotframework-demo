*** Settings ***
Documentation       Product page

Resource            login.resource


*** Variables ***
${APP_LOGO}                     css=div.app_logo
${SHOPPING_CART}                css=a.shopping_cart_link
${HEADER_SECONDARY}             css=div.header_secondary_container
${TITLE}                        css=[data-test="title"]
${PRODUCT_SORT}                 css=[data-test="product-sort-container"]
${SELECTED_SORT}                class=active_option
${INVENTORY_CARDS}              css=div.inventory_item
${INVENTORY_IMAGE}              css=div.inventory_item_img
${INVENTORY_LABEL}              xpath=.//div[@class="inventory_item_label"]
${INVENTORY_NAME}               css=div.inventory_item_name
${INVENTORY_PRICE}              css=div.inventory_item_price
${INVENTORY_DESC}               css=div.inventory_item_desc
${ADD_TO_CART}                  xpath=//div[@class="inventory_item"]//button
${SHOPPING_CART_BADGE}          css=.shopping_cart_badge

${CHECKOUT_BTN}                 id=checkout
${HAMBURGER_MENU}               id=react-burger-menu-btn
${LOGOUT_SIDEBAR_LINK}          id=logout_sidebar_link
${RESET_SIDEBAR_LINK}           id=reset_sidebar_link
${CROSS_BTN}                    css=button[id="react-burger-cross-btn"]
# Product Details Page
${BACK_TO_PRODUCTS}             id=back-to-products
${INVENTORY_DETAILS_IMG}        css=img.inventory_details_img
${INVENTORY_DETAILS_NAME}       css=div.inventory_details_name
${INVENTORY_DETAILS_DES}        css=div.inventory_details_desc
${INVENTORY_DETAILS_PRICE}      css=div.inventory_details_price

${SOCIAL_TWITTER}               css=li.social_twitter a
${SOCIAL_FACEBOOK}              css=li.social_facebook a
${SOCIAL_LINKEDIN}              css=li.social_linkedin a

${FOOTER_COPY}                  css=div.footer_copy


*** Keywords ***
Navigate To Products Page
    [Documentation]    Navigate to product page
    Login    ${USERNAME}    ${PASSWORD}

Get Items Titles
    [Documentation]    Get all items titles list
    VAR    @{item_titles}    @{EMPTY}
    @{titles}    Get WebElements    ${INVENTORY_NAME}
    FOR    ${title}    IN    @{titles}
        ${text}    Get Text    ${title}
        Append To List    ${item_titles}    ${text}
    END
    RETURN    ${item_titles}

Get Item Title By Index
    [Documentation]    Get item title by index
    [Arguments]    ${index}
    ${title}    Get Text    xpath=(//div[@data-test="inventory-item-name"])[${index}]
    RETURN    ${title}

Get Items Prices
    [Documentation]    Get all items prices list
    VAR    @{item_prices}    @{EMPTY}
    @{prices}    Get WebElements    ${INVENTORY_PRICE}
    FOR    ${price}    IN    @{prices}
        ${text}    Get Text    ${price}
        ${text}    Remove String    ${text}    $
        Append To List    ${item_prices}    ${text}
    END
    RETURN    ${item_prices}

Get Items Price By Index
    [Documentation]    Get item price by index
    [Arguments]    ${index}
    ${price}    Get Text    xpath=(//div[@data-test="inventory-item-price"])[${index}]
    ${price}    Remove String    ${price}    $
    RETURN    ${price}

Add Item To Cart By Index
    [Documentation]    Add item to cart by index
    [Arguments]    ${index}
    Click Element    xpath=(//div[@class="inventory_item"]//button)[${index}]
    
Select Sort By Text
    [Documentation]    Select sort by text
    [Arguments]    ${text}
    Select From List By Label    ${text}

Get Sort Type Text
    [Documentation]    Get sort type text
    ${active_sort}    Get Text    ${SELECTED_SORT}
    RETURN    ${active_sort}

Reset App State
    [Documentation]    Reset app
    Click Element    ${HAMBURGER_MENU}
    Click Element    ${RESET_SIDEBAR_LINK}
    Wait Until Keyword Succeeds    5    2s    Click Element    ${CROSS_BTN}

Access Cart
    [Documentation]    access cart
    Click Element    ${SHOPPING_CART}

Go To Checkout
    [Documentation]    Go to checkout
    Click Element    ${CHECKOUT_BTN}

Check Correct Product Title Present
    [Documentation]    Check correct product title present on the product page
    [Arguments]    ${username}    ${password}
    [Setup]    Login    ${username}    ${password}
    Element Text Should Be    ${TITLE}    Products
    [Teardown]    Logout

Check Product Sort Option Visible
    [Documentation]    Check product sort option should be visible
    [Arguments]    ${username}    ${password}
    [Setup]    Login    ${username}    ${password}
    Element Should Be Visible    ${PRODUCT_SORT}
    [Teardown]    Logout

Header Element Presence Check
    [Documentation]    Check header elements presence
    Run Keyword And Continue On Failure    Element Should Be Visible    ${HAMBURGER_MENU}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${APP_LOGO}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${SHOPPING_CART}

Secondary Header Element Presence Check
    [Documentation]    Check secondary header elements presence
    Run Keyword And Continue On Failure    Element Should Be Visible    ${HEADER_SECONDARY}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${PRODUCT_SORT}

Check Inventory Cards Details
    [Documentation]    Check inventory cards elements
    Run Keyword And Continue On Failure    Element Should Be Visible    ${INVENTORY_CARDS}
    ${cards_count}    Get Element Count    ${INVENTORY_CARDS}
    FOR    ${i}    IN RANGE    1    ${cards_count+1}
        Element Should Be Visible
        ...    xpath=//div[@data-test="inventory-item"][${i}] //img    message=${i}th inventory image is not visible
        Element Should Be Visible
        ...    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-name"]
        ...    message=${i}th inventory name is not visible
        Element Should Be Visible
        ...    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-desc"]
        ...    message=${i}th inventory description is not visible
        Element Should Be Visible
        ...    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-price"]
        ...    message=${i}th inventory price is not visible
        Element Should Be Visible
        ...    xpath=//div[@data-test="inventory-item"][${i}] //button
        ...    message=${i}th inventory add to cart button is not visible
    END

Footer Element Presence Check
    [Documentation]    Check footer elements presence
    Run Keyword And Continue On Failure    Element Should Be Visible    ${SOCIAL_TWITTER}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${SOCIAL_FACEBOOK}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${SOCIAL_LINKEDIN}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${FOOTER_COPY}
    ${current_year}    Get Current Year
    Element Text Should Be
    ...    ${FOOTER_COPY}
    ...    © ${current_year} Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy

Select Product By Name
    [Documentation]    Select product from page
    [Arguments]    ${name}
    @{name_elms}    Get WebElements    ${INVENTORY_NAME}
    FOR    ${element}    IN    ${name_elms}
        ${text}    Get Text    ${element}
        IF    "${text.lower()}" == "${name.lower()}"
            Click Element    ${element}
            BREAK
        END
    END

Navigate To Each Products Details
    [Documentation]    Navigate to each products details
    ${cards_count}    Get Element Count    ${INVENTORY_CARDS}
    FOR    ${i}    IN RANGE    1    ${cards_count+1}
        ${name}    Get Text    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-name"]
        ${description}    Get Text
        ...    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-desc"]
        ${price}    Get Text    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-price"]
        Click Element    xpath=//div[@data-test="inventory-item"][${i}] //div[@data-test="inventory-item-name"]
        Element Should Be Visible    ${BACK_TO_PRODUCTS}
        Element Should Be Visible    ${INVENTORY_DETAILS_IMG}
        Element Text Should Be    ${INVENTORY_DETAILS_NAME}    ${name}
        Element Text Should Be    ${INVENTORY_DETAILS_PRICE}    ${price}
        Element Text Should Be    ${INVENTORY_DETAILS_DES}    ${description}
        Element Should Be Visible    ${ADD_TO_CART}
        Click Element    ${BACK_TO_PRODUCTS}
    END

Click Add To Cart Button
    [Documentation]    Click Add to cart button of the respective product
    [Arguments]    ${name}
    @{cards_elms}    Get WebElements    ${INVENTORY_CARDS}
    FOR    ${elm}    IN    @{cards_elms}
        ${text_el}    Get Child Element    ${elm}    ${INVENTORY_NAME}
        ${text}    Get Text    ${text_el}
        IF    "${name.lower()}" == "${text.lower()}"
            ${child}    Get Child Element    ${elm}    ${ADD_TO_CART}

            Click Element    ${child}
            BREAK
        END
    END
