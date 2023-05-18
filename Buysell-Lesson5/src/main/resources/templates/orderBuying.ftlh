<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</head>
<body>
<div class="wrapper_catalog">
    <div class="full_items_catalog">

        <#list orders as order>
            <div class="block_item_catalog" name="product_id" value="1" data-mainDivProduct-id="${order.product.id}">
                <div class="line"></div>
                <div class="orderBox">
                    <div class="info_block_catalog">
                        <div class="catalog_name_product">Заказ: ${order.id}</div>
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Дата:</div>
                            <div class="catalog_info_text">${order.dateOfCreated}</div>
                        </div>
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Имя:</div>
                            <div class="catalog_info_text">${order.user.name}</div>
                        </div>
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Номер телефона:</div>
                            <div class="catalog_info_text">${order.user.phoneNumber}</div>
                        </div>
                        <div class="catalog_info_product">

                                <div class="parametr_catalog">Статус:</div>
                                <div class="catalog_info_text">
                                    <form  name = "form-orderBuying" action="/order/Buying/changeStatus/${order.id}" method="post">
                                        <select id="status" required name="status" class="form-control" onchange="submitForm(this.form)">
                                            <#if order.status=="В ожидании">

                                                <option value="В ожидании" selected>В ожидании</option>
                                                <option value="В обработке" >В обработке</option>

                                            <#else>
                                                <option value="В ожидании" >В ожидании</option>
                                                <option value="В обработке" selected>В обработке</option>
                                            </#if>




                                        </select>
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    </form>

                                    <script>
                                        function submitForm(form) {

                                            form.submit();
                                        }
                                    </script>
                                </div>


                        </div>



                    </div>
                </div>


                <div class="block_house">

                    <img src="/images/${order.product.previewImageId}" alt="" class="image_catalog">
                    <div class="info_block_catalog">
                        <div class="catalog_name_product">${order.product.title}</div>
                        <div class="catalog_group_info_product">
                            <div class="catalog_info_product">
                                <div class="parametr_catalog">Тип:</div>
                                <div class="catalog_info_text">${order.product.getType().typeName}</div>
                            </div>
                            <div class="catalog_info_product">
                                <div class="parametr_catalog">Адрес:</div>
                                <div class="catalog_info_text">${order.product.address}</div>
                            </div>
                            <div class="catalog_info_product">
                                <div class="parametr_catalog">Жилая площадь:</div>
                                <div class="catalog_info_text">${order.product.livingArea}</div>
                            </div>
                            <div class="catalog_info_product rooms">
                                <div class="parametr_catalog">Комнат:</div>
                                <div class="catalog_info_text">${order.product.rooms}</div>
                            </div>


                        </div>

                        <div class="catalog_price_product">
                            <div class="label_price_catalog">Стоимость:</div>
                            <div class="price_catalog">
                                ${order.product.price}$
                            </div>
                        </div>
                        <div class="catalog_button_view_product">

                            <button  type="submit" class="button_sign catalogView " onclick="window.location.href='/product/${order.product.id}'"  >
                                Посмотреть
                            </button>
                        </div>
                    </div>
                </div>
                <div class="orderBox">
                    <div class="info_block_catalog">

                            <form class="order_btn_product" action="/order/Buying/delete/${order.id}" method="post">
                                <button  type="submit" class="button_sign orderAgree "  >
                                    Подтвердить
                                </button>
                                <button  type="submit" class="button_sign orderDelete "  >
                                    Удалить
                                </button>

                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                            </form>









                    </div>
                </div>
            </div>


        </#list>


        <div class="block_item_catalog">
            <div class="line"></div>
            <div class="block_flatt">

                <img src="img/flatt_catalog.jpg" alt="" class="image_catalog">
                <div class="info_block_catalog">
                    <div class="catalog_name_product">3-х комнатная квартира с выходом в окно</div>
                    <div class="catalog_group_info_product">
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Тип:</div>
                            <div class="catalog_info_text">Квартира</div>
                        </div>
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Адрес:</div>
                            <div class="catalog_info_text">г.Минск</div>
                        </div>
                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Жилая площадь:</div>
                            <div class="catalog_info_text">353м</div>
                        </div>

                        <div class="catalog_info_product">
                            <div class="parametr_catalog">Этаж:</div>
                            <div class="catalog_info_text">8</div>
                            <div class="parametr_catalog">из:</div>
                            <div class="catalog_info_text">8</div>
                        </div>

                    </div>

                    <div class="catalog_price_product">
                        <div class="label_price_catalog">Стоимость:</div>
                        <div class="price_catalog">
                            123456$
                        </div>
                    </div>
                    <div class="catalog_button_view_product">

                        <button  type="submit" class="button_sign catalogView ">
                            Посмотреть
                        </button>
                    </div>
                </div>
                <img src="img/svg/favorite.svg" alt="" class="favorite">
            </div>
        </div>

    </div>






</div>
</body>
</html>
