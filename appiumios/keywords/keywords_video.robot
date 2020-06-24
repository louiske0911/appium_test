*** Variables ***
${AUDIENCES_WARNING_MSG}       The broadcaster indicated that this video is intended for mature audiences.
${XPATH_DIV_START_WATCHING}    //div[contains(text(), "Start Watching")]

*** Keywords ***
# -------- Action Keywords --------
Start Watching
    Wait Until Page Contains Element    ${XPATH_DIV_START_WATCHING}
    Click Element                       ${XPATH_DIV_START_WATCHING}

Watch The Video
    Wait Until Page Contains Element    //div//video
    ${warning} =    Run Keyword And Return Status    Page Should Contain Text    ${AUDIENCES_WARNING_MSG}
    Run Keyword If    "${warning}"=="True"    Start Watching

# -------- Verify Keywords --------