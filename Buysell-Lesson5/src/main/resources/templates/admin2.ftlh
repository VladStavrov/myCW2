<#import "blocks/template.ftlh" as t>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <#-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
 -->
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
                <a class="nav-link" href="/manager">Работа с товарами</a>
                <a class="nav-link active"  aria-current="page" href="/admin">Работа с пользователями</a>
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
    <h1 style="text-align: center">Меню "Администратор"</h1>
    <hr>
    <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th>Id</th>
            <th>Имя</th>

            <th>Телефон</th>

            <th>Роль</th>
            <th>Активность</th>
            <th>Редактирование</th>


        </tr>
        </thead>

        <tbody>
        <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.phoneNumber}</td>

                <td>
                    <#if user.id==currentUser.id>

                        Администратор
                    <#else >
                        <form  name = "form-userChangeRole" action="/admin/edit/role/${user.id}" method="post">
                            <select id="role" required name="role" class="form-control" onchange="submitForm(this.form)">
                                <#if user.isAdmin()>
                                    <option value="ROLE_USER" >Пользователь</option>
                                    <option value="ROLE_MANAGER" >Менеджер</option>
                                    <option value="ROLE_ADMIN" selected>Администратор</option>

                                <#elseif user.isManager()>
                                    <option value="ROLE_USER" >Пользователь</option>
                                    <option value="ROLE_MANAGER" selected>Менеджер</option>
                                    <option value="ROLE_ADMIN" >Администратор</option>

                                <#else>

                                    <option value="ROLE_USER" selected>Пользователь</option>
                                    <option value="ROLE_MANAGER" >Менеджер</option>
                                    <option value="ROLE_ADMIN" >Администратор</option>
                                </#if>

                            </select>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>
                    </#if>

                </td>
                <td>

                    <#if user.id==currentUser.id>
                        Доступ разрешен
                    <#else >
                        <form  name = "form-userChangeBan" action="/admin/user/ban/${user.id}" method="post">
                            <select id="banUser" required name="banUser" class="form-control" onchange="submitForm(this.form)">
                                <#if user.active>

                                    <option value="True" selected >Доступ разрешен</option>
                                    <option value="False" >Забанен</option>




                                <#else>
                                    <option value="True" >Доступ разрешен</option>
                                    <option value="False" selected >Забанен</option>

                                </#if>

                            </select>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                        </form>

                    </#if>

                </td>
                <td>

                    <a class="btn btn-dark mt-3 mb-3 button_sign catalogView " style="text-align: center; width: 100%; margin: 0 ; padding-top: 10px"
                       data-toggle="collapse" href="#editUser${user.id}" role="button"
                       aria-expanded="true" aria-controls="editUser${user.id}">
                        Редактировать
                    </a>
                    <div class="container mt-4">

                        <div class="collapse mb-3" id="editUser${user.id}" style="">
                            <form action="/admin/edit/${user.id}" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="name">Имя</label>
                                    <input type="text" value="${user.name}" required class="form-control"
                                           id="name" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber">Номер телефона</label>
                                    <input type="text" value="${user.phoneNumber}" required class="form-control"
                                           id="phoneNumber" name="phoneNumber">
                                </div>
                                <div class="form-group">
                                    <label for="password">Пароль</label>
                                    <input type="text"  class="form-control" value=""
                                           id="password" name="password" placeholder="Введите новый пароль">
                                </div>






                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                                <button type="submit" style="width: 100%" class="btn btn-dark">Сохранить</button>


                            </form>
                            <#--<form action="/admin/delete/${user.id}" method="post" >
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" style="width: 100%; color: darkred"  class="btn btn-dark">Удалить</button>

                            </form>-->
                        </div>
                    </div>
                </td>
            </tr>
        </#list>



        </tbody>
    </table>
</div>

</body>
<style>
    .exportExcel{
        padding: 5px;
        border: 1px solid grey;
        margin: 5px;
        cursor: pointer;
    }</style>
<script>$(document).ready(function() {
        var table = $('#example').DataTable({
            language: {
                "decimal":        "",
                "emptyTable":     "Нет данных для отображения",
                "info":           "Показано с _START_ по _END_ из _TOTAL_ записей",
                "infoEmpty":      "Показано 0 из 0 записей",
                "infoFiltered":   "(отфильтровано из _MAX_ записей)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Показать _MENU_ записей",
                "loadingRecords": "Загрузка...",
                "processing":     "Выполнение...",
                "search":         "Найти:",
                "zeroRecords":    "Ничего не найдено",
                "paginate": {
                    "first":      "Первая",
                    "last":       "Последняя",
                    "next":       "Следующая",
                    "previous":   "Предыдущая"
                },
                "aria": {
                    "sortAscending":  ": активировать для сортировки столбца по возрастанию",
                    "sortDescending": ": активировать для сортировки столбца по убыванию"
                }
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excel',
                    text: 'Export excel',
                    className: 'exportExcel',
                    filename: 'Export excel',
                    exportOptions: {
                        modifier: {
                            page: 'all'
                        }
                    }
                },
                {
                    extend: 'copy',
                    text: '<u>C</u>opie presse papier',
                    className: 'exportExcel',
                    key: {
                        key: 'c',
                        altKey: true
                    }
                },
                {
                    text: 'Alert Js',
                    className: 'exportExcel',
                    action: function(e, dt, node, config) {
                        alert('Activated!');
                        // console.log(table);

                        // new $.fn.dataTable.Buttons(table, {
                        //   buttons: [{
                        //     text: 'gfdsgfsd',
                        //     action: function(e, dt, node, config) {
                        //       alert('ok!');
                        //     }
                        //   }]
                        // });
                    }
                }]
        });

    });</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script>
    function submitForm(form) {

        form.submit();
    }
</script>

<#--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</html>
