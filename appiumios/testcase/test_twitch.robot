*** Settings ***
Documentation    使用robotframework和appium，寫一個依照page object pattern的結構的
...              test script，Test Case如下：
...              以https://www.twitch.tv/ 為例，在手機瀏覽器下，進去首頁後，
...              從搜尋框輸入 “Monster Hunter World” ，然後從結果的過去影片中找尋
...              第一筆使用者為CervelloneRe 的影片 (如果找不到，挑一個使用者名稱，
...              至少需要往下延伸list兩三次的)，進去播放5秒後截圖，確認有播放。

Library           AppiumLibrary

# Force Tags      Orders

# Resource        ../init.robot

# Suite Setup     Suite Setup
# Test Timeout    ${TEST_TIMEOUT}

*** Variables ***
*** Test Cases ***
Check twitch
	Open Application    http://localhost:4723/wd/hub
    ...    platformName=iOS           platformVersion=12.4
    ...    deviceName=iPhone 11
    ...    browserName=Safari
    ...    app=https://www.twitch.tv/

Check twitch
*** Keywords ***
# --------  Suite Setup    --------


# --------  Test Setup     --------


# -------- Gogoro Keywords --------


# -------- Verify Keywords --------

# Given Open web go to https://www.twitch.tv/
# When Search "Monster Hunter World”

# ㄖhttps://www.twitch.tv/search?term=Monster%20Hunter%20World&type=videos