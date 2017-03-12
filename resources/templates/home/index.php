<aside xmlns:th="http://www.w3.org/1999/xhtml">
    <div class="container col-sm-3 pull-right">
        <div class="panel">
            <div class="panel-heading">
                <h2 class="panel-title"><p>Recent Articles</p></h2>
            </div>
            <div class="panel-body bg-gray text-center">
                <div th:class="list-group">
                    <a href="#" th:each="p : ${latest3articles}" th:text="${p.title}" th:class="list-group-item"
                       th:href="@{/article/{id}/(id=${p.id})}"></a>
                </div>
            </div>
        </div>
    </div>
</aside>
<main xmlns:th="http://www.w3.org/1999/xhtml">
    <div class="container body-content">
        <div class="row">
            <div class="col-md-9" th:each="category : ${categories}">
                <header>
                    <h2>
                        <a th:href="@{/category/{id}(id=${category.id})}" th:text="${category.name + ' (' + #sets.size(category.articles) + ')'}">
                        </a>
                    </h2>
                </header>
            </div>

        </div>
    </div>
</main>
