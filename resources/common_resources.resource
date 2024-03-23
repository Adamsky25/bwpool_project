*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***

#URLs
${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/
${API_URL_1}    https://random-data-api.com/api/users/random_user?size=1
${API_URL_2}    https://random-data-api.com/api/users/random_device?size=2
#HTTP 404 hiba

#Locators
${PARTNERS_BUTTON}    //a[contains(.,'Partnerek')]
${LOCATIONS_BUTTON}    //a[contains(.,'Telephelyek')]
${TOOLS_BUTTON}    //a[contains(.,'Eszközök')]
${TOOLS_EXCEL_EXPORT_BUTTON}    //span[.='Excel Export']
${PARTNERS_ADD_BUTTON}    //span[.='Add']
${PARTNERS_GRID}    //h4[.='Ügyfél']
${PARTNERS_ADD_NAME}    //input[@id='name']
${PARTNERS_ADD_EMAIL}    //input[@id='email']
${PARTNERS_ADD_TELEFON}    //input[@class='e-control e-numerictextbox e-lib e-input']
${PARTNERS_ADD_COMMENT}    //input[@id='comment']
${PARTNERS_ADD_SAVE}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']
${LOCATIONS_ADD_BUTTON}    //span[.='Add']
${LOCATIONS_ADD_CUSTOMER}    //input[@class='e-control e-combobox e-lib e-input']
${LOCATIONS_ADD_CITY}    //input[@id='varos']
${LOCATIONS_ADD_ZIP}    //input[@id='zip']
${LOCATIONS_ADD_STREET}    //input[@id='utca']
${LOCATIONS_ADD_HOUSENUMBER}    //input[@id='szam']
${LOCATIONS_ADD_SAVE}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']
${TOOLS_BUTTON}    //a[contains(.,'Eszközök')]
${TOOLS_SAVE_BUTTON}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']
${TOOLS_EXCEL_EXPORT_MENU}    //span[.='Excel Export']
${LOCATIONS_SEARCH_BUTTON}    //input[@id='Grid_ToolbarSearchBox']



# Other Variables
${BROWSER}    Chrome

*** Variables ***
${partner_city}    None
${partner_zip_code}    None
${partner_street}    None
${partner_street_number}    None
${id}    None

*** Keywords ***

Place Data Into "Ügyfél" Grid
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${phone_number}    ${id}
    Input Text    ${PARTNERS_ADD_NAME}    ${first_name}
    Input Text    ${PARTNERS_ADD_NAME}    ${last_name}
    Input Text    ${PARTNERS_ADD_EMAIL}    ${email}
    Input Text    ${PARTNERS_ADD_TELEFON}    ${phone_number}
    Input Text    ${PARTNERS_ADD_COMMENT}    ${id}

Save The Partner Menu
    Click Element    ${PARTNERS_ADD_SAVE}  

Create Location Data
    [Arguments]    ${city}    ${zip_code}    ${street_name}    ${street_number}
    ${location_data}=    Create Dictionary    city=${city}    zip_code=${zip_code}    street_name=${street_name}    street_number=${street_number}
    [Return]    ${location_data}    # robotcode: ignore

Attach Location To Partner
    [Arguments]    ${partner_id}    ${location_data}
    ${response}=    Get    ${API_URL_1}    data=${location_data}
    Log    ${response.status_code}
    # Add additional validation if necessary

Place Data Into "Telephely" Grid
    [Arguments]    ${city}    ${zip_code}    ${street_name}    ${street_number}
    Input Text    ${LOCATIONS_ADD_CITY}    ${partner_city}
    Input Text    ${LOCATIONS_ADD_ZIP}    ${partner_zip_code}
    Input Text    ${LOCATIONS_ADD_STREET}    ${street_name}
    Input Text    ${LOCATIONS_ADD_HOUSENUMBER}    ${partner_street_number}

Save The Locations Menu
    Click Element    ${LOCATIONS_ADD_SAVE}

Save The Tools Menu
    Click Element    ${TOOLS_SAVE_BUTTON}
    

# Test Setup
#     Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
#     Maximize Browser Window

# Test Teardown
#     Close All Browsers
