from typing import List, Optional, Tuple, Union
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.remote.webelement import WebElement
from SeleniumLibrary.base import LibraryComponent, keyword

# def get_child_webelement(element, child_locator: Union[WebElement, str]):
#     driver = BuiltIn().get_library_instance('SeleniumLibrary')
#     element = driver.find_element(element)
#     child_element = element.find_element(child_locator)
#     return child_element

from selenium.webdriver.remote.webelement import WebElement
from selenium.webdriver.common.by import By

def get_child_element(parent_element: WebElement, locator: str) -> WebElement:
    """
    Function to get a child web element from a parent element.

    :param parent_element: The parent WebElement to search within.
    :param locator: The locator used to find the child element (e.g., XPath or CSS Selector).
    :param by: The method to use for locating the child element (e.g., 'xpath', 'css selector').
    :return: The found WebElement.
    """
    method, loc = locator.split('=')
    by_method = By.XPATH if method == 'xpath' else By.CSS_SELECTOR
    return parent_element.find_element(by_method, loc)
    
