#!/bin/bash

function main {
    show_prompt
    read user_input

    case $user_input in
    1) print_user_and_os_info ;;
    2) ln_current_user_dir ;;
    3) make_file ;;
    4) custom_ping ;;
    *) echo "Wrong input" ;;
    esac
}

function print_user_and_os_info() {
    whoami && uname -or
    sleep 7
}

function ln_current_user_dir() {
    ls -la $HOME
    sleep 7
}

function make_file() {
    echo -n 'Filename>> '
    read filename
    echo -n 'Permissions>> '
    read permissions
    if [[ -n "$filename" && "$permissions" =~ ^[0-9]+$ ]]; then
        touch $filename && chmod $permissions $filename
    else
        echo "One of the variables is empty"
    fi
    sleep 5
}

function custom_ping() {
    echo -n 'Target>> '
    read target
    echo -n 'Number of packages>> '
    read num
    if [[ -n "$target" && "$num" =~ ^[0-9]+$ ]]; then
        ping -c $num $target
    else
        echo "One of the variables is empty or the number of packages is not a number"
    fi
    sleep 5
}

function show_prompt() {
    echo "Выберете команду:"
    echo "1. Информация о текущем пользователе и версии ядра"
    echo "2. Вывод списка файлов в домашней папке текущего пользователя"
    echo "3. Создать файл с заданными правами в заданной директории"
    echo "4. Отправляет n пакетов на заданный ресурс (ping)"
    echo -n ">> "
}

main
