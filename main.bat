@echo off & setlocal enabledelayedexpansion
title BAT - VBoxManage
mode con: cols=60 lines=20

::���VBoxManage�Ƿ����
:checkVirtualBoxPath
echo %path%|findstr /i "VirtualBox">nul && goto :menu
goto :addVirtualBoxPath

::��VirtualBox��ӵ�����������
:addVirtualBoxPath
cls
echo.��⵽��û�н�VirtualBox�İ�װ·����ӵ�path�����С�
set /p yesorno=�Ƿ�����ӣ�(yes or no)
cls
if %yesorno% == yes (
    echo.����������·�����߽�VirtualBox�ļ������봰��
    echo.:����ֱ�ӽ�VirtualBox�ļ������봰��
    set /p VirtualBoxPath=:
    set path=%path%;!VirtualBoxPath!
    goto :checkVirtualBoxPath
)
exit

::���˵�
:menu
cls
echo.------------------------------------------------------------
echo. 1.�鿴���������
echo. 2.�鿴�������е������
echo. 3.�����������̨����
echo. 4.�ر������
echo. 5.ǿ�ƹر������
echo. 6.����������������������Զ����������
echo. 7.�ı��������Զ���������Ӷ˿�
echo. 8.�˳�
echo.------------------------------------------------------------

if exist "%SystemRoot%\System32\choice.exe" goto :choice
set /p choice=���������ֲ����س���ȷ��:
if %choice%==8 goto :end
cls
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto :menu

:choice
choice /c 12345678 /n /m "��������Ӧ���֣�"
if errorlevel 8 goto :end
goto :menu

pause>nul & exit

:end
cls & echo ллʹ�ã�
ping 127.1/2 > nul
exit