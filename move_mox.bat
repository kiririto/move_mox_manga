@echo off
for /f "tokens=2 delims=[]" %%i in ('dir /b /a-d "[Kox][*]*.kepub.epub"') do (
  if not exist "%%i" md "%%i"
  move "[Kox][%%i]*.kepub.epub" "%%i\"
)