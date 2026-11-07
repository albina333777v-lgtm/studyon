@echo off
chcp 65001 >nul
rem Публикация макетов StudyOn на GitHub Pages: двойной клик по этому файлу.
rem 1) пересобирает index.html (build.py), 2) сохраняет изменения в git, 3) отправляет на GitHub.
rem Через 1-2 минуты сайт обновится: https://albina333777v-lgtm.github.io/studyon/
cd /d "%~dp0"
python build.py
if errorlevel 1 goto fail
git add -A
git diff --cached --quiet && (echo Нет изменений - публиковать нечего.& goto done)
git commit -m "Обновление макетов %date% %time:~0,5%"
git push origin main
if errorlevel 1 goto fail
echo.
echo Готово! Через 1-2 минуты откройте: https://albina333777v-lgtm.github.io/studyon/
goto done
:fail
echo.
echo Что-то пошло не так - пришлите текст выше в чат.
:done
pause
