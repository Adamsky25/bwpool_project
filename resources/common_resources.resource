*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    json

*** Variables ***

#URLs
${HOMEPAGE_URL}    https://bwpool.azurewebsites.net/
${API_URL_1}    https://random-data-api.com/api/users/random_user?size=1
${API_URL_2}    https://random-data-api.com/api/device/random_device?size=2

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
${LOCATIONS_CUSTOMER_DROPDOWN}    //span[@class='e-input-group-icon e-ddl-icon e-icons e-ddl-disable-icon']
${LOCATIONS_FIRST_NAME_ON_THE_LIST}    //li[@class='e-list-item e-item-focus']
${LOCATIONS_ADD_CITY}    //input[@id='varos']
${LOCATIONS_ADD_ZIP}    //input[@id='zip']
${LOCATIONS_ADD_STREET}    //input[@id='utca']
${LOCATIONS_ADD_STREET_NUMBER}    //input[@id='szam']
${LOCATIONS_ADD_SAVE}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']
${TOOLS_BUTTON}    //a[contains(.,'Eszközök')]
${TOOLS_ADD_BUTTON}    //span[@class='e-add e-icons e-btn-icon e-icon-left']
${TOOLS_'NEVE'_INPUT}    //input[@id='name']
${TOOLS_'LEIRAS'_INPUT}    //textarea[@id='Desc']
${TOOLS_'MEGJEGYZES'_INPUT}    //textarea[@id='Comm']
${TOOLS_USER_NAME_DROP_DOWN}      //span[@class='e-ddl e-lib e-input-group e-control-container e-control-wrapper e-input-focus valid e-icon-anim']/span[@class='e-input-group-icon e-ddl-icon e-icons e-ddl-disable-icon']
${TOOLS_USER_NAME_INPUT}    //span[@class='e-ddl e-lib e-input-group e-control-container e-control-wrapper e-input-focus valid']/input[@class='e-control e-combobox e-lib e-input']
${TOOLS_SAVE_BUTTON}    //button[@class='e-control e-btn e-lib e-control e-btn e-lib e-primary e-flat']
${TOOLS_EXCEL_EXPORT_MENU}    //span[.='Excel Export']
${LOCATIONS_SEARCH_INPUT}    //input[@id='Grid_ToolbarSearchBox']
${LOCATION_SEARCH_BUTTON}    //span[@class='e-searchclear e-search-icon e-icons e-input-group-icon']
${LOCATION_NAVIGATION_BUTTON}    //a[@href='LocationInfo/674']/span[@class='oi oi-location']


# Other Variables
${BROWSER}    Chrome
${FOLDER_PATH}    C:/Users/novoz/bwpool_project/tests
${SUPERUSER}    

*** Variables ***
# ${partner_city}    None
# ${partner_zip_code}    None
# ${partner_street}    None
# ${partner_street_number}    None
# ${id}    None
# ${customer_json_file}    customer.json

*** Keywords ***

Place Data Into "Ügyfél" Grid
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${phone_number}    ${id}
    Input Text    ${PARTNERS_ADD_NAME}    ${first_name} ${last_name}
    Input Text    ${PARTNERS_ADD_EMAIL}    ${email}
    Input Text    ${PARTNERS_ADD_TELEFON}    ${phone_number}
    Input Text    ${PARTNERS_ADD_COMMENT}    ${id}

# Create Location Data
#     [Arguments]    ${city}    ${zip_code}    ${street_name}    ${street_number}
#     ${location_data}=    Create Dictionary    city=${city}    zip_code=${zip_code}    street_name=${street_name}    street_number=${street_number}
#     [Return]    ${location_data}    # robotcode: ignore


# Place Data Into "Telephely" Grid
#     [Arguments]    ${city}    ${zip_code}    ${street_name}    ${street_number}
#     Input Text    ${LOCATIONS_ADD_CITY}    ${partner_city}
#     Input Text    ${LOCATIONS_ADD_ZIP}    ${partner_zip_code}
#     Input Text    ${LOCATIONS_ADD_STREET}    ${street_name}
#     Input Text    ${LOCATIONS_ADD_STREET_NUMBER}    ${partner_street_number}

# Place Data Into "Eszközök" Grid 

#      [Arguments]   ${manufacturer}    ${model}    ${platform}    ${serial_number}    ${first_name}    ${last_name}
#      Input Text    ${TOOLS_USER_NAME_INPUT}    ${first_name} ${last_name}
#      Input Text    ${PARTNERS_ADD_NAME}    ${last_name}
#      Input Text    ${PARTNERS_ADD_EMAIL}    ${email}
#      Input Text    ${PARTNERS_ADD_TELEFON}    ${phone_number}
#      Input Text    ${PARTNERS_ADD_COMMENT}    ${id}


# Test Setup
#     Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
#     Maximize Browser Window

# Test Teardown
#     Close All Browsers
