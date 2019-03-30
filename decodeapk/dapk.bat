:: apk tool path:http://ibotpeaches.github.io/Apktool/install/
:: dex2jar path:https://github.com/pxb1988/dex2jar/releases

set build_dir=build
set smali_dir=%build_dir%\%~n1
set out_dir=%build_dir%\out

::set file_7z="D:\Program Files\7-Zip\7z.exe"
set file_jdx="tools\jd-gui.exe"
::set file_jdx="tools\jadx\bin\jadx-gui.bat"

set file_dex2jar="tools\dex-tools-2.1-SNAPSHOT\d2j-dex2jar.bat"

set apktool_ver=2.4.0
set file_apktool="tools\apktool_%apktool_ver%\apktool_%apktool_ver%.jar"

rd /s/q %build_dir%
md %out_dir%

java -jar  -Duser.language=en %file_apktool% d %1 -o %smali_dir% -f
copy %smali_dir%\AndroidManifest.xml %out_dir%\

call %file_dex2jar% -f %1 -o %out_dir%\%~n1.jar
del *-error.zip

%file_jdx% %out_dir%\%~n1.jar
del tools\jd-gui.cfg

