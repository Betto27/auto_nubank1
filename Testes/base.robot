*** Settings ***

Library    AppiumLibrary

Library     AppiumLibrary

Library    String

*** Test Cases ***

Teste 1
    Given que acesso o app nubank
    When localizo simbolo do nubank
    Then valido para saber se é realemente o simbolo esperado   NuConta

*** Keywords ***





Given que acesso o app nubank
    Open application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulador-5554
    ...                 app=C:\\Users\\betto\\QArentena\\nuclone-appium-robot\\app\\nuclone.apk
    ...                 udid=emulator-5554

    Sleep    1
    Wait until element is visible    accessibility_id=card-hero     10
    Capture Page Screenshot


When localizo simbolo do nubank
    Sleep    1
    Wait until element is visible    xpath=//android.widget.TextView[@text="NuConta" and @class="android.widget.TextView"]     10
    Capture Page Screenshot

Then valido para saber se é realemente o simbolo esperado
    [Arguments]    ${msg}

    Sleep    1
    ${variavel}=    Get text    xpath=//android.widget.TextView[@text="NuConta" and @class="android.widget.TextView"]
    ${variavel}=    Strip string    ${variavel}
    Log    ${variavel}
    Element text should be    ${variavel}     ${variavel}
    Capture Page Screenshot

Fechar App
    Close all applications