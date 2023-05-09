<!DOCTYPE html>
<html>
<head>

</head>
<body>
<h1>Панель администратора</h1>

<table>
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Модробная информация</th>

    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th>+1111111</th>
            <th>
                <#if user.active>
                    true
                <#else > false
                </#if>
            </th>
            <th><#list user.roles as role>  ${role} <#sep>, </#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">

                    <input type="submit" value="Бан">
                </form>
            </th>
            <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
            <th>Подробная информация</th>

        </tr>
        <#else >
        Пользователей нет
    </#list>
</table>

<hr>
<h3>Создать нового пользователя</h3>

</body>
</html>