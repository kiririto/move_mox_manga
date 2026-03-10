@echo off
setlocal enabledelayedexpansion

for %%f in (*.epub) do (
  set "fname=%%~nxf"

  rem ブラケット型: [任意プレフィックス][シリーズ名]残り.epub
  if "!fname:~0,1!"=="[" (
    for /f "tokens=2 delims=[]" %%s in ("!fname!") do (
      set "dest=%%s"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if not exist "!dest!" md "!dest!"
      move "%%f" "!dest!\"
    )
  )

  rem アンダースコア型: _任意プレフィックス__シリーズ名_残り.epub
  if "!fname:~0,1!"=="_" (
    for /f "tokens=2 delims=_" %%s in ("!fname!") do (
      set "dest=%%s"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if "!dest:~-1!"=="." set "dest=!dest:~0,-1!"
      if not exist "!dest!" md "!dest!"
      move "%%f" "!dest!\"
    )
  )
)
