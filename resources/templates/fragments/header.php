<head>
    <link href="../../static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="../../static/img/favicon.png"/>
    <script src="../../static/scripts/jquery-3.1.0.min.js"></script>
    <script src="../../static/scripts/blog-scripts.js"></script>
</head>

<header>
    <div class="container-fluid">
        <img src="../../static/img/HeaderPicture.jpg"/>
    </div>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">

            <!--Logo-->
            <div class="navbar-header">
                <a class="navbar-brand">TEAM SCORCH SIMPLE BLOG</a>
                <!--Collapse Menu Button-->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

<!--            <!--Menu Items-->-->
<!--            <div class="collapse navbar-collapse" id="mainNavBar">-->
<!--                <!--Left Alignment-->-->
<!--                <ul class="nav navbar-nav">-->
<!--                    <li --><?php //?><!--> <!--TODO:: if(is authenticated) {connect with authentication}-->-->
<!--                        <a --><?php //require_once "../user/profile.php"?><!-->-->
<!--                            My Profile-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li --><?php //?><!--> <!--TODO:: if(is authenticated) {connect with authentication}-->-->
<!--                        <a --><?php //require_once "../user/profile.php"?><!-->-->
<!--                            Create Article-->
<!--                        </a>-->
<!--                    </li>-->
<!--                   <li class="dropdown" ><!-- TODO:: if(is authorise is admin -->-->
<!--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">-->
<!--                            Admin<span class="caret"></span>-->
<!--                        </a>-->
<!--<!--                        <ul class="dropdown-menu" role="menu">-->-->
<!--<!--                            <li><a th:href="@{/admin/categories/}"><h4>Categories</h4></a></li>-->-->
<!--<!--                            <li><a th:href="@{/admin/users/}"><h4>Users</h4></a></li>-->-->
<!--<!--                        </ul>-->-->
<!--                    </li>-->
<!--                </ul>-->
<!--                <!--Right Alignment-->-->
<!--                <ul class="nav navbar-nav navbar-right">-->
<!--                    <li --><?php //?><!--> <!--TODO:: if(is NOT authenticated) {connect with authentication}-->-->
<!--                        <a --><?php //require_once "../user/register.php"?><!-->-->
<!--                            REGISTER-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li --><?php //?><!--> <!--TODO:: if(is NOT authenticated) {connect with authentication}-->-->
<!--                        <a --><?php //require_once "../user/login.php"?><!-->-->
<!--                            LOGIN-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li --><?php //?><!--> <!--TODO:: if(is authenticated) {connect with authentication}-->-->
<!--                        <a>-->
<!--                            Logout-->
<!--                        </a>-->
<!--                    </li>-->
<!--                </ul>-->
<!---->
<!--            </div>-->
        </div>
    </nav>

<!--    <ul id="messages" th:with="notifyMessages=${session[T(blog.service-->
<!--          .NotificationServiceImpl).NOTIFY_MSG_SESSION_KEY]}">-->
<!--        <li th:each="msg : ${notifyMessages}"-->
<!--            th:text="${msg.text}"-->
<!--            th:class="${#strings.toLowerCase(msg.type)}">-->
<!--        </li>-->
<!--        <span th:if="${notifyMessages}" th:remove="all" th:text="${session.remove(-->
<!--          T(blog.service.NotificationServiceImpl).NOTIFY_MSG_SESSION_KEY)}"></span>-->
<!--    </ul>-->

</header>