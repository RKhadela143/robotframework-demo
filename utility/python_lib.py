from typing import List, Optional, Tuple, Union
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.remote.webelement import WebElement
from SeleniumLibrary.base import LibraryComponent, keyword

def get_child_webelement(element, child_locator: Union[WebElement, str]):
    driver = BuiltIn().get_library_instance('SeleniumLibrary')
    # element = driver.find_element(locator)
    child_element = element.find_element(child_locator)
    return child_element
    
