@echo off
set USER=root
set PASSWORD=jgc!#2022
set DATABASE=furniture
set SQLDIR=C:\Users\Administrator\Desktop\data

for %%F in ("%SQLDIR%\*.sql") do (
  echo Executing %%F
  mysql -u%USER% -p%PASSWORD% %DATABASE% < "%%F"
)