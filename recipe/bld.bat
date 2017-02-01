:: the bootstrap.py script requires pip to install dependencies. conda is
:: providing these dependencies and therefore pip is not needed. Copy a mock
:: version of the pip module so that the bootstrap.py script can be run.
copy /Y %RECIPE_DIR%\mock_pip.py pip.py

set SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0
set SETUPTOOLS_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0
set DISTRIBUTE_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=0

%PYTHON% bootstrap.py
if errorlevel 1 exit 1

%PYTHON% setup.py install --single-version-externally-managed --record=record.txt
if errorlevel 1 exit 1
