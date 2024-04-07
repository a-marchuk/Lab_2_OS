@echo off

rem Перевірка кількості аргументів
if "%~2"=="" (
    echo Usage: %0 ^<шлях_до_каталогу^> ^<шлях_до_віддаленого_репозиторію^>
    exit /b 1
)

rem Перехід у локальний каталог
cd /d %1

rem Ініціалізація локального репозиторію
git init

rem Зв'язування локального та віддаленого репозиторіїв
git remote add origin %2

rem Додавання всіх файлів у каталозі до локального репозиторію
git add .

rem Створення коміту з назвою "Initial commit"
git commit -m "Initial commit"

rem Виконання push на віддалений сервер
git push -u origin master
