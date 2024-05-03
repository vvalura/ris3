<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body class="container- bg-warning-subtle">

    <header class="bg-warning p-2">
      <h3 class="text-center text-light"> FORUM MANAGEMENT</h3>
    </header>


    <div class="w-25 mx-auto mt-sm-4 mt-md-5 bg-gradient">
      <form id="form" action="index" method="get" class="d-flex ">

        <select name="subscriptionId"
                class="form-select form-select-sm w-25 m-md-3"
                aria-label=".form-select-sm example"
        >
          <option value="">
            <c:out value="Все" />
          </option>

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

        <button  class="btn btn-warning  m-md-3"  type="submit">Выбрать</button>
      </form>

    </div>

    <c:choose>
      <c:when test="${empty users}">
        <h3 class=" w-75 mx-auto mt-sm-4 mt-md-5 ">Мы ничего не нашли :(</h3>
      </c:when>
      <c:otherwise>

        <table class="table table-hover w-75 mx-auto mt-sm-4 mt-md-5">
          <tr border="1px solid black">
            <th>ID</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Возраст</th>
            <th>Тип подписки</th>
            <th></th>
          </tr>
          <c:forEach var="user1" items="${users}">

            <tr border="1px solid black">
              <td><c:out value="${user1.getId()}" /></td>
              <td><c:out value="${user1.getFirstName()}" /></td>
              <td><c:out value="${user1.getLastName()}" /></td>
              <td><c:out value="${user1.getAge()}" /></td>
              <td><c:out value="${user1.getSubscription().getName()}" /></td>
              <td>
                <button  class="btn btn-warning"
                         onclick="window.location.href = '/RIS_Lab3_1-1.0-SNAPSHOT/update?id=${user1.getId()}';" >
                  >
                </button>
              </td>
            </tr>

          </c:forEach>

        </table>

      </c:otherwise>
    </c:choose>

        <div class="w-75 mx-auto mt-sm-8 mt-md-10">
    <button  class="btn btn-warning" onclick="window.location.href = '/RIS_Lab3_1-1.0-SNAPSHOT/update';">
      Создать
    </button>
        </div>
</body>
</html>