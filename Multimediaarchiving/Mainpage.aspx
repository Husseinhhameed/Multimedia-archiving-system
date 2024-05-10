<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mainpage.aspx.cs" Inherits="Multimediaarchiving.Mainpage" %>

<!DOCTYPE html>


<head>
 
    <title>الصفحة الرئيسية</title>
    <!-- Preloader -->
    <style>
        @keyframes hidePreloader {
            0% {
                width: 100%;
                height: 100%;
            }

            100% {
                width: 0;
                height: 0;
            }
        }

        body>div.preloader {
            position: fixed;
            background: white;
            width: 100%;
            height: 100%;
            z-index: 1071;
            opacity: 0;
            transition: opacity .5s ease;
            overflow: hidden;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        body:not(.loaded)>div.preloader {
            opacity: 1;
        }

        body:not(.loaded) {
            overflow: hidden;
        }

        body.loaded>div.preloader {
            animation: hidePreloader .5s linear .5s forwards;
        }
    </style>
    <script>
        window.addEventListener("load", function() {
            setTimeout(function() {
                document.querySelector('body').classList.add('loaded');
            }, 300);
        });
    </script>
    <!-- Favicon -->
<%--    <link rel="icon" href="Images/favicon.png" type="image/png"><!-- Font Awesome -->--%>

    <link rel="stylesheet" href="assets/libs/@fortawesome/fontawesome-free/css/all.min.css">
    <!-- Quick CSS -->
    <link href="Css/mainpage.css" rel="stylesheet" />
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="spinner-border text-primary" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" id="modal-cookies" data-backdrop="false" aria-labelledby="modal-cookies" aria-hidden="true">
        <div class="modal-dialog modal-dialog-aside left-4 right-4 bottom-4">
            <div class="modal-content bg-dark-dark">
                <div class="modal-body">
                    <!-- Text -->
                    <p class="text-sm text-white mb-3">
                        We use cookies so that our themes work for you. By using our website, you agree to our use of cookies.
                    </p>
                    <!-- Buttons -->
<%--                    <a href="" class="btn btn-sm btn-white" target="_blank">Learn more</a>--%>
                    <button type="button" class="btn btn-sm btn-primary mr-2" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Go Pro -->
   
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">
            <!-- Brand -->
            <a class="navbar-brand" href="index.html">
                <img alt="Image placeholder" src="Images/logo.png" id="navbar-logo">
            </a>

            <!-- Toggler -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mt-4 mt-lg-0 ml-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="logs.aspx">راقب</a>
                    </li>
                    <li class="nav-item dropdown dropdown-animate" data-toggle="hover">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">الادارة</a>
                        <div class="dropdown-menu dropdown-menu-single">
                            <a href="managetypes.aspx" class="dropdown-item">الأصـناف</a>
                            <a href="manageusers.aspx" class="dropdown-item">فريق العمل</a>
                            <a href="repos.aspx" class="dropdown-item">تقارير الأداء</a>
                         <%--   <div class="dropdown-divider"></div>
                            <a href="login.html" class="dropdown-item">Login</a>--%>
                        </div>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="Login.aspx">تسجيل الخروج</a>

                    </li>
                </ul>
                <!-- Button -->
               
                <!-- Mobile button -->
                <div class="d-lg-none text-center">
                    <a href="https://webpixels.io/themes/quick-website-ui-kit" class="btn btn-block btn-sm btn-warning">See more details</a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Main content -->
    <section class="slice py-7">
        <div class="container">
            <div class="row row-grid align-items-center">
                <div class="col-12 col-md-5 col-lg-6 order-md-2 text-center">
                    <!-- Image -->
                    <figure class="w-100">
                        <img alt="Image placeholder" src="Images/mainimg.png" class="img-fluid mw-md-120">
                    </figure>

                </div>
                <div class="col-12 col-md-7 col-lg-6 order-md-1 pr-md-5">
                    <!-- Heading -->
                    <h1 class="display-4 text-center text-md-left mb-3">
                       أرشيف الوسائط المتعددة 
<%--                        <br><strong class="text-primary">قسم الأرشفة الالكترونية</strong>--%>
                    </h1>
                    <!-- Text -->
                  <p class="lead text-center text-md-left text-muted">
                       نظام خاص بأرشفة بيانات الوسائط المتعددة لقسم الأرشفة الالكترونية في مكتب رئيس مجلس الوزراء 
                    </p>
                    <!-- Buttons -->
                    <div class="text-center text-md-left mt-5">
                        <a href="/uploading.aspx";" class="btn btn-neutral btn-icon d-none d-lg-inline-block" target="_blank">اضافة وثائق</a>
                       
                        <a href="/Searchbox.aspx" class="btn btn-neutral btn-icon d-none d-lg-inline-block" target="_blank">البحث في الارشيف</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
  <center><div class="footer" style="margin-bottom:10px;" >
  تصميم وتنفيذ : قسم الاتصالات وتقنية المعلومات -مكتب رئيس مجلس الوزراء 2023
</div>  </center>
           

</body>

