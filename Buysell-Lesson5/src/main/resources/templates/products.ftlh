
<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>products</title>
    <link rel="stylesheet" href="./css/manager.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">
    <script src="./JS/manager.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Логотип</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link "  href="/">Главная</a>
                <a class="nav-link" href="/order/Buying/view">Заявки на покупку</a>
                <a class="nav-link" href="/order/Question/view">Заявки "Вопросы"</a>

                <a class="nav-link active"  aria-current="page" href="/manager">Работа с товарами</a>
                <#if user.isAdmin()>
                    <a class="nav-link" href="/admin">Работа с пользователями</a>
                </#if>
                <form  id="logoutForm" action="/logout" method="post">
                    <a class="nav-link " onclick="submitForm2(event)" href="#" style="color: darkred"  >Выйти</a>


                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </form>
                <script>
                    function submitForm2(event) {
                        event.preventDefault();
                        document.getElementById('logoutForm').submit();
                    }
                </script>

            </div>
        </div>
    </div>
</nav>
<div class="container mt-4">

        <h1 style="text-align: center">Работа с товарами</h1>
        <hr>
        <a class="btn btn-dark mt-3 mb-3 " style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="true" aria-controls="collapseExample">
            Добавить новый товар
        </a>
        <div class="container mt-4">

            <div class="collapse mb-3" id="collapseExample" style="">
                <form action="/product/create" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="productName">Название товара</label>
                        <input type="text" required class="form-control"
                               id="productName" name="title">
                    </div>

                    <div class="form-group">
                        <label for="price">Цена товара</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="price" name="price">
                            <div class="input-group-append">
                                <span class="input-group-text">$</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="rooms">Комнат</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="rooms" name="rooms">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="floor">Этажей</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="floor" name="floor">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="years">Год строительства</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="years" name="years">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="material">Материал</label>
                        <select id="material" required name="material" class="form-control">
                            <option value="">Материал не выбран</option>
                            <option value="Панельный" >Панельный</option>
                            <option value="Кирпичный" >Кирпичный</option>
                            <option value="Бревенчатый" >Бревенчатый</option>


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="livingArea">Площадь</label>
                        <div class="input-group mb-3">
                            <input type="number" required class="form-control" id="livingArea" name="livingArea">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">Адрес товара</label>
                        <input type="text" required class="form-control"
                               id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="typeName">Тип</label>
                        <select id="typeName" required name="typeName" class="form-control">
                            <option value="">Тип не выбран</option>

                            <option value="Квартира">Квартира</option>
                            <option value="Дом">Дом</option>


                        </select>
                    </div>
                    <div class="form-group">
                        <label for="information">Описание товара</label>
                        <textarea required class="form-control" id="information" name="information"></textarea>
                    </div>

                    <div class="form-group">
                        <div class="custom-file">
                            <div class="imageContainer" >

                            </div>

                            <script>

                            </script>



                        </div>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                    <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
                </form>
            </div>
        </div>
        <main class="main">
            <#if products?size == 0>
                <div class="centered-div">
                    Нет данных для отображения
                </div>
            <#else >
                <selection class="catalog">
                    <div class="wrapper">
                        <div class="wrapper_catalog">
                            <div class="full_items_catalog">
                                <#list products as product>
                                    <div class="block_item_catalog" name="product_id" value="1" >
                                        <div class="line"></div>
                                        <div class="block_house">

                                            <img src="/images/${product.previewImageId}" alt="" class="image_catalog">
                                            <div class="info_block_catalog">
                                                <div class="catalog_name_product">${product.title}</div>
                                                <div class="catalog_group_info_product">
                                                    <div class="catalog_info_product">
                                                        <div class="parametr_catalog">Тип:</div>
                                                        <div class="catalog_info_text">${product.getType().typeName}</div>
                                                    </div>
                                                    <div class="catalog_info_product">
                                                        <div class="parametr_catalog">Адрес:</div>
                                                        <div class="catalog_info_text">${product.address}</div>
                                                    </div>
                                                    <div class="catalog_info_product">
                                                        <div class="parametr_catalog">Жилая площадь:</div>
                                                        <div class="catalog_info_text">${product.livingArea}</div>
                                                    </div>
                                                    <div class="catalog_info_product rooms">
                                                        <div class="parametr_catalog">Комнат:</div>
                                                        <div class="catalog_info_text">${product.rooms}</div>
                                                    </div>



                                                </div>

                                                <div class="catalog_price_product ">
                                                    <div class="label_price_catalog">Стоимость:</div>
                                                    <div class="price_catalog">
                                                        <div class="priceValue">${product.price}</div>
                                                        <div class="money">$</div>

                                                    </div>
                                                </div>
                                                <div class="catalog_price_product ">
                                                    <div class="catalog_button_view_product">
                                                        <a class="btn btn-dark <#--mt-3 mb-3--> button_sign catalogView " style="text-align: center; width: 100%; margin: 0 ; padding-top: 10px"
                                                           data-toggle="collapse" href="#editProduct${product.id}" role="button"
                                                           aria-expanded="true" aria-controls="editProduct${product.id}">
                                                            Редактировать  товар
                                                        </a>

                                                        <#--<button  type="submit" data-id="1231" class="button_sign catalogView " onclick="window.location.href='/product/${product.id}'"  >
                                                            Посмотреть
                                                        </button>-->
                                                    </div>
                                                    <form class="order_btn_product" action="/product/delete/${product.id}" method="post">

                                                        <button  type="submit" class="button_sign orderDelete "  >
                                                            Удалить
                                                        </button>

                                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    </form>









                                                </div>
                                            </div>



                                        </div>
                                    </div>
                                    <div class="container mt-4">

                                        <div class="collapse mb-3" id="editProduct${product.id}" style="">
                                            <form action="/product/edit/${product.id}" method="post" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label for="productName">Название товара</label>
                                                    <input type="text" value="${product.title}" required class="form-control"
                                                           id="productName" name="title">
                                                </div>

                                                <div class="form-group">
                                                    <label for="price">Цена товара</label>
                                                    <div class="input-group mb-3">
                                                        <#--<input type="number" value="${product.price}" onload="removeSpacesOnInit(this)"   required class="form-control" id="price-${product.id}" name="price">
                                                       --> <input type="text" value="${product.price}" required class="form-control" id="price-${product.id}" name="price" oninput="validateNumber(this)" >
                                                        <script>
                                                            document.addEventListener("DOMContentLoaded", function() {
                                                                validateNumber(document.getElementById("price-${product.id}"));
                                                            });
                                                        </script>


                                                        <div class="input-group-append">
                                                            <span class="input-group-text">$</span>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price">Комнат</label>
                                                    <div class="input-group mb-3">
                                                        <input type="number"   value="${product.rooms}" required class="form-control" id="rooms" name="rooms">

                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <label for="livingArea">Площадь</label>
                                                    <div class="input-group mb-3">
                                                        <input type="text"  value="${product.livingArea}" id="area-${product.id}" required  class="form-control"
                                                               name="livingArea" >
                                                        <script>
                                                            document.addEventListener("DOMContentLoaded", function() {
                                                                validateNumber(document.getElementById("area-${product.id}"));
                                                            });
                                                        </script>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Адрес товара</label>
                                                    <input type="text" value="${product.address}"
                                                           required class="form-control"
                                                           id="address" name="address">
                                                </div>
                                                <div class="form-group">
                                                    <label for="typeName">Тип</label>
                                                    <select id="typeName" required name="typeName" class="form-control">
                                                        <option value="">Тип не выбран</option>
                                                        <#if product.type.typeName=="Квартира">
                                                            <option value="Квартира" selected>Квартира</option>
                                                            <option value="Дом">Дом</option>
                                                        <#else>
                                                            <option value="Квартира" >Квартира</option>
                                                            <option value="Дом" selected>Дом</option>
                                                        </#if>




                                                    </select>
                                                </div>
                                                <div class="form-group" >
                                                    <label for="information">Описание товара</label>
                                                    <textarea  required class="form-control" id="information" name="information">${product.information}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <div class="custom-file">
                                                        <div class="imageContainer" >
                                                            <#list product.imageList as image>
                                                                <div class="image-block" name="">

                                                                    <input name="inputNumberImageName" type="number"  value="${image.id}" style="display: none">
                                                                    <input id="${image.id}" onchange=" handleImageUpload(event,this.closest('.imageContainer'),this);    " type="file"   accept="image/*"   name="oldImage" value="${image.name}">

                                                                    <img class="image-Manager" style="display: block;" src="/images/${image.id}">
                                                                    <button onclick="this.closest('.image-block').remove()" style="display: block;">Удалить</button>
                                                                </div>
                                                            </#list >
                                                        </div>





                                                    </div>
                                                </div>

                                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                                <button type="submit" style="width: 100%" class="btn btn-dark">Сохранить</button>
                                            </form>
                                        </div>
                                    </div>

                                </#list>




                            </div>





                            <!-- <div class="line"></div>
                             <button  type="submit" class="button_sign catalogViewMore  " style="align-self: center">
                                 Загрузить ещё
                             </button>-->

                        </div>


                    </div>








                </selection>
            </#if>

        </main>

</div>
<script>

    function changePrice(inputId) {
        const priceInput = document.getElementById(inputId);
        if (priceInput) {
            console.log(inputId + " - Зашло");
            const priceValue = priceInput.value.replace(/\u00A0/g, '');
            priceInput.value = priceValue;
            return priceValue;
        }
        return null;
    }
</script>
<script>

    function removeSpacesOnInit(input) {
        input.value = input.value.replace(/\s/g, '');
    }
    function validateNumber(input) {
        var value = input.value.replace(/\s/g, ''); // Удалить все пробелы
        if (!isNaN(value)) {
            input.value = value;
        } else {
            value.slice(0, -1)
            input.value =  input.value.slice(0, -1);
        }

    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>

