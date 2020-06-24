*** Variables ***
${XPATH_A_VIDEO_CARD}        //a[contains(@class,'tw-interactable')]
${XPATH_P_VIDEO_VIEW_ALL}    //p[text()="Videos"]
${XPATH_DIV_VIDEO_RESULT}    //div[@class="result-list"]

*** Keywords ***
# -------- Action Keywords --------
Click Video
    [Arguments]    ${idx}=1
    Wait Until Page Contains    Back to All Results
    Click Element    ${XPATH_DIV_VIDEO_RESULT}/a[${idx}]

Click Video List
    Wait Until Page Contains Element    ${XPATH_P_VIDEO_VIEW_ALL}
    Click Element                       ${XPATH_P_VIDEO_VIEW_ALL}

Search Author
    [Arguments]    ${author}
    ${result} =  Run Keyword And Return Status    Page Should Contain Text    ${XPATH_A_VIDEO_CARD}[contains(.,"${author}")]
    [Return]    ${result}

Search Author And Swipe Page
    [Arguments]    ${author}    ${retry}=3
    FOR    ${idx}    IN RANGE    ${retry}
        ${result} =    Search Author    ${author}
        Swipe Page Down
        Exit For Loop If  '${result}'=='Pass'
    END

# -------- Verify Keywords --------