<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body class="bg-warning-subtle">

<header class="bg-warning p-2">
    <h3 class="text-center text-light"> FORUM MANAGEMENT</h3>
</header>


<div class="w-50 mx-auto mt-sm-4 mt-md-5">
    <a href="/RIS_Lab3_1-1.0-SNAPSHOT/index" class="link-dark">Назад</a>
</div>

<form  class="w-50 mx-auto mt-sm-4 mt-md-5" id="form" action="update" method="post">

    <c:if test="${not empty param}">
        <div  class="form-group">
            <label>ID</label>
            <input
                    type="number"
                    class="form-control"
                    name="id"
                    value="${user1.getId()}"
                    readonly
            >
        </div>
    </c:if>



    <div class="form-group">
        <label>Имя</label>
        <input type="text"
               name="first"
               class="form-control"
               placeholder="Enter name"
               value="${user1.getFirstName()}"
               required
        >
    </div>

    <div class="form-group">
        <label>Фамилия</label>
        <input type="text"
               name="last"
               class="form-control"
               placeholder="Enter surname"
               value="${user1.getLastName()}"
               required
        >
    </div>

    <div class="form-group">
        <label>Возраст</label>
        <input type="number"
               name="age"
               step="0.01" min="0" value="${user1.getAge()}" required
               class="form-control"
               placeholder="Enter age"
        >
    </div>


    <div class="form-group">
        <label>Выберите тип подписки</label>
        <select name="subscription"
                class="form-select form-select-sm"
                aria-label=".form-select-sm example"
                required
        >
            <c:forEach var="subscription" items="${subscriptions}">
                <option value="${subscription.getId()}"

                        <c:if test="${not empty subscriptionId and subscription.getId() eq subscriptionId}">
                            selected
                        </c:if>
                >
                        <c:out value="${subscription.getName()}" />
                </option>
            </c:forEach>

        </select>

    </div>

    <button type="submit"  class=" mt-sm-4 mt-md-5 btn btn-warning">Сохранить</button>

    <c:if test="${not empty param}">
        <button type="button" class="mt-sm-4 mt-md-5 btn btn-warning"
                onclick="window.location.href = '/RIS_Lab3_1-1.0-SNAPSHOT/delete?id=${user1.getId()}';">
            Удалить
        </button>
    </c:if>



</form>



</body>
</html>
