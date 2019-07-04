#!/usr/bin

PROJECT_NAME=$1

if [ -f $PROJECT_NAME }; then
    echo Ya existe el archivo $PROJECT_NAME elija otro
    exit
fi

mkdir $PROJECT_NAME && cd $PROJECT_NAME

pipenv install && pipenv shell

if [ 0 -ne $? ]; then
   echo error con pipenv shell
   exit
fi
   
django-admin startproject $PROJECT_NAME . \
    && python manage.py startapp pages

