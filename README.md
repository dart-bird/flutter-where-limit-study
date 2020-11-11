## Flutter Study - JARAM

- **Week 1** - Setting Env  
- **Week 2** - Create Memory Box
- **Week 3** - Http request setting & Finish!
- **Week 4** - Refresh & Animation Control

## What we learned
#### Widget
- **Stateful**, **Stateless**
- **Scaffold**
- **SafeArea**
- **Column, Row**
- **Expanded**
- **FutureBuilder**
- **ListView**
#### Service
- **HTTP**
- **Query**

## FrontEnd - Memory Status App
![image](https://user-images.githubusercontent.com/51515055/98828427-6b050300-247b-11eb-9dde-e326108982bf.png)

## BackEnd - Python ( Flask )
`GET` - `http://192.168.1.8:8888/danawa/products/memory`  

`Response Data - 200`

```
[
    {
        "product_type": "memory",
        "product_name": "\uc0bc\uc131\uc804\uc790 DDR4-2666 (4GB)",
        "product_value": "19,030",
        "product_unit": "4,525\uc6d0/1GB",
        "product_img": "http://img.danawa.com/prod_img/500000/268/380/img/6380268_1.jpg?shrink=500:500&_v=20200821132850"
    },
    {
        "product_type": "memory",
        "product_name": "\uc0bc\uc131\uc804\uc790 DDR4-2666 (8GB)",
        "product_value": "30,560",
        "product_unit": "3,820\uc6d0/1GB",
        "product_img": "http://img.danawa.com/prod_img/500000/666/937/img/5937666_1.jpg?shrink=500:500&_v=20200821132850"
    },
    {
        "product_type": "memory",
        "product_name": "\uc0bc\uc131\uc804\uc790 DDR4-2666 (16GB)",
        "product_value": "53,750",
        "product_unit": "3,338\uc6d0/1GB",
        "product_img": "http://img.danawa.com/prod_img/500000/995/941/img/5941995_1.jpg?shrink=500:500&_v=20200821132850"
    },
    {
        "product_type": "memory",
        "product_name": "\uc0bc\uc131\uc804\uc790 DDR4-2666 (32GB)",
        "product_value": "119,370",
        "product_unit": "3,506\uc6d0/1GB",
        "product_img": "http://img.danawa.com/prod_img/500000/391/239/img/9239391_1.jpg?shrink=500:500&_v=20200821132736"
    }
]

```
