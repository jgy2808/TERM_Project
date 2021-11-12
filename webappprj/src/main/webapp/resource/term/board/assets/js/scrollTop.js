$(window).scroll(function () {
    if ($(this).scrollTop() > 5) {
        $('#back-to-top').fadeIn();
    } else {
        $('#back-to-top').fadeOut();
    }
});

// scroll body to 0px on click
$('#back-to-top').click(function () {
    $('#back-to-top').tooltip('hide');
    $('body,html').animate({
        scrollTop: 0
    }, 800);
    return false;
});

$('#back-to-top').tooltip('show');

<!--https://crontab.tistory.com/entry/top-%EB%B2%84%ED%8A%BC-button-Bootstarp-%EB%B6%80%ED%8A%B8%EC%8A%A4%ED%8A%B8%EB%9E%A9-->