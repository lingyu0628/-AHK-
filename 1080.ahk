#NoEnv
#SingleInstance force
#MaxHotkeysPerInterval 500
SetWorkingDir %A_ScriptDir%
WinGetPos , , , Width, Height,ahk_exe YuanShen.exe
SendMode Input 
ReadOption()
colorBG = 11213a
jxyr := 0
proyp := "yp+" proheight
sizeH := proheight * 50
jmju := proSlider1+proheight
pointyoff := pointy-proheight
Gui, 1:Add, Text ,xm ,F1：     使用说明.
Gui, 1:Add, Text ,xm ,F2：     保存ahk后重启脚本.
Gui, 1:Add, Text ,xm ,1：      小号一键领取与参与每日派遣.
Gui, 1:Add, Text ,xm ,2：      大号一键领取与参与每日派遣.
Gui, 1:Add, Text ,xm ,3：      尘歌壶一键领取精与制作精炼矿.
Gui, 1:Add, Text ,xm ,4：      小号一键输入账号密码.
Gui, 1:Add, Text ,xm ,5：      大号一键输入账号密码.
Gui, 1:Add, Text ,xm ,6：      一键进出尘歌壶.
Gui, 1:Add, Text ,xm ,7：      快速强化圣遗物
Gui, 1:Add, Text ,xm ,8：      一键退出账号
Gui, 1:Add, Text ,xm ,9：      开启或关闭自动传送.
Gui, 1:Add, Text ,xm ,右回车： 快速强化武器   
ReadOption()  ;读取
{
	global
	IniRead,pointx,Options.ini , 坐标,pointx,1100
	IniRead,pointy,Options.ini , 坐标,pointy,400
	IniRead,prowidth ,Options.ini , 大小,width,150
	IniRead,proheight,Options.ini , 大小,height,20
	return
}

Saveoption()  ;保存
{
	global
		IniWrite, %pointx% ,Options.ini , 坐标,pointx
	IniWrite, %pointy% ,Options.ini , 坐标,pointy
	IniWrite, %prowidth%  ,Options.ini , 大小,width
	IniWrite, %proheight% ,Options.ini , 大小,height
	ReadOption()
	Reload
	return
}

GetColor(x,y)  ;获取坐标xy处的色值
{
	PixelGetColor, color, x, y,  RGB
	StringLeft color,color,10 ;
	return color
}
sleep(duration)  ;高精度睡眠时间
{
	SleepDuration:= duration
	DllCall("Sleep", UInt, SleepDuration)
	DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)  ; 应该进行调用来让系统恢复正常.
}

#IfWinActive ahk_exe YuanShen.exe
NumpadEnd::   ;1.小号一键领取与参加每日派遣
aaa:=0
if GetColor(75,34)=="0x121014"
loop 6
{       
        if A_Index=1       ;A_Index即循环的次数
		{
			SendInput {Click 163,166}  ;蒙德
			Sleep 200
			continue
		}
		if A_Index=4
		{
			SendInput {Click 153,232}  ;璃月
			Sleep 200
			continue
		}
        if A_Index=7
		{
			SendInput {Click 1830,54}  ;关闭
			Sleep 200
			continue
		}
        if A_Index=2
			SendInput {Click 1037,350} ;低语森林
		if A_Index=3
			SendInput {Click 562,412} ;风龙废墟
		if A_Index=5
			SendInput {Click 562,551}  ;绝云间
		if A_Index=6
			SendInput {Click 973,463}  ;瑶光滩
		{
            Sleep 200
			SendInput {Click 1742,1027} ;领取
			Sleep 500
			SendInput {Click 1742,1027} ;点击继续
			Sleep 500
			if aaa=0
            {
				SendInput {Click 1807,683} ;20个
				aaa:=1
				Sleep 1000
            }       
			SendInput {Click 1742,1027}    ;选择
			Sleep 500
            if A_Index=2
				SendInput {Click 484,149}  ;班尼特
			if A_Index=3
				SendInput {Click 467,261}  ;安柏
			if A_Index=5
				SendInput {Click 500,264}  ;九条裟罗
			if A_Index=6
				SendInput {Click 369,367}  ;凯亚
			Sleep 2000
        }     
}
return

NumpadDown::   ;2.大号一键领取与参加每日派遣
aaa:=0
if GetColor(75,34)=="0x121014"
loop 8
{       
        if A_Index=1       ;A_Index即循环的次数
		{
			SendInput {Click 163,166}  ;蒙德
			Sleep 200
			continue
		}
		if A_Index=4
		{
			SendInput {Click 153,232}  ;璃月
			Sleep 200
			continue
		}
        if A_Index=7
		{
			SendInput {Click 158,304}  ;稻妻
			Sleep 200
			continue
		}
        if A_Index=2
			SendInput {Click 1037,350} ;低语森林
		if A_Index=3
			SendInput {Click 562,412} ;风龙废墟
		if A_Index=5
			SendInput {Click 806,565}  ;归离原
		if A_Index=6
			SendInput {Click 973,463}  ;瑶光滩
        if A_Index=8
			SendInput {Click 1091,280}  ;刃连岛
		{
			Sleep 200
			SendInput {Click 1742,1027} ;领取
			Sleep 500
			SendInput {Click 1742,1027} ;点击继续
			Sleep 300
			if aaa=0
            {
				SendInput {Click 1807,683} ;20个
				aaa:=1
				Sleep 1000
            }       
			SendInput {Click 1742,1027}    ;选择
			Sleep 500
            if A_Index=2
				SendInput {Click 451,168}  ;菲谢尔
			if A_Index=3
				SendInput {Click 529,287}  ;班尼特
			if A_Index=5
				SendInput {Click 445,151}  ;刻晴
			if A_Index=6
				SendInput {Click 619,276}  ;重云
			if A_Index=8
				SendInput {Click 474,153}  ;九条裟罗
			if A_Index=
				SendInput {Click 1830,54}  ;关闭     
			Sleep 400
		}
}
return

NumpadPgDn::    ;3.尘歌壶一键领取与制作精炼矿
  if (GetColor(1669,1019)=="0x99CC33") { 
    Click 1736,1029 
    sleep 1000 
    Click 1165,773 
    sleep 1800 
    Click 991,904 
    sleep 500
  } 
  if (GetColor(1669,1019)=="0x99CC33") { 
    Click 1736,1029 
    sleep 1000 
    Click 1165,773 
    sleep 2000 
    Click 991,904 
    sleep 500 
  } 
  if (GetColor(1669,1019)=="0x99CC33") { 
    Click 1736,1029 
    sleep 1000 
    Click 1165,773 
    sleep 2000 
    Click 991,904 
    sleep 500 
  } 
  if (GetColor(1669,1019)=="0x99CC33") { 
    Click 1736,1029 
    sleep 1000 
    Click 1165,773 
    sleep 2000 
    Click 991,904 
    sleep 500 
  } 
  if (GetColor(1669,1019)=="0x99CC33") { 
    Click 1736,1029 
    sleep 1000 
    Click 1165,773 
    sleep 2000 
    Click 991,904 
    sleep 500 
  } 
	if GetColor(1651,1017)=="0x85AF33" ;完成
		{   
            Click 550,151  ;0-4
            Sleep 200
			Click 1765,1019 ;获取
			Sleep 2000
			Click 975,908 ;确认
			Sleep 500
		}
    if GetColor(1651,1017)=="0x85AF33" ;完成
		{              
			Click 1765,1019 ;获取
			Sleep 2000
			Click 975,908 ;确认
			Sleep 500
		}       
    if GetColor(1651,1017)=="0x85AF33" ;完成
		{              
			Click 1765,1019 ;获取
			Sleep 2000
			Click 975,908 ;确认
			Sleep 500
		}       
    if GetColor(1651,1017)=="0x85AF33" ;完成
		{              
			Click 1765,1019 ;获取
			Sleep 2000
			Click 975,908 ;确认
			Sleep 500
		}     
    if GetColor(1344,479)=="0xECE5D8" ;暂无
	    {
		    Click 195,159 ;配方
	    }
return

NumpadLeft::  ;4.小号一键输入账号密码
	{
		WinActivate ahk_exe YuanShen.exe
		Sleep 50        
		if (GetColor(671,628)=="0xFFFFFF") And WinActive("ahk_exe YuanShen.exe")
			goto xahc
	}
return

NumpadClear::  ;5.大号一键输入账号密码
	{
		WinActivate ahk_exe YuanShen.exe
		Sleep 50
		if (GetColor(671,628)=="0xFFFFFF") And WinActive("ahk_exe YuanShen.exe")
			goto dahc
	}
return

NumpadDel:: ;.:迪卢克
	{
		WinActivate ahk_exe YuanShen.exe
		Sleep 50
		if (GetColor(671,628)=="0xFFFFFF") And WinActive("ahk_exe YuanShen.exe")
			goto bahc
	}
return

xahc:
    clipboard = 账号
	Sleep 500
	Send ^v
	Sleep 500
	Send {Tab}
	Sleep 500
	clipboard = 密码
	Sleep 500
	Send ^v	
	Sleep 50
    Click 667,625 ;用户协议
    sleep 50
	Send {Enter}
	sleep 10000
    Click 959,1025 ;点击进入
return
dahc:
	clipboard = 账号
	Sleep 500
	Send ^v
	Sleep 500
	Send {Tab}
	Sleep 500
	clipboard = 密码
	Sleep 500
	Send ^v	
	Sleep 50
    Click 667,625 ;用户协议
    sleep 50
	Send {Enter}
	sleep 10000
    Click 959,1025 ;点击进入
return

bahc:
    clipboard = 账号
	Sleep 500
	Send ^v
	Sleep 500
	Send {Tab}
	Sleep 500
	clipboard = 密码
	Sleep 500
	Send ^v	
	Sleep 50
    Click 667,625 ;用户协议
    sleep 50
	Send {Enter}
	sleep 10000
    Click 959,1025 ;点击进入
return

NumpadRight::   ;6:一键进出尘歌壶
	Send b
    loop 10
    Sleep 100
	if GetColor(1508,476)=="0xECE5D8"
    {
        Sleep 800
	    Click 1039,51
	    Sleep 400
        Click 506,219
        sleep 500
	    Click 1644,1033
	    Sleep 1000
        Send f
    }

return

NumpadHome::                ;7：快速强化圣遗物
	if GetColor(76,26)=="0xD3BC8E"    ;强化界面找一个特殊位置判断是否为强化界面
	{
        sleep 50
		SendInput {Click 1719,767}    ;快捷放入
		Sleep 500
		SendInput {Click 1715,1024}   ;右下角强化
		Sleep 500
		SendInput {Click 152,154}     ;左上角详情
		Sleep 500
		SendInput {Click 131,213}     ;左上角强化
		Sleep 300
	}
return

NumpadUp::   ;8:一键退出账号
     if GetColor(67,44)=="0xFFFFFF" ;派蒙头像
     {
         Send {ESC}
         sleep 900
         Click 51,1026 ;退出
         sleep 1000
         Click 1134,767 ;确认
     }
     loop 3
     sleep 5000
     if GetColor(1822,981)=="0xF8F8F8"
     {
         Click 1827,987 ;退出
         sleep 100
         Click 1073,573 ;确认
     }    
Return

NumpadPgUp::    ;9.自动拾取与自动传送
	{
		v_Enable:=!v_Enable
		if (v_Enable=!true ) ;
		{
			SetTimer, Label, Off
			ToolTip
		}
		else
		{
			SetTimer, Label,
            SetTimer, Label1, Off
            ToolTip , , , ,6
			ToolTip on ,74, 1000
			WinSet AlwaysOnTop,Off,A
		}
	}
return
Label:
	SetTimer, Label, 0
	{
		if (GetColor(1876,35)=="0xECE5D8") and (GetColor(1476,1010)=="0xFECC33") And WinActive("ahk_exe YuanShen.exe")
		{
			Click 1567,1004
		}

	}
return

NumpadAdd::         ;+一键购买种子
if GetColor(1709,1020)=="0xECE5D8"
{
    Click 1716,1015
    sleep 200
    Click 1181,596
    sleep 200
    if GetColor(1173,602)=="0x5C6983"
    {
        Click 1213,764
        sleep 300
        Click 1553,704
    }
}

return

NumpadEnter::                ;NumpadEnter：快速强化武器
	if GetColor(1268,1020)=="0xC8A049"    ;强化界面找一个特殊位置判断是否为强化界面
	{
        sleep 50
		SendInput {Click 1719,767}    ;快捷放入
		Sleep 500
		SendInput {Click 1715,1024}   ;右下角强化
		Sleep 500
        if GetColor(1195,552)=="0xE5E2DE"
        {
        Click 1162,754
        }
		SendInput {Click 152,154}     ;左上角详情
		Sleep 500
		SendInput {Click 131,213}     ;左上角强化
		Sleep 300
	}
return

Label1:

;#IfWinActive
F1::
Gui, 1:Show,  xCEnter y200,  热键说明          
WinSet, Transparent, 250, A
return
#IfWinActive
F2::
	ControlSend,ahk_parent,^s,ahk_exe AutoAHK.exe
    Saveoption()
return
NumpadIns::  ;尘歌壶收取
	if GetColor(685,122)=="0xECE5D8" ;完成
		{   
            Click 484,151  ;0-5
            Sleep 200
			Click 1726,1030 ;获取
			Sleep 2000
			Click 1024,906 ;确认
			Sleep 500
		}
    if GetColor(685,122)=="0xECE5D8" ;完成
		{              
			Click 1726,1030 ;获取
			Sleep 2000
			Click 1024,906 ;确认
			Sleep 500
		}       
    if GetColor(685,122)=="0xECE5D8" ;完成
		{              
			Click 1726,1030 ;获取
			Sleep 2000
			Click 1024,906 ;确认
			Sleep 500
		}       
    if GetColor(685,122)=="0xECE5D8" ;完成
		{              
			Click 1726,1030 ;获取
			Sleep 2000
			Click 1024,906 ;确认
			Sleep 500
		}
    if GetColor(685,122)=="0xECE5D8" ;完成
		{              
			Click 1726,1030 ;获取
			Sleep 2000
			Click 1024,906 ;确认
			Sleep 500
		}     
    if GetColor(685,122)=="0xECE5D8" ;暂无
	    {
		    Click 214,139 ;配方
	    }
return
