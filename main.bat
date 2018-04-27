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
title BAT - VBoxManage
cls
echo.------------------------------------------------------------
echo. 1.�鿴���������
echo. 2.�鿴�������е������
echo. 3.���������
echo. 4.�����������̨����
echo. 5.�ر������
echo. 6.ǿ�ƹر������
echo. 7.����������������������Զ����������
echo. 8.�ı��������Զ���������Ӷ˿�
echo. 9.����...
echo. 0.�˳�
echo.------------------------------------------------------------

::�ȴ�����
:inputNum
if exist "%SystemRoot%\System32\choice.exe" goto :choice
set /p num=���������ֲ����س���ȷ��:
if %num%==1 goto :lsAll
if %num%==2 goto :lsRuning
if %num%==3 goto :startVms
if %num%==4 goto :startVmsTypeHeadless
if %num%==5 goto :stopVms
if %num%==6 goto :vmsPoweroff
if %num%==7 goto :vrdp
if %num%==8 goto :changeVmsVrapPort
if %num%==9 goto :more
if %num%==0 goto :end
cls
echo ����������������ѡ��
ping 127.0.1 -n "2">nul
goto :menu
:choice
choice /c 12345678 /n /m "��������Ӧ���֣�"
if errorlevel 1 goto :lsAll
if errorlevel 2 goto :lsRuning
if errorlevel 3 goto :startVms
if errorlevel 4 goto :startVmsTypeHeadless
if errorlevel 5 goto :stopVms
if errorlevel 6 goto :vmsPoweroff
if errorlevel 7 goto :vrdp
if errorlevel 8 goto :changeVmsVrapPort
if errorlevel 9 goto :more
if errorlevel 0 goto :end
goto :menu
pause>nul & exit

::�鿴���������
:lsAll
title �鿴���������
cls
echo.------------------------------------------------------------
VBoxManage list vms
echo.------------------------------------------------------------
goto :back

::�鿴�������е������
:lsRuning
title �鿴�������е������
cls
echo.------------------------------------------------------------
VBoxManage list runningvms
echo.------------------------------------------------------------
goto :back

::���������
:startVms
title ���������
cls
set /p name=���������������: 
echo.------------------------------------------------------------
VBoxManage startvm %name%
echo.------------------------------------------------------------
goto :back

::�����������̨����
:startVmsTypeHeadless
title �����������̨����
cls
set /p name=���������������: 
echo.------------------------------------------------------------
VBoxManage startvm %name% --type headless
echo.------------------------------------------------------------
goto :back

::�ر������
:stopVms
title �ر������
cls
set /p name=���������������: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% acpipowerbutton
echo.------------------------------------------------------------
goto :back

::ǿ�ƹر������
:vmsPoweroff
title ǿ�ƹر������
cls
set /p name=���������������: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% poweroff
echo.------------------------------------------------------------
goto :back

::����������������������Զ����������
:vrdp
title ����������������������Զ����������
cls
set /p name=���������������(Ĭ�϶˿�:3389): 
echo.------------------------------------------------------------
VBoxManage startvm %name% --type vrdp
echo.------------------------------------------------------------
goto :back

::�ı��������Զ���������Ӷ˿�
:changeVmsVrapPort
title �ı��������Զ���������Ӷ˿�
cls
set /p name=���������������: 
set /p port=������˿�:: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% vrdpprot %port%
echo.------------------------------------------------------------
goto :back

::����
:more
title ����
cls
echo.------------------------------------------------------------
echo. �����������������ڿ���̨���� VBoxManage -h
echo.------------------------------------------------------------
goto :back

::���ز˵�
:back
echo.
echo.����������ز˵� & pause>nul
goto :menu

::exit
:end
cls & echo ллʹ�ã�
ping 127.0.1 -n "2">nul
exit