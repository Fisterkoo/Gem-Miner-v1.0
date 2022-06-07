:: Game made by Fisterkoo
:: Game development started Saturday 4. June 2022, 13:48:18
:: Update 1.0
:: =====================================   L   O   A   D   I   N   G   ============================================

@echo off
setlocal enabledelayedexpansion
mode 60,20
title Gem Miner
color 0F
goto :loading

:loading
mode 60,20
cls
echo Loading...
set /a Income=0
set /a IncomeCalculation=0
if not exist "!cd!\settings" (md settings)
if not exist "!cd!\accounts" (md accounts)
if exist "!cd!\settings\LDMode.bat" (
	call "!cd!\settings\LDMode.bat"
	) else (
		(
		echo color 0F
		echo set ColorTheme=Dark
		)>"!cd!\settings\LDMode.bat"
		cls
)
if exist "!cd!\settings\autologin.bat" (
	call "!cd!\settings\autologin.bat"
	goto :gamecheck
)
if exist "!cd!\settings\xyz.bat" (
	goto :account
	)
cls
echo.
echo.
echo                       ^^! WARNING ^^!
echo              Pressing any wrong keybind in
echo              game will result in loud "BEEP"
echo                sound effect. Please avoid
echo                 clicking wrong keybinds...
echo.
echo                Please, set command line
echo                 text size to 16 by right
echo                clicking the top bar of
echo                command line app, click
echo                properties, then select
echo               font and then choose text
echo                size to 16. Thank you^^!
echo.
echo.
echo       You can turn off this message in the settings^^!
echo.
pause
goto :account

:: ================================================================================================================

:: =====================================   A   C   C   O   U   N   T   ============================================

:account
cls
mode 50,10
echo Gem Miner
echo.
echo [1] Login
echo [2] Register
echo [3] Continue as a Guest (Cannot Save Game)
echo [4] Exit
set /p accountmenu=">>"
if !accountmenu! EQU 1 (
goto :login
) else if !accountmenu! EQU 2 (
goto :register
) else if !accountmenu! EQU 3 (
goto :guest
) else if !accountmenu! EQU 4 (
goto :quit
) else goto :account

:: ================================================================================================================

:: =========================================   L   O   G   I   N   ================================================

:login
cls
set /p loguse="Enter Existing Accounts Username>> "
if not exist "!cd!\accounts\!loguse!.bat" (
	cls
	echo This account does not exist...
	pause
	goto :account
)
goto :loginpassword

:loginpassword
cls
echo Username: !loguse!
call "!cd!\accounts\!loguse!.bat"
set /p logpas="Enter Valid Account Password>> "
if not !logpas! EQU !AccountPassword! (
	cls
	echo Wrong Password...
	pause
	goto :account
)
goto :gamecheck

:guest
cls
echo Logging in as a Guest...
(
echo set AccountUsername=Guest
echo set AccountPassword=12345678
)>"!cd!\accounts\Guest.bat"
cls
call "!cd!\accounts\Guest.bat"
set loguse=Guest
set reguse=Guest
ping localhost -n 2 >nul
goto :gamecheck

:: ================================================================================================================

:: =================================   R   E   G   I   S   T   E   R   ============================================

:register
cls
set /p reguse="Enter Valid Username>> "
if "!reguse!" EQU "" (
cls
echo You cannot register an account with no name!
pause
goto :account
) else if !reguse! EQU Guest (
cls
echo You cannot register a Guest Account!
pause
goto :account
) else if !reguse! EQU guest (
cls
echo You cannot register a Guest Account!
pause
goto :account
) else if exist "!cd!\accounts\!reguse!.bat" (
cls
echo You cannot register name, with an already existing account!
pause
goto :account
) else goto :registerpassword

:registerpassword
cls
echo Username=!reguse!
set /p regpas="Enter Valid Password>> "
goto :registeraccount

:registeraccount
cls
echo Username=!reguse!
echo Password=!regpas!
set /p registersave="Do you want to create this account?[y/n]>> "
if !registersave! EQU y (
goto :registeraccountsave
) else if !registersave! EQU n (
goto :account
) else goto :registeraccount

:registeraccountsave
cls
echo Creating account...
(
echo set AccountUsername=!reguse!
echo set AccountPassword=!regpas!
)>"!cd!\accounts\!reguse!.bat"
cls
echo Creating account...
ping localhost -n 2 >nul
cls
echo Account Created!
pause
goto :account

:: ================================================================================================================

:: ===========================   G   A   M   E      L   O   A   D   I   N   G   ===================================

:gamecheck
cls
if not exist "!cd!\accounts\!loguse!save.bat" (
	cls
	goto :newgame
) else (
cls
call "!cd!\accounts\!loguse!save.bat"
goto :gamemenu
)

:newgame
(
echo set /a Gems=10
echo set LegitGame=Legit
echo set /a BasicGemMiner=0
echo set /a IronGemMiner=0
echo set /a SilverGemMiner=0
echo set /a GoldGemMiner=0
echo set /a DiamondGemMiner=0
echo set /a EmeraldGemMiner=0
echo set /a DarkMatterGemMiner=0
echo set /a BasicGemMinerProfit=1
echo set /a IronGemMinerProfit=5
echo set /a SilverGemMinerProfit=10
echo set /a GoldGemMinerProfit=50
echo set /a DiamondGemMinerProfit=100
echo set /a EmeraldGemMinerProfit=500
echo set /a DarkMatterGemMinerProfit=1000
echo set /a BasicGemMinerPrice=10
echo set /a IronGemMinerPrice=100
echo set /a SilverGemMinerPrice=5000
echo set /a GoldGemMinerPrice=10000
echo set /a DiamondGemMinerPrice=50000
echo set /a EmeraldGemMinerPrice=100000
echo set /a DarkMatterGemMinerPrice=500000
echo set /a BasicGemMinerPriceAdder=15
echo set /a IronGemMinerPriceAdder=150
echo set /a SilverGemMinerPriceAdder=7500
echo set /a GoldGemMinerPriceAdder=15000
echo set /a DiamondGemMinerPriceAdder=75000
echo set /a EmeraldGemMinerPriceAdder=150000
echo set /a DarkMatterGemMinerPriceAdder=750000
echo set /a Basic=0
echo set /a Iron=0
echo set /a Siver=0
echo set /a Gold=0
echo set /a Diamond=0
echo set /a Emerald=0
echo set /a DarkMatter=0
echo set /a Miners=0
echo set /a IncomeCalculation=0
echo set /a IncomeCalculation2=0
echo set /a RebirthBoost=1
echo set /a Trophy=0
echo set /a PlaySeconds=0
echo set /a PlayMinutes=0
echo set /a PlayHours=0
echo set /a PlayDays=0
echo set /a PlayYears=0
echo set /a Networth=0
)>"!cd!\accounts\!loguse!save.bat"
call "!cd!\accounts\!loguse!save.bat"
goto :gamemenu

:: ================================================================================================================

:: ==========================================   G   A   M   E   ===================================================

:gamemenu
if !autosavesafety! GEQ 5 (
	if exist "!cd!\settings\autosave.bat" (
	call :SaveModule
	set /a autosavesafety=0
	)
)
if !PlaySeconds! GEQ 60 (
	set /a PlaySeconds=0
	set /a PlayMinutes=!PlayMinutes! + 1
)
if !PlayMinutes! GEQ 60 (
	set /a PlayMinutes=0
	set /a PlayHours=!PlayMinutes! + 1
)
if !PlayHours! GEQ 24 (
	set /a PlayHours=0
	set /a PlayDays=!PlayMinutes! + 1
)
if !PlayDays! GEQ 365 (
	set /a PlayDays=0
	set /a PlayYears=!PlayMinutes! + 1
)
if !Trophy! GTR 0 (set TrophyBoost=2) else (set TrophyBoost=1)
if !BasicGemMiner! EQU 0 (set BasGemMin=Inactive) else (set BasGemMin=!BasicGemMiner! Active)
if !IronGemMiner! EQU 0 (set IroGemMin=Inactive) else (set IroGemMin=!IronGemMiner! Active)
if !SilverGemMiner! EQU 0 (set SilGemMin=Inactive) else (set SilGemMin=!SilverGemMiner! Active)
if !GoldGemMiner! EQU 0 (set GolGemMin=Inactive) else (set GolGemMin=!GoldGemMiner! Active)
if !DiamondGemMiner! EQU 0 (set DiaGemMin=Inactive) else (set DiaGemMin=!DiamondGemMiner! Active)
if !EmeraldGemMiner! EQU 0 (set EmeGemMin=Inactive) else (set EmeGemMin=!EmeraldGemMiner! Active)
if !DarkMatterGemMiner! EQU 0 (set DarGemMin=Inactive) else (set DarGemMin=!DarkMatterGemMiner! Active)
cls
mode 50,30
echo Your logged in as !loguse!^^!
echo.
echo                . . . Mining . . .
echo.
echo.
echo Your Balance: !Gems! Gems^^!
echo.
echo.
echo Basic Gem Miner       = !BasGemMin!
echo Iron Gem Miner        = !IroGemMin!
echo Silver Gem Miner      = !SilGemMin!
echo Gold Gem Miner        = !GolGemMin!
echo Diamond Gem Miner     = !DiaGemMin!
echo Emerald Gem Miner     = !EmeGemMin!
echo Dark Matter Gem Miner = !DarGemMin!
echo.
echo.
echo Total Income = !Income!/s
echo.
echo.
echo Press [S] to Enter the Shop...
echo Press [R] to Enter the Rebirth Menu...
echo Press [W] to Enter the Settings Menu...
echo Press [E] to Show Stats...
echo Press [A] to Save...
echo Press [Q] to Save and Quit...
echo.
echo.
echo Made By Fisterkoo                     v1.0 Release
CHOICE /C:SRWEAQX /N /T 1 /D X >nul
if !errorlevel! EQU 1 (
goto :shop
) else if !errorlevel! EQU 2 (
goto :rebirth
) else if !errorlevel! EQU 3 (
goto :settings
) else if !errorlevel! EQU 4 (
goto :stats
) else if !errorlevel! EQU 5 (
goto :save
) else if !errorlevel! EQU 6 (
goto :quit
) else if !errorlevel! EQU 7 (
set /a Basic=!BasicGemMinerProfit! * !BasicGemMiner!
set /a Iron=!IronGemMinerProfit! * !IronGemMiner!
set /a Silver=!SilverGemMinerProfit! * !SilverGemMiner!
set /a Gold=!GoldGemMinerProfit! * !GoldGemMiner!
set /a Diamond=!DiamondGemMinerProfit! * !DiamondGemMiner!
set /a Emerald=!EmeraldGemMinerProfit! * !EmeraldGemMiner!
set /a DarkMatter=!DarkMatterGemMinerProfit! * !DarkMatterGemMiner!
set /a Miners=!Basic! + !Iron! + !Silver! + !Gold! + !Diamond! + !Emerald! + !DarkMatter!
set /a IncomeCalculation=!Miners! * !RebirthBoost!
set /a IncomeCalculation2=!IncomeCalculation! * !TrophyBoost!
set /a Income=!IncomeCalculation2!
set /a Networth=!Networth! + !IncomeCalculation2!
set /a Gems=!Gems! + !IncomeCalculation2!
set /a PlaySeconds=!PlaySeconds! + 1
set /a autosavesafety=!autosavesafety! + 1
goto :gamemenu
)

:: ================================================================================================================

:: ==========================================   S   H   O   P   ===================================================

:shop
mode 65,30
if exist "!cd!\settings\autosave.bat" (
	call :SaveModule
)
cls
echo You have !Gems! Gems^^!
if !BasicGemMiner! GEQ 1000000 (set BasicMax=MAX) else (set BasicMax=!BasicGemMiner!)
if !IronGemMiner! GEQ 100000 (set IronMax=MAX) else (set IronMax=!IronGemMiner!)
if !SilverGemMiner! GEQ 100000 (set SilverMax=MAX) else (set SilverMax=!SilverGemMiner!)
if !GoldGemMiner! GEQ 10000 (set GoldMax=MAX) else (set GoldMax=!GoldGemMiner!)
if !DiamondGemMiner! GEQ 10000 (set DiamondMax=MAX) else (set DiamondMax=!DiamondGemMiner!)
if !EmeraldGemMiner! GEQ 1000 (set EmeraldMax=MAX) else (set EmeraldMax=!EmeraldGemMiner!)
if !DarkMatterGemMiner! GEQ 100 (set DarkMatterMax=MAX) else (set DarkMatterMax=!DarkMatterGemMiner!)
echo.
echo [1] Buy Basic Gem Miner - Price: !BasicGemMinerPrice!
echo You have !BasicMax! Basic Gem Miners. Earns: 1 Gem/s Each!
echo.
echo [2] Buy Iron Gem Miner - Price: !IronGemMinerPrice!
echo You have !IronMax! Basic Gem Miners. Earns: 5 Gems/s Each!
echo.
echo [3] Buy Silver Gem Miner - Price: !SilverGemMinerPrice!
echo You have !SilverMax! Basic Gem Miners. Earns: 10 Gems/s Each!
echo.
echo [4] Buy Gold Gem Miner - Price: !GoldGemMinerPrice!
echo You have !GoldMax! Basic Gem Miners. Earns: 50 Gems/s Each!
echo.
echo [5] Buy Diamond Gem Miner - Price: !DiamondGemMinerPrice!
echo You have !DiamondMax! Basic Gem Miners. Earns: 100 Gems/s Each!
echo.
echo [6] Buy Emerald Gem Miner - Price: !EmeraldGemMinerPrice!
echo You have !EmeraldMax! Basic Gem Miners. Earns: 500 Gems/s Each!
echo.
echo [7] Buy Dark Matter Gem Miner - Price: !DarkMatterGemMinerPrice!
echo You have !DarkMatterMax! Basic Gem Miners. Earns: 1000 Gems/s Each!
echo.
echo [8] Buy Trophy - Price: 1000000000
echo You have !Trophy! Trophies. Earns: 2x Gems For All!
echo.
echo.
echo.
echo [0] Leave the Shop...
set /p shopmenu=">> "
if !shopmenu! EQU 1 (goto :BasicBuy)
if !shopmenu! EQU 2 (goto :IronBuy)
if !shopmenu! EQU 3 (goto :SilverBuy)
if !shopmenu! EQU 4 (goto :GoldBuy)
if !shopmenu! EQU 5 (goto :DiamondBuy)
if !shopmenu! EQU 6 (goto :EmeraldBuy)
if !shopmenu! EQU 7 (goto :DarkMatterBuy)
if !shopmenu! EQU 8 (goto :TrophyBuy)
if !shopmenu! EQU 0 (goto :gamemenu)
goto :shop

:: ================================================================================================================

:: =====================================   R   E   B   I   R   T   H   ============================================

:rebirth
mode 50,30
if exist "!cd!\settings\autosave.bat" (
	call :SaveModule
)
if !Trophy! LEQ 0 (
	cls
	echo You need atleast 1 Trophy to Enter...
	pause
	goto :gamemenu
) else (
	goto :rebirthmenu
)

:rebirthmenu
set /a NextRebirthBoost=!RebirthBoost! + 1
cls
echo.
echo      .   .   .   R E B I R T H   .   .   .
echo.
echo Rebirthing will remove ALL your items
echo INCLUDING Trophies, but will give you
echo PERMANENT BOOST!
echo.
echo What you lose: Gem Miners
echo                Gems
echo                Trophies
echo.
echo What you get: PERMANENTLY HIGHER Rebirth Boost!
echo.
echo Your:
echo Current Rebirth Gems Booster: !RebirthBoost!x
echo Rebirth Gems Booster after This Rebirth: !NextRebirthBoost!x
echo.
echo.
set /p rebirthoption="Do you want to rebirth? [y/n]>> "
if !rebirthoption! EQU y (goto :RebirthModule)
if !rebirthoption! EQU n (goto :gamemenu)

:RebirthModule
cls
echo Rebirthing...
(
echo set /a Gems=10
echo set LegitGame=!LegitGame!
echo set /a BasicGemMiner=0
echo set /a IronGemMiner=0
echo set /a SilverGemMiner=0
echo set /a GoldGemMiner=0
echo set /a DiamondGemMiner=0
echo set /a EmeraldGemMiner=0
echo set /a DarkMatterGemMiner=0
echo set /a BasicGemMinerProfit=1
echo set /a IronGemMinerProfit=5
echo set /a SilverGemMinerProfit=10
echo set /a GoldGemMinerProfit=50
echo set /a DiamondGemMinerProfit=100
echo set /a EmeraldGemMinerProfit=500
echo set /a DarkMatterGemMinerProfit=1000
echo set /a BasicGemMinerPrice=10
echo set /a IronGemMinerPrice=100
echo set /a SilverGemMinerPrice=5000
echo set /a GoldGemMinerPrice=10000
echo set /a DiamondGemMinerPrice=50000
echo set /a EmeraldGemMinerPrice=100000
echo set /a DarkMatterGemMinerPrice=500000
echo set /a BasicGemMinerPriceAdder=15
echo set /a IronGemMinerPriceAdder=150
echo set /a SilverGemMinerPriceAdder=7500
echo set /a GoldGemMinerPriceAdder=15000
echo set /a DiamondGemMinerPriceAdder=75000
echo set /a EmeraldGemMinerPriceAdder=150000
echo set /a DarkMatterGemMinerPriceAdder=750000
echo set /a Basic=0
echo set /a Iron=0
echo set /a Siver=0
echo set /a Gold=0
echo set /a Diamond=0
echo set /a Emerald=0
echo set /a DarkMatter=0
echo set /a Miners=0
echo set /a IncomeCalculation=0
echo set /a IncomeCalculation2=0
echo set /a RebirthBoost=!RebirthBoost! + 1
echo set /a Trophy=0
echo set /a PlaySeconds=!PlaySeconds!
echo set /a PlayMinutes=!PlayMinutes!
echo set /a PlayHours=!PlayHours!
echo set /a PlayDays=!PlayDays!
echo set /a PlayYears=!PlayYears!
echo set /a Networth=!Networth!
)>"!cd!\accounts\!loguse!save.bat"
call "!cd!\accounts\!loguse!save.bat"
cls
echo Successfully Rebirthed^^!
echo You now have !RebirthBoost!x Gems Boost!
pause
goto :gamemenu

:: ================================================================================================================

:: ============================================   B   A   S   I   C   =============================================

:BasicBuy
cls
if !BasicGemMiner! GEQ 1000000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !BasicGemMinerPrice! (
goto :BasicBuyAmmount
) else goto :NotEnoughMoney

:BasicBuyAmmount
cls
echo How much Basic Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p BasicPurchaseAmmount=">> "
if !BasicPurchaseAmmount! EQU 1 (goto :BasicBuy_1)
goto :BasicBuyAmmount

:BasicBuy_1
cls
set /a Gems=!Gems! - !BasicGemMinerPrice!
set /a BasicGemMinerPrice=!BasicGemMinerPrice! + !BasicGemMinerPriceAdder!
set /a BasicGemMiner=!BasicGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ==============================================   I   R   O   N  ================================================

:IronBuy
cls
if !IronGemMiner! GEQ 100000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !IronGemMinerPrice! (
goto :IronBuyAmmount
) else goto :NotEnoughMoney

:IronBuyAmmount
cls
echo How much Iron Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p IronPurchaseAmmount=">> "
if !IronPurchaseAmmount! EQU 1 (goto :IronBuy_1)
goto :IronBuyAmmount

:IronBuy_1
cls
set /a Gems=!Gems! - !IronGemMinerPrice!
set /a IronGemMinerPrice=!IronGemMinerPrice! + !IronGemMinerPriceAdder!
set /a IronGemMiner=!IronGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ========================================   S   I   L   V   E   R  ==============================================

:SilverBuy
cls
if !SilverGemMiner! GEQ 100000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !SilverGemMinerPrice! (
goto :SilverBuyAmmount
) else goto :NotEnoughMoney

:SilverBuyAmmount
cls
echo How much Silver Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p SilverPurchaseAmmount=">> "
if !SilverPurchaseAmmount! EQU 1 (goto :SilverBuy_1)
goto :SilverBuyAmmount

:SilverBuy_1
cls
set /a Gems=!Gems! - !SilverGemMinerPrice!
set /a SilverGemMinerPrice=!SilverGemMinerPrice! + !SilverGemMinerPriceAdder!
set /a SilverGemMiner=!SilverGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ============================================   G   O   L   D   =================================================

:GoldBuy
cls
if !GoldGemMiner! GEQ 10000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !GoldGemMinerPrice! (
goto :GoldBuyAmmount
) else goto :NotEnoughMoney

:GoldBuyAmmount
cls
echo How much Gold Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p GoldPurchaseAmmount=">> "
if !GoldPurchaseAmmount! EQU 1 (goto :GoldBuy_1)
goto :GoldBuyAmmount

:GoldBuy_1
cls
set /a Gems=!Gems! - !GoldGemMinerPrice!
set /a GoldGemMinerPrice=!GoldGemMinerPrice! + !GoldGemMinerPriceAdder!
set /a GoldGemMiner=!GoldGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ======================================   D   I   A   M   O   N   D   ===========================================

:DiamondBuy
cls
if !DiamondGemMiner! GEQ 10000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !DiamondGemMinerPrice! (
goto :DiamondBuyAmmount
) else goto :NotEnoughMoney

:DiamondBuyAmmount
cls
echo How much Diamond Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p DiamondPurchaseAmmount=">> "
if !DiamondPurchaseAmmount! EQU 1 (goto :DiamondBuy_1)
goto :DiamondBuyAmmount

:DiamondBuy_1
cls
set /a Gems=!Gems! - !DiamondGemMinerPrice!
set /a DiamondGemMinerPrice=!DiamondGemMinerPrice! + !DiamondGemMinerPriceAdder!
set /a DiamondGemMiner=!DiamondGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ======================================   E   M   E   R   A   L   D   ===========================================

:EmeraldBuy
cls
if !EmeraldGemMiner! GEQ 1000 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !EmeraldGemMinerPrice! (
goto :EmeraldBuyAmmount
) else goto :NotEnoughMoney

:EmeraldBuyAmmount
cls
echo How much Emerald Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p EmeraldPurchaseAmmount=">> "
if !EmeraldPurchaseAmmount! EQU 1 (goto :EmeraldBuy_1)
goto :EmeraldBuyAmmount

:EmeraldBuy_1
cls
set /a Gems=!Gems! - !EmeraldGemMinerPrice!
set /a EmeraldGemMinerPrice=!EmeraldGemMinerPrice! + !EmeraldGemMinerPriceAdder!
set /a EmeraldGemMiner=!EmeraldGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ==============================   D   A   R   K      M   A   T   T   E   R   ====================================

:DarkMatterBuy
cls
if !DarkMatterGemMiner! GEQ 100 (
call :YouHaveMaxMiners
)
if !Gems! GEQ !DarkMatterGemMinerPrice! (
goto :DarkMatterBuyAmmount
) else goto :NotEnoughMoney

:DarkMatterBuyAmmount
cls
echo How much DarkMatter Miners would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p DarkMatterPurchaseAmmount=">> "
if !DarkMatterPurchaseAmmount! EQU 1 (goto :DarkMatterBuy_1)
goto :DarkMatterBuyAmmount

:DarkMatterBuy_1
cls
set /a Gems=!Gems! - !DarkMatterGemMinerPrice!
set /a DarkMatterGemMinerPrice=!DarkMatterGemMinerPrice! + !DarkMatterGemMinerPriceAdder!
set /a DarkMatterGemMiner=!DarkMatterGemMiner! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ========================================   T   R   O   P   H   Y   =============================================

:TrophyBuy
cls
if !Gems! GEQ 1000000000 (
goto :TrophyAmmount
) else goto :NotEnoughMoney

:TrophyAmmount
cls
echo How much Trophies would you like to purchase?
echo.
echo [1] Availible
echo [10] Comming soon...
echo [100] Comming soon...
echo [MAX] Comming soon...
set /p TrophyPurchaseAmmount=">> "
if !TrophyPurchaseAmmount! EQU 1 (goto :TrophyBuy_1)
goto :TrophyBuyAmmount

:TrophyBuy_1
cls
set /a Gems=!Gems! - 1000000000
set /a Trophy=!Trophy! + 1
echo Purchased!
pause
goto :shop

:: ================================================================================================================

:: ========================================   S   T   A   T   S   =================================================



:stats
mode 50,30
if exist "!cd!\settings\autosave.bat" (
	call :SaveModule
)
cls
if !loguse! EQU Guest (
	echo You cannot Show Stats in guest account...
	pause
	goto :gamemenu
)
echo.
echo        .   .   .   S T A T S   .   .   .
echo.
echo Playtime:!PlayYears!Y:!PlayDays!D:!PlayHours!H:!PlayMinutes!M:!PlaySeconds!S
echo Networth: !Networth!
echo.
echo.
echo This Playthrough is !LegitGame!^^!
echo (Legit   = No Admin Commands Used)
echo (Cheated = Admin Commands Used)
echo.
echo.
echo Stuff Obtained:
echo Basic Mines Obtained. . . . !BasicGemMiner!
echo Iron Mines Obtained . . . . !IronGemMiner!
echo Silver Mines Obtained:. . . !SilverGemMiner!
echo Gold Mines Obtained . . . . !GoldGemMiner!
echo Diamond Mines Obtained. . . !DiamondGemMiner!
echo Emerald Mines Obtained. . . !EmeraldGemMiner!
echo Dark Matter Mines Obtained. !DarkMatterGemMiner!
echo Trophies Obtained . . . . . !Trophy!
echo.
echo.
echo Boosts:
echo !RebirthBoost!x Rebirth Boost!
echo !TrophyBoost!x Trophies Boost!
echo.
echo.
echo.
pause
goto :gamemenu

:: ================================================================================================================

:: =====================================   S   E   T   T   I   N   G   S   ========================================

:settings
mode 50,20
if exist "!cd!\settings\autosave.bat" (
	call :SaveModule
)
cls
if !loguse! EQU Guest (
	echo You cannot change Settings in guest account...
	pause
	goto :gamemenu
)
call "!cd!\settings\LDMode.bat"
if !ColorTheme! EQU Dark (set ColorThemeMode=Light) else (set ColorThemeMode=Dark)
if exist "!cd!\settings\xyz.bat" (set WarningScreen=Enable) else (set WarningScreen=Disable)
if exist "!cd!\settings\autologin.bat" (set AutologinONOFF=Disable) else (set AutologinONOFF=Enable)
if exist "!cd!\settings\autosave.bat" (set AutosaveONOFF=Disable Autosave - Less Lag - No Input Delay) else (set AutosaveONOFF=Enable Autosave - More Lag - Input Delay)
echo.
echo     .   .   .   S E T T I N G S   .   .   .
echo.
echo [1] Enable !ColorThemeMode! Mode
echo [2] !WarningScreen! Warning Screen
echo [3] YouTube Codes
echo [4] !AutologinONOFF! Autologin
echo [5] Credits
echo [6] Delete All Data!
echo [7] !AutosaveONOFF!
echo.
echo.
echo.
echo [9] Admin Console
echo [0] Return to The Game
set /p settingsmenu=">> "
if !settingsmenu! EQU 1 (goto :LightDarkMode)
if !settingsmenu! EQU 2 (goto :DisableWarning)
if !settingsmenu! EQU 3 (goto :YoutubeCodes)
if !settingsmenu! EQU 4 (goto :SetupAutologin)
if !settingsmenu! EQU 5 (goto :Credits)
if !settingsmenu! EQU 6 (goto :DeleteAllData)
if !settingsmenu! EQU 7 (goto :AutosaveSetup)
if !settingsmenu! EQU 9 (goto :AdminConsole)
if !settingsmenu! EQU 0 (goto :gamemenu)
goto :settings

:LightDarkMode
cls
call "!cd!\settings\LDMode.bat"
if !ColorTheme! EQU Dark (
	(
	echo color F0
	echo set ColorTheme=Light
	)>"!cd!\settings\LDMode.bat"
	call "!cd!\settings\LDMode.bat"
	goto :settings
)
if !ColorTheme! EQU Light (
	(
	echo color 0F
	echo set ColorTheme=Dark
	)>"!cd!\settings\LDMode.bat"
	call "!cd!\settings\LDMode.bat"
	goto :settings
)

:DisableWarning
cls
if exist "!cd!\settings\xyz.bat" (
	del /Q "!cd!\settings\xyz.bat"
	goto :settings
) else (
	(
	echo.
	)>"!cd!\settings\xyz.bat"
	goto :settings
)

:YoutubeCodes
cls
echo.
echo  .   .   .   Y O U T U B E  C O D E S   .   .   .
echo.
set /p YouTubeCodes="Enter Valid YouTube Code>> "
if !YouTubeCodes! EQU TH3B3GG1N1NG (
	if exist "!cd!\settings\!loguse!code1.bat" (
		cls
		echo You have already redeemed the Code!
		pause
		goto :settings
	) else (
		set /a Gems=!Gems! + 1000
		set /a Networth=!Networth! + 1000
		(
		echo.
		)>"!cd!\settings\!loguse!code1.bat"
		cls
		echo You just redeemed 1000 Gems!
		pause
		goto :settings
	)

) else (
	cls
	echo Invalid Code!
	pause
	goto :settings
)

:AdminConsole
cls
set /p VerifyAdmin="Enter Admin Password>> "
if !VerifyAdmin! EQU 1938290 (
	goto :AdminConsoleApproved
) else (
	cls
	echo Wrong password
	pause
	goto :settings
)

:AdminConsoleApproved
mode 120,30
echo Welcome, to the Admin Console!
echo Type "back" to return to Settings Menu...
echo.
:ConsoleLoop
set LegitGame=Cheated
set /p admincommand="[Console]>> "
if !!admincommand! EQU back (goto :settings)
!admincommand!
echo.
goto :ConsoleLoop

:SetupAutologin
cls
if exist "!cd!\settings\autologin.bat" (
	del /Q "!cd!\settings\autologin.bat"
	goto :settings
) else (
	(
	echo set loguse=!loguse!
	echo set logpas=!logpas!
	)>"!cd!\settings\autologin.bat"
	goto :settings
)

:DeleteAllData
cls
echo Are you REALLY Sure you want to delete ALL DATA?
set /p DeleteAll="(Lost data cannot be recovered)[y/n]>> "
if !DeleteAll! EQU y (
	cls
	set /p DeleteVerify="Enter your Accounts Password>> "
	if !DeleteVerify! EQU !logpas! (
		goto :ProceedDeletion
	) else (
		cls
		echo Wrong Password!
		pause
		goto :settings
	)
)
if !DeleteAll! EQU n (goto :settings)
goto :DeleteAllData

:ProceedDeletion
cls
echo Deleting All Data...
if exist "!cd!\settings\*.*" (del /Q "!cd!\settings\*.*")
if exist "!cd!\accounts\*.*" (del /Q "!cd!\accounts\*.*")
if exist "!cd!\accounts" (del /Q "!cd!\accounts")
if exist "!cd!\settings" (del /Q "!cd!\settings")
cls
echo Success...
pause
goto :loading

:Credits
mode 60,15
cls
echo Game made by Fisterkoo
echo Game development started Saturday 4. June 2022, 13:48:18
echo Current Update: 1.0
echo.
echo My Biggest Project so far!
echo.
echo Testers: JUNIXMAN / My Bro
echo.
echo Social Networks:YouTube: @fisterkoo
echo                 Twitter: @fisterkoo
echo                 Instagram: @benjii.menn
echo                 TikTok: @fiztythegamer
echo.
echo.
pause
goto :gamemenu

:AutosaveSetup
cls
if exist "!cd!\settings\autosave.bat" (
	del /Q "!cd!\settings\autosave.bat"
	goto :settings
) else (
	(
	echo.
	)>"!cd!\settings\autosave.bat"
	goto :settings
)

:: ================================================================================================================

:: ==========================================   E   R   R   O   R   S   ===========================================

:NotEnoughMoney
cls
echo You do not have enough Money...
pause
goto :shop

:YouHaveMaxMiners
cls
echo You have Max Miners!
pause
goto :shop

:: ================================================================================================================

:: ===========================   S   A   V   E      P   R   O   G   R   E   S   S   ===============================

:save
cls
if !loguse! EQU Guest (
	echo You cannot Save Game in guest account...
	pause
	goto :gamemenu
)
call :SaveModule
echo Saved!
pause
goto :gamemenu

:SaveModule
(
echo set /a Gems=!Gems!
echo set LegitGame=!LegitGame!
echo set /a BasicGemMiner=!BasicGemMiner!
echo set /a IronGemMiner=!IronGemMiner!
echo set /a SilverGemMiner=!SilverGemMiner!
echo set /a GoldGemMiner=!GoldGemMiner!
echo set /a DiamondGemMiner=!DiamondGemMiner!
echo set /a EmeraldGemMiner=!EmeraldGemMiner!
echo set /a DarkMatterGemMiner=!DarkMatterGemMiner!
echo set /a BasicGemMinerProfit=1
echo set /a IronGemMinerProfit=5
echo set /a SilverGemMinerProfit=10
echo set /a GoldGemMinerProfit=50
echo set /a DiamondGemMinerProfit=100
echo set /a EmeraldGemMinerProfit=500
echo set /a DarkMatterGemMinerProfit=1000
echo set /a BasicGemMinerPrice=!BasicGemMinerPrice!
echo set /a IronGemMinerPrice=!IronGemMinerPrice!
echo set /a SilverGemMinerPrice=!SilverGemMinerPrice!
echo set /a GoldGemMinerPrice=!GoldGemMinerPrice!
echo set /a DiamondGemMinerPrice=!DiamondGemMinerPrice!
echo set /a EmeraldGemMinerPrice=!EmeraldGemMinerPrice!
echo set /a DarkMatterGemMinerPrice=!DarkMatterGemMinerPrice!
echo set /a BasicGemMinerPriceAdder=15
echo set /a IronGemMinerPriceAdder=150
echo set /a SilverGemMinerPriceAdder=7500
echo set /a GoldGemMinerPriceAdder=15000
echo set /a DiamondGemMinerPriceAdder=75000
echo set /a EmeraldGemMinerPriceAdder=150000
echo set /a DarkMatterGemMinerPriceAdder=750000
echo set /a Basic=0
echo set /a Iron=0
echo set /a Siver=0
echo set /a Gold=0
echo set /a Diamond=0
echo set /a Emerald=0
echo set /a DarkMatter=0
echo set /a Miners=0
echo set /a IncomeCalculation=0
echo set /a IncomeCalculation2=0
echo set /a RebirthBoost=!RebirthBoost!
echo set /a Trophy=!Trophy!
echo set /a PlaySeconds=!PlaySeconds!
echo set /a PlayMinutes=!PlayMinutes!
echo set /a PlayHours=!PlayHours!
echo set /a PlayDays=!PlayDays!
echo set /a PlayYears=!PlayYears!
echo set /a Networth=!Networth!
)>"!cd!\accounts\!loguse!save.bat"
goto :eof

:: ================================================================================================================

:: ==================================================   Q   U   I   T   ===========================================

:quit
cls
echo Quitting..
call :SaveModule
if exist "!cd!\accounts\Guestsave.bat" (del /Q "!cd!\accounts\Guestsave.bat")
ping localhost -n 2 >nul
echo Quitting...
exit

:: ================================================================================================================
