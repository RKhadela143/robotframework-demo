*** Settings ***
Resource    ../config/config.robot
Resource    login.resource
Library    XML

*** Variables ***
${app_logo}    css=div.app_logo
${shopping_cart}    css=a.shopping_cart_link
${header_secondary}    css=div.header_secondary_container
${product_sort}    css=[data-test="product_sort_container"]
${inventory_cards}    css=div.inventory_item
${inventory_image}    css=div.inventory_item_img
${inventory_label}    css=div.inventory_item_label
${inventory_name}    css=div.inventory_item_name 
${inventory_description}    css=div.inventory_item_desc
${inventory_price}    css=div.inventory_item_price
${add_to_cart}    css=button.btn_inventory

${social_twitter}    css=li.social_twitter a
${social_facebook}    css=li.social_facebook a
${social_linkedin}    css=li.social_linkedin a

${footer_copy}    css=div.footer_copy


*** Keywords ***
Navigate to Products Page
    Login    ${USERNAME}    ${PASSWORD}

Header Element Presence Check
    Run Keyword And Continue On Failure    Element Should Be Visible    ${hamburger_menu}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${app_logo}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${shopping_cart}

Secondary Header Element Presence Check
    Run Keyword And Continue On Failure    Element Should Be Visible    ${header_secondary}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${product_sort}

Check Inventory Cards Details
    Run Keyword And Continue On Failure    Element Should Be Visible    ${inventory_cards}
    ${cards_elms}    Get Webelements    ${inventory_cards}
    FOR    ${element}    IN    @{cards_elms}
        ${label_elm}    Get Child Webelement    ${element}    ${inventory_label}
        ${label_text}    Get Text    ${label_elm}
    END

Footer Element Presence Check
    Run Keyword And Continue On Failure    Element Should Be Visible    ${social_twitter}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${social_facebook}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${social_linkedin}
    Run Keyword And Continue On Failure    Element Should Be Visible    ${footer_copy}
    Element Text Should Be    ${footer_copy}    © 2023 Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy

