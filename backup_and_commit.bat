@echo off
setlocal

:: 设置变量
set MYSQL_USER=root
set MYSQL_PASSWORD=jgc!#2022
set DATABASE_NAME=furniture
set GIT_REPO_PATH=D:\jgc\backData
set OUTPUT_FILE=%GIT_REPO_PATH%\output_file.sql

:: 检查并创建 Git 仓库目录
if not exist "%GIT_REPO_PATH%" (
    echo create folder: %GIT_REPO_PATH%
    mkdir "%GIT_REPO_PATH%"
)

:: 切换到 Git 仓库目录
cd /d "%GIT_REPO_PATH%"

:: 检查并初始化 Git 仓库
if not exist ".git" (
    echo init Git repo
    git init
)

:: 导出数据库
mysqldump -u %MYSQL_USER% -p%MYSQL_PASSWORD% %DATABASE_NAME% > %OUTPUT_FILE%

if %errorlevel% neq 0 (
    echo Database export failed
    exit /b 1
)

:: 添加文件到 Git
git add %OUTPUT_FILE%

:: 提交更改
git commit -m "Automated backup: %date:~9,4%-%date:~6,2%-%date:~3,2% %TIME%

if %errorlevel% neq 0 (
    echo Git commit failed
    exit /b 2
)

:: 推送到远程仓库（如果有）
git push

if %errorlevel% neq 0 (
    echo Git push failed
    exit /b 1
)

echo backup successful

endlocal