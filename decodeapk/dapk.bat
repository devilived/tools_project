:: apk tool path:http://ibotpeaches.github.io/Apktool/install/
set tgt_dir=%~n1

rd /s/q %tgt_dir%

set apktool_ver=2.3.3

java -jar  -Duser.language=en "apktool_%apktool_ver%\apktool_%apktool_ver%.jar" d %1

::rd /s/q %tgt_dir%\smali
::del %tgt_dir%\apktool.yml

md %tgt_dir%\out
"D:\Program Files\7-Zip\7z.exe" e %1 -o%tgt_dir%\out classes.dex -y
call dex2jar-2.0\d2j-dex2jar.bat -o %tgt_dir%\out\classes-dex2jar.jar %tgt_dir%\out\classes.dex
del classes-error.zip %tgt_dir%\out\classes.dex

jd-gui.exe "%tgt_dir%\out\classes-dex2jar.jar"

del jd-gui.cfg

