@echo off
docker-machine ssh dev sh /c/Users/john/docker/SQLInjection/hello.sh
docker-machine ip dev
echo Press any key to stop server.
pause > NUL
echo Removing container...
docker-machine ssh dev docker stop sql_inj
docker-machine ssh dev docker rm sql_inj
pause