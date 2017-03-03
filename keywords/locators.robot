*** Settings ***
Library           Selenium2Library

*** Variables ***
${HEAL_LOGO}              xpath=//*[@id='authentication-view']//img[@src="./images/logo@white.png"]
${REGISTRATION_FORM}      xpath=//*[@id='authentication-view']//form
${CREATE_ACCOUNT_BTN}     xpath=//button[@type="submit"]
${HAVE_ACCOUNT_BTN}       xpath=//*[@id='register-view']//a[@ui-sref="authentication.login"]
${FIRST_NAME_TXT_FLD}     xpath=//*[@id='input_0']
${LAST_NAME_TXT_FLD}      xpath=//*[@id='input_1']
${EMAIL}                  xpath=//*[@id='input_2']
${PASSWORD}               xpath=//*[@id='input_3']
${CONFIRM_PASSWORD}       xpath=//*[@id='input_4']
${PHONE_NUMBER}           xpath=//*[@id='input_5']
${ZIPCODE}                xpath=//*[@id='input_6']
${REMEMBER_ME}            xpath=//md-checkbox/div[@class="md-container md-ink-ripple"]
${PRIVACY_POLICY}         xpath=//*[@id='register-view']//a[@href="https://heal.com/privacy.php"]
${TERS_OF_SERVICE}        xpath=//*[@id='register-view']//a[@href="https://heal.com/terms.php"]
${NOTICE_OF_PRIVACY}      xpath=//*[@id='register-view']//a[@href="https://heal.com/practices.php"]
${NONDISCRIMINATION_NOTICE}    xpath=//*[@id='register-view']//a[@href="https://heal.com/nondiscrimination.php"]
${ERROR_MESSAGE}               xpath=//*[@id='register-view']//div[@class="error-messages"]
${BOOK_VISIT}                  xpath=//*[@id='book-visit']
${CONTINUE_BTN}        xpath=//button[@ng-click="vm.outOfCoverageSignUp()"]
