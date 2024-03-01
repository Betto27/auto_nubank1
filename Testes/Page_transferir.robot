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

Validar pesquisa na transferencia
    Given que estou na pagina inicial do app nubank
    When digito na pesquisa    Tony Stark
    Then é apresentado apenas o nome    Tony Stark
    And não deve apresentar o nome Stan Lee
