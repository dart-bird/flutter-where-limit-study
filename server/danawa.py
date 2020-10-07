from flask_restful import reqparse, abort, Api, Resource
from urllib.request import urlopen
import requests
from bs4 import BeautifulSoup
import urllib.parse


from product_process import parse_memory

parser = reqparse.RequestParser()
parser.add_argument("task")
# 할일(Todo)
# Get, Delete, Put 정의


# 상품정보
PRODUCTS = {
    "memory": {
        "ddr4_2666_4": "http://prod.danawa.com/info/?pcode=6380268",
        "ddr4_2666_8": "http://prod.danawa.com/info/?pcode=5937666",
        "ddr4_2666_16": "http://prod.danawa.com/info/?pcode=5941995",
        "ddr4_2666_32": "http://prod.danawa.com/info/?pcode=9239391",
    }
}

# 예외 처리
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36"
}


def abort_if_product_doesnt_exist(product_id):
    if product_id not in PRODUCTS:
        abort(404, message="Product {} doesn't exist".format(product_id))


class Product(Resource):
    def get(self, product_id):
        abort_if_product_doesnt_exist(product_id)
        return parse_memory(requests, headers, PRODUCTS, product_id, BeautifulSoup)


# 할일 리스트(PRODUCTS)
# Get, POST 정의
class ProductList(Resource):
    def get(self):
        return PRODUCTS

    def post(self):
        args = parser.parse_args()
        if len(args) > 0:
            return args[0], 201
        return "No args", 201
