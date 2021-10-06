@echo off
mode con:cols=100
CHCP 65001 >NUL
FOR /f "delims=/" %%G IN ('type "C:\Users\Tucira\Desktop\Ferramentas_TuciraTeam_Vol1\Dados\Dpassword.txt"') DO set inputcode=%%G
CHCP 437 >NUL
start "coluna" C:\Users\Tucira\Desktop\Ferramentas_TuciraTeam_Vol1\Dados\Geral\coluna_progresso_1.bat
CHCP 65001 >NUL
setlocal enableDelayedExpansion
for /F "tokens=*" %%b in ('type "C:\Users\Tucira\Desktop\Ferramentas_TuciraTeam_Vol1\Dados\DSimples_N1.txt"') do set code=%%b
set chars=0123456789abcdefghijklmnopqrstuwxyzçáàéèìíòó-;.,âê\!?/#ãõ
for /L %%N in (10 1 58) do (
for /F %%C in ("!chars:~%%N,1!") do (
set /a MATH=%%N+%inputcode%/3
for /F %%F in ("!MATH!") do (
set "code=!code:%%F=%%C!"
)
)
)
for /f %%F in ("!code!") do (
set "code=!code:1963=!"
)
echo !code!>Decriptado_N1.txt
endlocal
exit /b