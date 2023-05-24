*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}              chrome
${URL}                  http://www.amazon.com.br
${MENU_ELETRONICOS}     (//a[contains(.,'Eletrônicos')])[1]
${HEADER_ELETRONICOS}   //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                           url=${URL}
    Wait Until Element Is Visible   locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element       locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${TEXTO_HEADER_ELETRONICOS}"
    Wait Until Page Contains        text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible   locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be                 title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible       locator=//img[@alt='${NOME_CATEGORIA}']

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                      locator=//input[@id='twotabsearchtextbox']     text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element                   locator=//input[@id='nav-search-submit-button']

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible   locator=(//span[contains(.,'Xbox Series S')])[10]