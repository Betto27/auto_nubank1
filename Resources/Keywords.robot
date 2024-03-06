*** Keywords ***

Abrir App
    Open application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulador-5554
    ...                 app=C:\\Users\\betto\\QArentena\\nuclone-appium-robot\\app\\nuclone.apk
    ...                 udid=emulator-5554

Fechar App
    Close all applications
# Base
Given que estou na pagina inicial do app nubank
    Sleep    1
    Wait until element is visible    accessibility_id=card-hero     10
    Capture page screenshot

#Validar que estou na home do APP
When localizo simbolo do nubank
    Sleep    1
    Wait until element is visible    xpath=//android.widget.TextView[@text="NuConta" and @class="android.widget.TextView"]     10
    Capture Page Screenshot

Then valido para saber se é realemente a home do app correto
    [Arguments]    ${msg}

    Sleep    1


    Element text should be     xpath=//android.widget.TextView[@text="NuConta" and @class="android.widget.TextView"]      ${msg}
    Capture Page Screenshot

#Validar elementos na tela
When verifico os elementos estão visiveis

    Sleep    1
    Wait until element is visible    xpath=//android.widget.TextView[@text="" and @class="android.widget.TextView"]    10
    Capture Page Screenshot

Then na tela são apresentados os componentes
    [Arguments]    ${msg}


    ${msg1}    Create list    ${msg}
    ${lista}    Create list
    #elemento de expandir
    ${elemento}  Get text    xpath=//android.widget.TextView[@text="" and @class="android.widget.TextView"]
    #elemento do olho
    ${elemento1}    Get Text   xpath=//android.widget.TextView[@text="" and @class="android.widget.TextView"]
    #elemento do cifrão ($)
    ${elemento2}    Get Text    xpath=//android.widget.TextView[@text="" and @class="android.widget.TextView"]
    Log to console    ${elemento2}
    Append To List    ${lista}  ${elemento} ${elemento1} ${elemento2}
    Lists Should Be Equal    ${lista}     ${msg1}
    Capture Page Screenshot

# Validar saldo disponivel
When consulto o meu saldo
    Sleep    1
    Click element    accessibility_id=show-balance
    Capture page screenshot

Then o meu saldo deve ser de
    [Arguments]    ${saldo}

    Sleep    1
    Wait until element is visible    accessibility_id=user-balance    10
    Element text should be    accessibility_id=user-balance     ${saldo}
    Capture page screenshot

# Acessar pagina de "indicação de amigos"
When clico no botão indicar amigo
    Sleep    1
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[14]   10
    Click element    xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[14]


Then sou direcionado para pagina de indicação de amigos
    [Arguments]    ${msg}

    Sleep    1
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[14]   10
    Element text should be    xpath=//android.widget.TextView[@text="6 indicaçoes enviadas" and @class="android.widget.TextView"]    ${msg}
    Capture page screenshot    custom_name.png

# Acessar a pagina "Cobrar"

When clico no botão cobrar
    Sleep    1
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[15]
    Click element   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[15]
    Capture page screenshot

Then sou direcionado para pagina de cobrar
    [Arguments]    ${msg}

    Sleep    1
    Wait until element is visible   xpath=//android.widget.TextView[@text="Quanto você quer cobrar?" and @class="android.widget.TextView"]
    Element text should be  xpath=//android.widget.TextView[@text="Quanto você quer cobrar?" and @class="android.widget.TextView"]  ${msg}
    Capture page screenshot

# Acessar a pagina "Depositar"

When clico no botão depositar
    Sleep    1
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[16]
    Click element   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[16]
    Capture page screenshot

Then sou direcionado para pagina de deposito
    [Arguments]    ${msg}

    Sleep    1
    Wait until element is visible   xpath=//android.widget.TextView[@text="Depositar por boleto" and @class="android.widget.TextView"]
    Element text should be   xpath=//android.widget.TextView[@text="Depositar por boleto" and @class="android.widget.TextView"]    ${msg}
    Capture page screenshot


# Page_tranferir
#Validar botão voltar na pagina Transferencia
Given que acesso a pagina de Transferencia
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[17]   10
    CLick element    xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[17]
    Capture page screenshot

When clico no botão Voltar do celular
    Sleep    1
    Press Keycode   4

Then o sistema retorna para pagina inicial do app
    Sleep    1
    Wait until element is visible    accessibility_id=card-hero     10
    Page Should Contain Element     accessibility_id=card-hero
    Capture page screenshot

#Validar botão voltar na pagina Transferencia
When clico no botão Fechar
    Sleep    1
    Wait Until Element is Visible   xpath=//android.widget.TextView[@text=""]
    Click Element   xpath=//android.widget.TextView[@text=""]
    Capture Page Screenshot

#Tocar fora da pagina de transferencia para retornar para home do APP
When clico em uma posição fora da pagina de Transferencia

    Click Element   accessibility_id=top-header
    #Tap With Positions    2   548     500

    Sleep    3
#Validar pesquisa na transferencia

And clico no botão Transferencia
    Wait until element is visible   xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[17]   10
    CLick element    xpath=(//android.view.ViewGroup[@class="android.view.ViewGroup"])[17]
    Capture page screenshot

When digito na pesquisa
    [Arguments]    ${msg}


    Wait until element is visible    xpath=//android.view.ViewGroup[@content-desc="card-hero"]
    Click element    css=android.widget.EditText
    Sleep    1
    Input Text  css=android.widget.EditText   ${msg}
    Capture page screenshot

Then é apresentado apenas o nome
    [arguments]    ${msg}

    Sleep    1
    Element Text Should Be  xpath=//android.widget.TextView[@text="Tony Stark" and @class="android.widget.TextView"]    ${msg}
    Capture page screenshot

And não deve apresentar o nome Stan Lee

    Page Should Not Contain Element    xpath=//android.widget.TextView[@text="Stan Lee" and @class="android.widget.TextView"]
    Capture page screenshot    Evidencias//Evi_pesq.png

