*** Settings ***

Library    AppiumLibrary



*** Test Cases ***

Rodar um video no youtube
    Abrir App


*** Keywords ***

Abrir App
    Open application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulador-5554
    ...                 app=C:\\Users\\betto\\QArentena\\nuclone-appium-robot\\app\\nuclone.apk
    ...                 udid=emulator-5554

    Wait until element is visible    accessibility_id=card-hero     10
    Sleep    2
    Press keycode    4
    Sleep    3
    Click element    accessibility_id=YouTube
    Wait until element is visible    xpath=(//android.widget.ImageView[@class="android.widget.ImageView"])[7]
    Click element    xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[13]
    Sleep    40
