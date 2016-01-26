Docker Sample for SQL Injection
===============================

This docker image is already pushed to Docker Hub. Pull it.

  $ docker pull matoba/sql_injection

Run container with binding port.

  $ docker run -d -p 80:80 --name sql_inj matoba/sql_injection

HTTP access your docker environment(http://[IP address], IP: dokcer env [machine name]).
A form appears and table name will be shown below the form. Enter some names, John, Tom... If there is a name, is entered, in DB, you can see row.

You can try SQL Injection. Put words into form like below and back to "http://[IP address]". Table keeps exist?

  John"; SELECT * FROM employees;DROP TABLE employees;"
