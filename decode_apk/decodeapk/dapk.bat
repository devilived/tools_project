set tgt_dir=%~n1

rd /s/q %tgt_dir%

java -jar "apktool\apktool.jar" d %1

rd /s/q %tgt_dir%\smali
del %tgt_dir%\apktool.yml


"C:\Program Files\7-Zip\7z" e %1 classes.dex -y
call dex2jar-0.0.9.8\dex2jar classes.dex

copy classes_dex2jar.jar %tgt_dir%

del classes.dex classes_dex2jar.jar

jd-gui %tgt_dir%\classes_dex2jar.jar
