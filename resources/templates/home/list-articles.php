<main xmlns:th="http://www.w3.org/1999/xhtml">
    <div class="container body-content">
        <h1>Category - <th:block th:text="${category.name}"></th:block></h1>
        <div class="row">
            <th:block th:each="article : ${articles}">
                <div class="col-md-6">
                    <article>
                        <header>
                            <h2 th:text="${article.title}"></h2>
                        </header>

                        <p th:text="${article.summary}"></p>

                        <small class="author" th:text="${article.author.fullName}"></small>

                        <p>
                            <th:block th:if="${article.tags.isEmpty()==false}">
                                <a class="btn btn-default btn-xs" th:each="tag:${article.tags}" th:href="@{/tag/{name}(name=${tag.name})}" th:text="${tag.name}"></a>
                            </th:block>
                        </p>

                        <footer>
                            <div class="pull-right">
                                <a class="btn btn-default btn-xs"
                                   th:href="@{/article/{id}(id=${article.id})}">Read more &raquo;</a>
                            </div>
                        </footer>
                    </article>
                </div>
            </th:block>
        </div>
    </div>
</main>