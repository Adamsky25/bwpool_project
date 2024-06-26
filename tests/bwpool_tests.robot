*** Settings ***
Resource    ../resources/common_resources.resource

*** Test Cases ***

Bwpool.azurewebsites.net Automation Testing
#1. Step: Open Browser
    Test Setup

#2. Step: Navigate To The "Partnerek" Menu
    Wait Until Element Is Visible    ${PARTNERS_BUTTON}    timeout=3s
    Sleep    3s
    Click Element    ${PARTNERS_BUTTON}
    
#3. Step: API Call Test (based on API_URL_1)
    ${response}=    Get    ${API_URL_1}    params=size=1
    ${user_data}=    Set Variable   ${response.json()}

#4. Step: Attach A Partner Based On The API Message (first_name, last_name, email, id)
    Wait Until Element Is Visible    ${PARTNERS_ADD_BUTTON}    timeout=5s
    Sleep    5s
    Click Element    ${PARTNERS_ADD_BUTTON}
    Wait Until Element Is Visible    ${PARTNERS_ADD_NAME}
    Wait Until Element Is Enabled    ${PARTNERS_ADD_SAVE}

    ${first_name}=    Set Variable   ${user_data[0]['first_name']}
    ${last_name}=    Set Variable   ${user_data[0]['last_name']}
    Input Text    ${PARTNERS_ADD_NAME}    ${first_name} ${last_name}
    ${first_last_name_value}    Get Element Attribute    ${PARTNERS_ADD_NAME}    value
    Should Be Equal As Strings    ${first_last_name_value}    ${first_name} ${last_name}

    ${email}=    Set Variable   ${user_data[0]['email']}
    Click Element    ${PARTNERS_ADD_EMAIL}
    Input Text    ${PARTNERS_ADD_EMAIL}    ${email}
    ${email_value}    Get Element Attribute    ${PARTNERS_ADD_EMAIL}     value
    Should Be Equal As Strings    ${email_value}    ${email}

    ${id}=    Set Variable   ${user_data[0]['id']}
    Click Element    ${PARTNERS_ADD_COMMENT}
    Input Text    ${PARTNERS_ADD_COMMENT}    ${id}
    ${comment_value}    Get Element Attribute    ${PARTNERS_ADD_COMMENT}    value
    Should Be Equal As Strings    ${comment_value}    ${id}

#5. Step: Save The Menu
    Wait Until Element Is Visible    ${PARTNERS_ADD_SAVE}    timeout=3s
    Click Element    ${PARTNERS_ADD_SAVE}

#6. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=3s
    Sleep    3s
    Click Element    ${LOCATIONS_BUTTON}

#7. Step: Attach A Location Based On The API Message (city, zip_code, street_name, street:number) AND Check The Values
    Wait Until Element Is Enabled    ${LOCATIONS_ADD_BUTTON}
    Sleep    3s
    Click Element    ${LOCATIONS_ADD_BUTTON}
    Sleep    3s
    Wait Until Element Is Visible    ${LOCATIONS_ADD_CUSTOMER}    timeout=5s
    Click Element    ${LOCATIONS_CUSTOMER_DROPDOWN}
    Input Text    ${LOCATIONS_ADD_CUSTOMER}    ${first_name} ${last_name}
    Sleep    3s
    Click Element    ${LOCATIONS_CUSTOMER_DROPDOWN}

    ${partner_city}    Set Variable    ${user_data}[0][address][city]
    Click Element    ${LOCATIONS_ADD_CITY}
    Input Text    ${LOCATIONS_ADD_CITY}    ${partner_city}
    ${partner_city_value}    Get Element Attribute    ${LOCATIONS_ADD_CITY}    value
    Should Be Equal As Strings    ${partner_city_value}    ${partner_city}

    ${partner_zip_code}    Set Variable    ${user_data}[0][address][zip_code]
    Click Element    ${LOCATIONS_ADD_ZIP}
    Input Text    ${LOCATIONS_ADD_ZIP}    ${partner_zip_code}

    ${partner_street_name}    Set Variable    ${user_data}[0][address][street_name]
    Click Element    ${LOCATIONS_ADD_STREET}
    Input Text    ${LOCATIONS_ADD_STREET}    ${partner_street_name}
    ${partner_street_name_value}    Get Element Attribute    ${LOCATIONS_ADD_STREET}    value
    Should Be Equal As Strings    ${partner_street_name_value}    ${partner_street_name}

    ${partner_street_number}    Set Variable    ${user_data}[0][address][street_address]
    Click Element    ${LOCATIONS_ADD_STREET_NUMBER}    
    Input Text    ${LOCATIONS_ADD_STREET_NUMBER}    ${partner_street_number}
    #${partner_street_number_value}    Get Element Attribute    ${LOCATIONS_ADD_STREET_NUMBER}    value
    #Should Be Equal As Strings    ${partner_street_number_value}    ${partner_street_number}

#8. Step: Save the Menu
    Wait Until Element Is Visible    ${LOCATIONS_ADD_SAVE}    timeout=3s
    Click Element    ${LOCATIONS_ADD_SAVE}

#9. Step: Request 2 Tools Via API
    ${response}=    Get    ${API_URL_2}    params=size=2
    ${tools_data}=    Set Variable   ${response.json()}

#10. Step: Navigate To The "Eszközök" Menu
    Wait Until Element Is Visible    ${TOOLS_BUTTON}    timeout=3s
    Sleep    3s
    Click Element    ${TOOLS_BUTTON}

#11. Step: Attach The 2 Tools (manufacturer, model, platform, serial_number) AND Check The Values
    Wait Until Element Is Visible    ${TOOLS_ADD_BUTTON}
    Sleep    3s
    Click Element    ${TOOLS_ADD_BUTTON} 
    Sleep    3s

    ${tools_'neve'_manufacturer}    Set Variable    ${tools_data[0]['manufacturer']}
    ${tools_'neve'_model}    Set Variable    ${tools_data[0]['model']}
    Input Text    ${TOOLS_'NEVE'_INPUT}    ${tools_'neve'_manufacturer} ${tools_'neve'_model}
    ${tools_'neve'_value}    Get Element Attribute    ${TOOLS_'NEVE'_INPUT}    value
    Should Be Equal As Strings    ${tools_'neve'_value}    ${tools_'neve'_manufacturer} ${tools_'neve'_model}

    Sleep    3s
    Input Text    ${TOOLS_USER_NAME_DROPDOWN}    ${first_name} ${last_name}
    Sleep    3s

    ${tools_'leiras'}    Set Variable    ${tools_data[0]['platform']}
    Input Text    ${TOOLS_'LEIRAS'_INPUT}    ${tools'leiras'}
    ${tools'leiras'_value}    Get Element Attribute    ${TOOLS_'LEIRAS'_INPUT}    value
    Should Be Equal As Strings    ${tools'leiras'_value}    ${tools_'leiras'}

    ${tools_'megjegyzes'}    Set Variable    ${tools_data[0]['serial_number']}
    Input Text    ${TOOLS_'MEGJEGYZES'_INPUT}    ${tools'megjegyzes'}    
    ${tools'megjegyzes'_value}    Get Element Attribute    ${TOOLS_'MEGJEGYZES'_INPUT}    value
    Should Be Equal As Strings    ${tools'megjegyzes'_value}    ${tools_'megjegyzes'}

#12. Step: Save The Menu
    #Wait Until Element Is Enabled    ${TOOLS_SAVE_BUTTON}    timeout=3s
    Sleep    5s
    Click Element    ${TOOLS_SAVE_BUTTON}

#13. Click On "Excel Export" Button
    Wait Until Element Is Visible    ${TOOLS_EXCEL_EXPORT_MENU}    timeout=3s
    Click Element    ${TOOLS_EXCEL_EXPORT_MENU}
     ${download}    Run Keyword And Return Status    ${EXCEL_DOWNLOAD_PATH}Export.xlsx
        IF  "${download}" == "${False}"
            Log    "downloaded Excel file path is correct!"    WARN
            
        END

#14. Step: Navigate To The "Telephelyek" Menu
    Wait Until Element Is Visible    ${LOCATIONS_BUTTON}    timeout=3s
    Click Element    ${LOCATIONS_BUTTON}

#15. Step: Filter By Attached Location In The Search Menu AND Check The Name Value
    Wait Until Element Is Visible    ${LOCATIONS_SEARCH_INPUT}    timeout=3s
    Sleep    3s
    Click Element    ${LOCATIONS_SEARCH_INPUT}
    Sleep    3s
    Input Text    ${LOCATIONS_SEARCH_INPUT}    ${first_name} ${last_name}
    ${name_value}    Get Element Attribute    ${LOCATIONS_SEARCH_INPUT}    value
    Should Be Equal As Strings    ${name_value}    ${first_name} ${last_name}

    Wait Until Element Is Visible    ${LOCATION_SEARCH_BUTTON}    timeout=3s
    Sleep    5s
    Click Element    ${LOCATION_SEARCH_BUTTON}

#16: Step: Click On The 'UTCA' Field Menu
    
    Sleep    5s
    Click Link    //a[contains(.,"${partner_street_name}")]

    Test Teardown
   
