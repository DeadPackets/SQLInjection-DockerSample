import os
import time

import tornado.web
import tornado.wsgi
import mysql.connector

HTML_STR = """<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
</head>
<body>
    <form action="/" method="post">
        <input type="text" name="user" />
        <input type="submit" value="post" />
    </form>
</body>
</html>
"""

cnx = mysql.connector.connect(user="root", database="test")


class HelloHandler(tornado.web.RequestHandler):
    def get(self):
        self.write(HTML_STR)

    def post(self):
        user = self.get_argument("user")
        cur = cnx.cursor(buffered=True)
        query = 'SELECT * FROM employees WHERE name = "{0}";'.format(user)
        response = ""
        try:
            for result in cur.execute(query, multi=True):
                if result.with_rows:
                    response += result.fetchone()[1] + "<br>"
            self.write(query + "<br><br>" + response)
        except:
            self.write("Failed: " + query + "<br>" + response)




settings = {}

application = tornado.web.Application([
    ("/", HelloHandler),
], **settings)

wsgi_app = tornado.wsgi.WSGIAdapter(application)
