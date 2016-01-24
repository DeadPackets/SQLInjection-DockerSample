cd /c/Users/john/docker/SQLInjection
docker stop sql_inj
docker rm sql_inj
docker build -t sql_inj_tmp ./
docker run -d -p 80:80 --name sql_inj sql_inj_tmp
