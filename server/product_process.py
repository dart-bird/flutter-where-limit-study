def parse_memory(requests, headers, PRODUCTS, product_id, BeautifulSoup):
    data = []
    for i in range(len(PRODUCTS["memory"])):
        link_name = "ddr4_2666_" + str(2 ** (i + 2))
        response = requests.get(PRODUCTS[product_id][link_name], headers=headers).text
        soup = BeautifulSoup(response, "html.parser")
        product_name = soup.find("h3", {"class": "prod_tit"}).text
        product_value = soup.find("em", {"class": "prc_c"}).text
        product_value_units = soup.findAll("span", {"class": "unit"})
        product_value_unit = product_value_units[len(PRODUCTS["memory"]) - (i + 1)].text
        product_img = soup.find("img", {"id": "baseImage"})["src"]
        data.append(
            {
                "product_type": product_id,
                "product_name": product_name,
                "product_value": product_value,
                "product_unit": product_value_unit,
                "product_img": product_img,
            }
        )
    return data
