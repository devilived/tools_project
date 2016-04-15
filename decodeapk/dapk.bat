:: apk tool path:http://ibotpeaches.github.io/Apktool/install/
set tgt_dir=%~n1

rd /s/q %tgt_dir%

java -jar  -Duser.language=en "apktool2.1.0\apktool_2.1.0.jar" d %1

rd /s/q %tgt_dir%\smali
del %tgt_dir%\apktool.yml


"D:\Program Files\2345Soft\HaoZip\HaoZipC.exe" e %1 classes.dex -y
call dex2jar-2.0\d2j-dex2jar classes.dex

copy classes-dex2jar.jar "%tgt_dir%"

del classes.dex classes-dex2jar.jar

jd-gui "%tgt_dir%\classes-dex2jar.jar"

