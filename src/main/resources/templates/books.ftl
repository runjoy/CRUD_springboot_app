<#import "parts/common.ftl" as c>
<@c.page>

<div class="mb-2">Список книг</div>
<div class="mb-5">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">Название</th>
            <th scope="col">Автор</th>
            <th scope="col">Цена</th>
            <th scope="col">Изменить</th>
            <th scope="col">Удалить</th>
        </tr>
        </thead>
        <tbody>
            <#list books as book>
            <tr>
                <td scope="col">${book.id}</td>
                <td scope="col">${book.title}</td>
                <td scope="col">${book.author}</td>
                <td scope="col">${book.price}</td>
                <td scope="col">
                    <form method="POST" action="delete">
                        <input type="hidden" name="id" value="${book.id}"/>
                        <button type="submit" class="btn btn-primary">Изменить</button>
                    </form>
                </td>
                <td scope="col">
                    <form method="POST" action="delete">
                        <input type="hidden" name="id" value="${book.id}"/>
                        <button type="submit" class="btn btn-danger">Удалить</button>
                    </form>
                </td>
            </tr>
            <#else>
            <b>List is empty</b>
            </#list>
        </tbody>
    </table>
</div>


<div class="mb-2">Добавить книгу</div>

<form method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="title">Название:</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="title"  id="title" placeholder="Введите название"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="author">Автор:</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="author" id="author" placeholder="Автор"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="price">Цена:</label>
        <div class="col-sm-6">
            <input type="number" class="form-control" name="price" id="price" placeholder="0,00" step="0.01"/>
        </div>
    </div>
    <button type="submit" class="btn btn-success">Добавить</button>
</form>

</@c.page>