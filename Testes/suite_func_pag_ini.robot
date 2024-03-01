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

Validar que estou na home do APP
    Given que estou na pagina inicial do app nubank
    When localizo simbolo do nubank
    Then valido para saber se é realemente a home do app correto   NuConta

Validar elementos na tela
    Given que estou na pagina inicial do app nubank
    When verifico os elementos estão visiveis
    Then na tela são apresentados os componentes    ${Lista_tela}

Validar Saldo disponivel
    Given que estou na pagina inicial do app nubank
    When consulto o meu saldo
    Then o meu saldo deve ser de    R$ 5.500,00

Acessar pagina de "indicação de amigos"
    Given que estou na pagina inicial do app nubank
    When clico no botão indicar amigo
    Then sou direcionado para pagina de indicação de amigos     6 indicaçoes enviadas


Acessar a pagina "Cobrar"
    Given que estou na pagina inicial do app nubank
    When clico no botão cobrar
    Then sou direcionado para pagina de cobrar     Quanto você quer cobrar?

Acessar a pagina "Depositar"
    Given que estou na pagina inicial do app nubank
    When clico no botão depositar
    Then sou direcionado para pagina de deposito    Depositar por boleto

