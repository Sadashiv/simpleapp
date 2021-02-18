#!/bin/bash
VERSION="3.9.0"
PYTHON="Python-$VERSION"
MD5="b3fb85fd479c0bf950c626ef80cacb57"
PREFIX="`pwd`/usr"
PY_PATH="bin/python3"
DOWNLOAD_PREFIX="http://www.python.org/ftp/python/$VERSION"
DOWNLOADDIR="downloads"
LOGNAME="output.log"
SETUPTOOL_VERSION="53.0.0"
PIP_VERSION="21.0.1"

mkdir -p $DOWNLOADDIR
cd $DOWNLOADDIR
if [ -f $PYTHON.tar.xz ];
then
    echo "*********************************************"
    echo "Python package $PYTHON avalibale locally"
    echo "*********************************************"
else
    echo "*********************************************"
    echo "Started download of $PYTHON"
    wget -c $DOWNLOAD_PREFIX/$PYTHON.tar.xz --no-check-certificate 1>$LOGNAME 2>>$LOGNAME
    echo "Completed download of $PYTHON"
    echo "*********************************************"
fi

#Check the python already exists
VALIDATE_PY_PATH=$PREFIX/$PY_PATH
if [ -f $VALIDATE_PY_PATH ];
then
    echo "*********************************************"
    echo "Python3 already installed in path ---->"
    echo "$PREFIX/bin/python3"
    echo "*********************************************"
else
    echo "*********************************************"
    echo "Installing python-$VERSION"
    tar xf $PYTHON.tar.xz
    cd $PYTHON
    ./configure --prefix=$PREFIX --enable-unicode=ucs4 1>>$LOGNAME 2>>$LOGNAME
    make 1>$LOGNAME
    make install 1>$LOGNAME
    cd ..
    echo "Completed installation for python: $VERSION"
    echo "*********************************************"
fi
echo "$PYTHON is installed here:"
echo "./usr/bin/python3"
echo "*********************************************"

if [ ! -f "setuptools-$SETUPTOOL_VERSION.tar.gz" ];
then
    wget -c https://files.pythonhosted.org/packages/12/68/95515eaff788370246dac534830ea9ccb0758e921ac9e9041996026ecaf2/setuptools-$SETUPTOOL_VERSION.tar.gz 1>>$LOGNAME 2>>$LOGNAME
fi
if [ ! -f "pip-$PIP_VERSION.tar.gz" ];
then
    wget -c https://files.pythonhosted.org/packages/b7/2d/ad02de84a4c9fd3b1958dc9fb72764de1aa2605a9d7e943837be6ad82337/pip-$PIP_VERSION.tar.gz 1>>$LOGNAME 2>>$LOGNAME
fi
tar zxf setuptools-$SETUPTOOL_VERSION.tar.gz 1>>$LOGNAME 2>>$LOGNAME
tar xf pip-$PIP_VERSION.tar.gz
echo "*********************************************"
echo "Started Installing the setuptools and pip"
cd setuptools-$SETUPTOOL_VERSION && ../../usr/bin/python3 setup.py install 1>>$LOGNAME 2>>$LOGNAME && cd ..
cd pip-$PIP_VERSION && ../../usr/bin/python3 setup.py install 1>>$LOGNAME 2>>$LOGNAME && cd ..
echo "Completed Installing the setuptools and pip"
echo "*********************************************"
