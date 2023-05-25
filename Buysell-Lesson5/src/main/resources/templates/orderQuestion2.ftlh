
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
                <a class="nav-link"  href="/">Главная</a>
                <a class="nav-link" href="/order/Buying/view">Заявки на покупку</a>
                <a class="nav-link  active"  aria-current="page" href="/order/Question/view">Заявки "Вопросы"</a>

                <a class="nav-link" href="/manager">Работа с товарами</a>
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

        <h1 style="text-align: center">Работа с заявками "Вопросы"</h1>
        <hr>
        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Имя</th>

                <th>Телефон</th>

                <th>Статус</th>
                <th>Дата</th>


            </tr>
            </thead>

            <tbody>
            <#list orders as order>
                <tr>
                    <td>${order.id}</td>
                    <td>${order.userName}</td>
                    <td>${order.phoneNumber}</td>

                    <td><#--${order.status}-->
                        <form  name = "form-orderBuying" action="/order/Question/changeStatus/${order.id}" method="post">
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
                        </script></td>
                    <td>${order.dateOfCreated}</td>

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

</html>
