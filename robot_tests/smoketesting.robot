*** Settings ***
Library    SeleniumLibrary

*** Tasks ***
Savutesti 1
    
    Open Browser    ${url_etusivu}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    2s

    Page Should Contain    Home

    Page Should Contain Image    xpath:/html/body/div/header/span/img    

    Close Browser

Savutesti 2

    Open Browser    ${url_projektit}    Chrome    executable_path=C:/Users/jompp/Desktop/ohjelmistotestaus/ohjelmistotestaus_lp/robot_tests/chromedriver.exe

    Sleep    5s

    Click Element    xpath:/html/body/div/aside/button

    Sleep    5s

    Click Element    xpath:/html/body/div/aside/div/div[2]/div[2]/div

    Element Should Contain    xpath:/html/body/div/aside/div/div[3]/div[6]/div/button    ▶ Data

    Close Browser


*** Comments ***
Testit toteutettu alkuperäisen sovelluksen lab27-versioon.

Testissä Savutesti 1 avataan ohjelman etusivu ja tarkastetaan onko sivu auennut oikein tarkastamalla onko Home-teksti ja logo paikoillaan

Testissä Savutesti 2 navigoidaan ohjelman projektisivulle, ja tarkistetaan onko projektitietojen haku saatu loppuun api:lta

*** Variables ***
${url_etusivu}    http://localhost:3000/
${url_projektit}    http://localhost:3000/projects/
