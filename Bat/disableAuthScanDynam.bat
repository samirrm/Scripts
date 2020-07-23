IF EXIST  "C:\Windows\SysWOW64\" (
cd "C:\Windows\SysWOW64\Dynamsoft\DynamicWebTwain\ForChrome"
) ELSE (
cd "C:\Windows\System32\Dynamsoft\DynamicWebTwain\ForChrome"
)
(echo [DynamicWebTWAIN] & echo.EnableScannerAccessAuth=FALSE & echo.EnableFileAccessAuth=FALSE & echo.EnableWebcamAccessAuth=FALSE & echo.LogLevel=6 & echo.Server=127.0.0.1 & echo.Port=18618 & echo.PortSSL=18619) > DWTConfiguration.ini
net stop "Dynamsoft WebTWAIN Service"
net start "Dynamsoft WebTWAIN Service"

PAUSE