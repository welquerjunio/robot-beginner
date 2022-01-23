*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerrar sessão

*** Test Cases ***
Login com sucesso
    Go To                ${url}/login
    Input Text           css:input[name=username]        stark
    Input Text           css:input[name=password]        jarvis!
    Click Element        class:btn-login

Senha inválida
    [tags]              login_error
    Go To               ${url}/login
    Input Text          css:input[name=username]        stark
    Input Text          css:input[name=password]        acb123
    Click Element       class:btn-login

    ${message}=         Get WebElement                  id:flash
    Should Contain      ${message.text}                 Senha é invalida!

Usuário não existe
    [tags]              login_user404
    Go To               ${url}/login
    Input Text          css:input[name=username]        papito
    Input Text          css:input[name=password]        123456
    Click Element       class:btn-login

    ${message}=         Get WebElement                  id:flash
    Should Contain      ${message.text}                 O usuário informado não está cadastrado!