Heal tests
================
Heal Test's test coverage for various client applications.

Usage
=====
RobotFramework allows for maintaining tests using a keyword-driven methodology that is easy to read, understand, and add to.  These test cases hide the code and abstraction behind easy-to-read keywords.

This project allows for a high level of flexibility in where tests are run and what device to run them against.  Tests can just as easily be pointed to the cloud as they can be pointed to a local device or simulator.



Setup
=====

Pre-setup
---------
* Please make sure you have Firefox 45.0 for this tests to run 
* Follow instructions here to install virtualenv stuff: http://jamiecurle.com/blog/installing-pip-virtualenv-and-virtualenvwrapper-on-os-x/


### Configure virtualenv (use .bashrc in linux)
```
echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
mkdir -p $WORKON_HOME
source ~/.bash_profile
```

### Create clienttest virtualenv
```
mkvirtualenv --python=/usr/bin/python2.7 --no-site-packages clienttest
```

### To activate the virtual environment...
```
workon clienttest
```

### To deactivate the virtual environment...
```
deactivate
```




Required
--------
1. Clone the repository
    ```
    git clone git@github.com:pmhalder/Heal.git
    ```
2. Go into the directory of the library and run setup 
    ```
    pip install -r requrements.txt
    ```




Running Tests
===========

To run a test file, go into the project directory of choice within `heal`, and then into that project directory's test directory (i.e. `tests`) and run the following Robot command (if you followed the example directory)...
```
pybot functional_flows.robot
```

To run tests using saucelab 
pybot -v TEST_RUN_TYPE:SAUCELABS  tests/functional_flows.robot

after you ran the test you can log in to www.saucelab.com with following credential and check the test 

  username: heal_test 
  password: password1




Please run `pybot --help` to learn more about all the flexibility available to you.

Examples
--------
To run all tests locally (from package directory level):
```
pybot --variable TEST_RUN_TYPE:LOCAL functional_flow.robot
```

To run same tests on SauceLabs:
```
pybot --variable TEST_RUN_TYPE:SAUCELABS functional_flow.robot
```

To Run with a specific Tag 
pybot --variable TEST_RUN_TYPE:SAUCELABS -i UI functional_flow.robot






