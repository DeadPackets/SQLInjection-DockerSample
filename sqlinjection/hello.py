import os
import time
import sys

import tornado.web
import tornado.wsgi
import tornado.template
import mysql.connector


cnx = mysql.connector.connect(host="db", user="root", database="sqlinj")


class SelectHandler(tornado.web.RequestHandler):
    def get(self):
        kind = self.get_argument("kind", "")
        template_values = {}
        items = []
        error_message = ""
        if kind != "":
            cursor = cnx.cursor(buffered=True)
            query = "SELECT * FROM items WHERE kind = '{0}';".format(kind)
            try:
                for result in cursor.execute(query, multi=True):
                    if result.with_rows:
                        for result_s in result:
                            items.append(result_s)
            except Exception as e:
                error_message = str(e) + "Failed: " + query
        template_values["error"] = error_message
        template_values["items"] = items
        template_values["kind"] = kind
        self.render("select.html", **template_values)


settings = {
    "debug":True,
    "template_path": os.path.join(os.path.dirname(__file__), "views"),
}

application = tornado.web.Application([
    ("/select", SelectHandler),
], **settings)

wsgi_app = tornado.wsgi.WSGIAdapter(application)