// JavaScript Document
$(function () {

    var url = window.location.href;
    if (url.indexOf("jdzd.ywk4.cn") > -1) {
        $(".c1").hide();
        $(".c2").show();
    }

    $(".sec1_pv a").click(function () {
        $("#video").fadeIn(100);
        // $("#video .video_box").append('<video src="http://static.jd.gameduchy.com/static/ironsaga0623.mp4" width="50%" controls id="gameduchy"></video><div class="video_close"></div>');
        $("#video .video_box").append('<video src="http://website-jdzd.oss-cn-hangzhou.aliyuncs.com/jdzd_linkage/pc/static/images/1.mp4" width="50%" controls id="gameduchy"></video><div class="video_close"></div>');
        document.getElementById("gameduchy").play();
        var video_w = $("#video .video_box video").width();
        var video_h = video_w / (16 / 9);
        $("#video .video_close").css({ marginRight: -video_w / 2, marginTop: -video_h / 2 });
    });

    $(".video_bg").click(function () {
        $("#video").fadeOut(100);
        $("#video video").remove();
    });
    $('#video').on('click', '.video_close', function () {
        $("#video").fadeOut(100);
        $("#video video").remove();
    });


    $('#box').fullpage({
        normalScrollElements: '#zz_sl',
        anchors: ['page1', 'page2', 'page3', 'page4', 'page5', 'page6'],
        navigation: false,
        verticalCentered: false,
        resize: true,
        menu: '#menu',
        afterLoad: function (origin, destination, direction) {
            //section 2
            if ($(window).width() < 1024) {
                if (destination.index == 1) {
                    $("#menu").fadeOut();
                } else {
                    $("#menu").fadeIn();
                }
            }
            if ($(window).width() < 768) {
                $("#menu").hide();
            }
        }
    });
    var href = $(".download_btn li:eq(1) a").attr("href");
    $(".download_btn li:eq(1) a").attr("href", href + "?v=" + new Date().getTime());


    for (i = 0; i < 9; i++) {
        // $("#sec3 .Pilot .gallery-thumbs .swiper-slide").eq(i).css({"backgroundImage":"url(http://static.jd.gameduchy.com/static/img/index/file/pliots/list/pliots" + (i + 1) + ".png)"});
        $("#sec3 .mech .gallery-thumbs .swiper-slide").eq(i).css({ "backgroundImage": "url(http://static.jd.gameduchy.com/static/img/index/file/mech/list/mech" + (i + 1) + ".png)" });
    }

    $("#sec3 .file_con .mech").css({ "opacity": 0, "zIndex": -1 });
    $("#sec3 .tab .right").addClass("on");
    $("#sec3 .tab .left").removeClass("on");
    $("#sec3 .tab .file_btn").click(function () {
        $(this).addClass("on").siblings().removeClass("on");
        $("#sec3 .file_con .file_list").eq($(this).index()).animate({ "opacity": 1, "zIndex": 50 }).siblings().animate({ "opacity": 0, "zIndex": -1 });
    });

    $("#sec3 .file_con").height(win_h);

    //婢归绱�
    $("#sec3 .swiper-slide .audio img").click(function () {
        $(this).next("audio")[0].play();
        $(this).next("audio").siblings("audio")[0].pause();
        $(this).next("audio").siblings("audio")[0].currentTime = 0;
    });
    //zaxiang
    var win_w = $(window).width();
    var win_h = $(window).height();
    if (win_w / win_h > 16 / 9) {
        $("#sec1 .sec1_bg video").css({ width: "100%", height: "auto" });
        $("#sec2 .sec2_bg video").css({ width: "100%", height: "auto" });
        $("#sec4 .sec3_bg video").css({ width: "100%", height: "auto" });
    } else {
        $("#sec1 .sec1_bg video").css({ height: "100%", width: "auto" });
        $("#sec2 .sec2_bg video").css({ height: "100%", width: "auto" });
        $("#sec4 .sec3_bg video").css({ height: "100%", width: "auto" });
    }

    // if($(window).width()<768){
    // 	$(".sec1_t").attr("src","http://static.ironsaga.co.kr/static/image/sec_t_m.png");
    // 	$("#sec2 .sec2_t img").attr("src","http://static.ironsaga.co.kr/static/image/sec2_t_m.png")
    // 	$("#sec2 .sec2_t a").css({height:$("#sec2 .sec2_t a").width()})
    // }else{
    // 	$(".sec1_t").attr("src","http://static.ironsaga.co.kr/static/image/sec1_t.png");
    // 	$("#sec2 .sec2_t img").attr("src","http://static.ironsaga.co.kr/static/image/sec2_t.png")
    // 	$("#sec2 .sec2_t a").css({height:$("#sec2 .sec2_t a").width(),top:$("#sec2 .sec2_t a").width()/2})
    // }
    $("#sec1 .sec1_pv a").hover(function () {
        $(this).children("img").attr("src", "http://static.ironsaga.co.kr/static/image/sec1_pv_l.png")
    }, function () {
        $(this).children("img").attr("src", "http://static.ironsaga.co.kr/static/image/sec1_pv.png")
    })
    $("#news_con span").eq(0).addClass("time");
});


var PilotgalleryThumbs = new Swiper('.Pilot .gallery-thumbs', {
    slidesPerView: 5,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
});
var PilotgalleryTop = new Swiper('.Pilot .gallery-top', {
    navigation: {
        nextEl: '.js_swiper-button-next',
        prevEl: '.js_swiper-button-prev',
    },
    // on:{
    // 	slideChangeTransitionStart: function() {
    // 		for(i=0;i<10;i++){
    // 			$("#sec3 audio")[i].pause();
    // 			$("#sec3 audio")[i].currentTime = 0;
    // 		}
    // 	}
    // },
    thumbs: {
        swiper: PilotgalleryThumbs
    }
});
var mechgalleryThumbs = new Swiper('.mech .gallery-thumbs', {
    slidesPerView: 5,
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
});
var mechgalleryTop = new Swiper('.mech .gallery-top', {
    navigation: {
        nextEl: '.jj_swiper-button-next',
        prevEl: '.jj_swiper-button-prev',
    },
    thumbs: {
        swiper: mechgalleryThumbs
    }
});
// var sec2_len = 4;
// if($(window).width()<1024){
// 	sec2_len = 2;
// }
// var sec2 = new Swiper('#sec2 .swiper-container', {
// 	initialSlide :4,
// 	slidesPerView: sec2_len,
// 	spaceBetween:19,
// 	navigation: {
// 		nextEl: '#sec2 .swiper-button-next',
// 		prevEl: '#sec2 .swiper-button-prev',	
// 	},
// });

var foot = new Swiper('#foot .swiper-container', {
    initialSlide: 4,
    slidesPerView: 7,
    spaceBetween: 19,
    slidesPerGroup: 1,
    autoplay: true,
    loop: true,
    navigation: {
        nextEl: '.footer_swiper-button-next',
        prevEl: '.footer_swiper-button-prev',
    },
});
$(".news_list_btn a").click(function () {
    $(this).css("background", "#989eca");
    $(this).siblings().css("background", "#000");
});
$(".news_btn").click(function () {
    $(".news_content").css("display", "block");
    $(".news_more").css("display", "block");
    $(".news_content").siblings().css("display", "none");
    $(".news_more").siblings().css("display", "none");
});
$(".notice_btn").click(function () {
    $(".notice_content").css("display", "block");
    $(".notice_more").css("display", "block");
    $(".notice_content").siblings().css("display", "none");
    $(".notice_more").siblings().css("display", "none");
});
$(".actii_btn").click(function () {
    $(".actii_content").css("display", "block");
    $(".actii_more").css("display", "block");
    $(".actii_content").siblings().css("display", "none");
    $(".actii_more").siblings().css("display", "none");
});
$(".sl_16").click(function () {
    $(".zz_sl").show();
})
$(".sl_16_close").click(function () {
    $(".zz_sl").hide();
})

