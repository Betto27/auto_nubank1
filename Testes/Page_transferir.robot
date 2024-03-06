*** Settings ***

Library     AppiumLibrary


Library    String

Library    Collections

Resource    resources/Keywords.robot

Resource    resources/Variaveis.robot

#Comando para sempre executar o Abrir APP
Test Setup    Abrir App

#Comando para sempre fechar o APP
Test Teardown    Fechar App


*** Test Cases ***
Validar botão Voltar na pagina Transferencia
    Given que acesso a pagina de Transferencia
    When clico no botão Voltar do celular
    Then o sistema retorna para pagina inicial do app

Validar botão Fechar na pagina Transferencia
    Given que acesso a pagina de Transferencia
    When clico no botão Fechar
    Then o sistema retorna para pagina inicial do app

Tocar fora da pagina de transferencia para retornar para home do APP
    Given que acesso a pagina de Transferencia
    When clico em uma posição fora da pagina de Transferencia
    Then o sistema retorna para pagina inicial do app

Validar pesquisa na transferencia
    Given que estou na pagina inicial do app nubank
    And clico no botão Transferencia
    When digito na pesquisa    Tony Stark
    Then é apresentado apenas o nome    Tony Stark
    And não deve apresentar o nome Stan Lee
