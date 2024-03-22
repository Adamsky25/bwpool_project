*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***

#URLs
${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/

#Locators
${PARTNERS_BUTTON}    //a[contains(.,'Partnerek')]
${LOCATIONS_BUTTON}    //a[contains(.,'Telephelyek')]
${TOOLS_BUTTON}    //a[contains(.,'Eszközök')]
${TOOLS_EXCEL_EXPORT_BUTTON}    //span[.='Excel Export']

# Other Variables
${BROWSER}    Chrome

*** Keywords ***
