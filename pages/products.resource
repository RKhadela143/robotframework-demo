*** Settings ***
Documentation       Product page

Resource            login.resource


*** Variables ***
${APP_LOGO}             css=div.app_logo
${SHOPPING_CART}        css=a.shopping_cart_link
${HEADER_SECONDARY}     css=div.header_secondary_container
${PRODUCT_SORT}         css=[data-test="product-sort-container"]
${INVENTORY_CARDS}      css=div.inventory_item
${INVENTORY_IMAGE}      css=div.inventory_item_img
${INVENTORY_LABEL}      xpath=.//div[@class="inventory_item_label"]
${INVENTORY_NAME}       css=div.inventory_item_name
${INVENTORY_DESC}       css=div.inventory_item_desc
${INVENTORY_PRICE}      css=div.inventory_item_price
${ADD_TO_CART}          css=button.btn_inventory

${SOCIAL_TWITTER}       css=li.social_twitter a
${SOCIAL_FACEBOOK}      css=li.social_facebook a
${SOCIAL_LINKEDIN}      css=li.social_linkedin a

${FOOTER_COPY}          css=div.footer_copy


*** Keywords ***
Navigate To Products Page
    [Documentation]    Navigate to product page
    Login    ${USERNAME}    ${PASSWORD}

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
    FOR    ${i}    IN RANGE    1   ${cards_count+1}
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
    Element Text Should Be
    ...    ${FOOTER_COPY}
    ...    © 2024 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy
