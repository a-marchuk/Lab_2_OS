@echo off

rem Масив з іменами майбутніх користувачів
set "usernames=user1 user2 user3"

rem Шлях до папки, де потрібно створити користувачів
set "target_folder=D:\Studying\Labs\OS\Lab_2"

rem Цикл для перебору імен користувачів
for %%u in (%usernames%) do (
    rem Перевірка чи існує вже користувач з таким ім'ям
    if exist "%target_folder%\%%u\" (
        echo Користувач %%u вже існує
    ) else (
        rem Створення каталогу з відповідною назвою
        mkdir "%target_folder%\%%u"
        rem Додавання у систему нового користувача
        net user %%u /add
        rem Генерування пароля для користувача та збереження у файл
        set "password=!random!!random!!random!!random!!random!!random!!random!!random!!random!!random!!random!!random!"
        echo %password% > "%target_folder%\%%u\password.txt"
        rem Створення SSH ключа для доступу в систему
        mkdir "%target_folder%\%%u\.ssh"
        ssh-keygen -t rsa -b 4096 -C "%%u@example.com" -f "%target_folder%\%%u\.ssh\id_rsa" -N ""
	git add "%target_folder%\%%u"
    )
)

git commit -m "Added new users"
git push origin master
