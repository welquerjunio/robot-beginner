*** Settings ***
Library     app.py

*** Test Cases ****
Deve retornar mensagem de boas vindas
    ${result}=         Welcome      Welquer
    Should Be Equal    ${result}    Olá Welquer, bem vindo ao Curso básico de Robot Framework!
