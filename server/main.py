from flask import Flask
from flask_restful import reqparse, abort, Api, Resource

from todo import Todo
from todo import TodoList

from danawa import Product
from danawa import ProductList


# Flask 인스턴스 생성
app = Flask(__name__)
api = Api(app)

# URL Router에 맵핑한다.(Rest URL정의)
api.add_resource(TodoList, "/todos/")
api.add_resource(Todo, "/todos/<string:todo_id>")
api.add_resource(Product, "/danawa/products/<string:product_id>")
api.add_resource(ProductList, "/danawa/products/<string:product_id>")

# 서버 실행
if __name__ == "__main__":
    app.run(debug=True, host="192.168.1.8", port=8888)

# https://niceman.tistory.com/101
# https://jhyeok.com/python-with-vscode/
