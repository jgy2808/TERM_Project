<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>new_board_detail</title>
    <link rel="stylesheet" href="../../resource/term/detail/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="../../resource/term/detail/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../resource/term/detail/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="../../resource/term/detail/assets/css/Header-Blue.css">
    <link rel="stylesheet" href="../../resource/term/detail/assets/css/styles.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <header class="header-blue" style="background: rgb(92,198,186);height: 72.594px;">
        <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
            <div class="container-fluid"><a href="/board_main"><i class="fa fa-chevron-left" style="width: 30px;height: 30px;font-size: 24px;color: rgb(255,255,255);"></i></a> <a class="navbar-brand" href="#">분리똑똑</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-1" style="background: rgb(92,198,186);">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#">검색</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">지도</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">친환경 홍보</a></li>
                        <li class="nav-item"><a class="nav-link" href="#" style="color: rgba(255,255,255,0.55);">알림 설정</a></li>
                        <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">게시판</a>
                            <div class="dropdown-menu"><a class="dropdown-item" href="#">정보 게시판</a><a class="dropdown-item" href="#">나눔 게시판</a></div>
                        </li>
                    </ul>
                    <form class="d-flex me-auto navbar-form" target="_self">
                        <div class="d-flex align-items-center"><label class="form-label d-flex mb-0" for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" id="search-field" name="search"></div>
                    </form><span class="navbar-text"> <a class="login" href="#">Log In</a></span><a class="btn btn-light action-button" role="button" href="#">Sign Up</a>
                </div>
            </div>
        </nav>
        <div class="container hero">
            <div class="row">
                <div class="col-md-5 col-lg-5 offset-lg-1 offset-xl-0 d-none d-lg-block phone-holder">
                    <div class="phone-mockup"></div>
                </div>
            </div>
        </div>
    </header>
    <div><script type="text/javascript" src="scrollTop.js"></script>
<div id="boardDetail" >
    <div style="width:100%;text-align:center;">
        <h2> ${list.get(MAX - showNum).board_title} </h2>
    </div>
    <hr>
    <div style="width:100%;text-align:center;">
        <t> ${list.get(MAX - showNum).board_contents} </t>
    </div>
    <div id="disqus_thread"></div>
<script>
    /**
    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
    
    var disqus_config = function () {
    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://bdd-2.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>

</div></div>
<script id="dsq-count-scr" src="//bdd-2.disqus.com/count.js" async></script> 

    <script src="../../resource/term/detail/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>