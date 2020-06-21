@ECHO OFF
IF "%1"=="start" (
    ECHO Copying excel file
    copy /Y "\\batfs1\ThirdLineSupport\ECPLog\ECPLog.xlsm" "C:\Work\Projects\Hotfix Viewer Spring\Executables\Excel File\"
    ECHO Stopping default mongoDB service
    net stop MongoDB
    ECHO start MongoDB Auth Service
    start "MongoDB Auth Service" mongod --auth --dbpath="C:\MongoDB\data\db"
    timeout 10
    ECHO start HFLogUI
    start "HFLogUI" java -jar "C:\Work\Projects\Hotfix Viewer Spring\Executables\HFLogUI.war"
    ECHO start HotfixViewerBackend
    start "HotfixViewerBackend" java -jar "C:\Work\Projects\Hotfix Viewer Spring\Executables\HotfixViewerBackend.jar"
    ECHO start Redirect_Page_HFLogUI
    start "Redirect_Page_HFLogUI" java -jar "C:\Work\Projects\Hotfix Viewer Spring\Executables\Redirect_Page_HFLogUI.war"
) ELSE IF "%1"=="stop" (
    ECHO stop HFLogUI
    TASKKILL /FI "WINDOWTITLE eq HFLogUI"
    ECHO stop HotfixViewerBackend
    TASKKILL /FI "WINDOWTITLE eq HotfixViewerBackend"
    ECHO stop Redirect_Page_HFLogUI
    TASKKILL /FI "WINDOWTITLE eq Redirect_Page_HFLogUI"
    ECHO stop MongoDB Auth Service
    TASKKILL /FI "WINDOWTITLE eq MongoDB Auth Service"
) ELSE (
    ECHO please, use "start" or "stop" argument
)
timeout 10