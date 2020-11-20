<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookingking</title> -->
    <script src="<%= request.getContextPath() %>/js/jquery-3.5.1.js"></script>
<style>

    @font-face {
        font-family: 'IBMPlexSansKR-Text';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Text.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }
        .public-footer{
        top: 74em;
        }
    .index-wrapper{
    	position: relative;
    	top: 2em;
        width: 98em;
        height: 42em;
        background-color: #f6faff;  
         /* border: 1px solid turquoise;   */
        text-align: center;
        z-index: -999;
       /*  border: 2px solid red; */
        }
    .flipping-section{
        height: 4em;
        top: -3.4em;
        position: absolute;
        letter-spacing: 1px;
  /*       margin-top: 62m; */
        /* border: 1px solid yellowgreen; */
        width: 32.6em;
        font-size: 3em;
        color: #3B4654;  
        text-align: center;
        vertical-align: center;
        text-transform: uppercase;
        font-weight: bold;
    }
    #flip {
    margin-top: 4em;
        text-align: center;
/*         border: 1px solid violet; */
        height: 2em;
        overflow: hidden;
    }

    #flip > div > div {
        padding: 4px 12px;
        height: 45px;
        margin-bottom: 45px;
        display:inline-block;
        }

    #flip div:first-child {
        animation: show 13s linear infinite;
    }
    @keyframes show{
        0% {margin-top:-450px;}
        2% {margin-top:-360px;}
        20% {margin-top:-360px;}
        22% {margin-top:-270px;}
        40% {margin-top:-270px;}
        42% {margin-top:-180px;}
        60% {margin-top:-180px;}
        62% {margin-top:-90px;}
        80% {margin-top:-90px;}
        82% {margin-top:0px;}
        98%{margin-top:0px;}
        100% {margin-top:-450px;}
    }
     .logo-title{
            text-transform: uppercase;
            font-weight: bold;
            font-size: 1.2em;
        }
        .cat-images{
        margin-top: 1em;
		margin-left: 3em;
        }
        .cat-i{
/*             border: 1px solid yellow; */
            position: relative;
            position: inline-block;
            width: 100%;
            height: 100%;
            border-radius: 3rem;
		/* z-index: -999; */
          /*   z-index: 998; */
        }
        /* [class^="c-info"]{
            width: 15vw;
            height: 10vh;
            border-radius: 0px 0px 12px 12px;
            color: white;
            border: 1px solid cyan; 
        } */
        .cat-info > div > p{
            text-transform: uppercase;
            font-weight: bold;
            font-size: 1.2em;
            color: black;
            letter-spacing: 1px;
        }
         [class^="ci"]{
             border: 1.3em solid #f6faff;
             width: 19.4em;
            height: 24.6em;
            float: left;
            margin-right: 1.2em;
            margin-top: 280px;
            border-radius: 3rem;
           	box-shadow: 0.5rem 0.5rem 0.5rem #BCC6D2,
		-0.5rem -0.5rem 0.5rem rgba(244, 249, 255, 0.726);
        transition: linear .2s;
       /*   z-index: -999;  */
        
       /*  z-index: -999; */
        } 
        
        [class^="ci"]:hover{
        box-shadow: 1rem 1rem 1rem #BCC6D2, -1rem -1rem 1rem #F6FAFF;
    	/* background: rgb(236, 244, 255); */
    	transition: linear .2s;
    	margin-top: 20em;
        }
         [class^="ci"] > a {
            font-family: 'Inter var', sans-serif;
            letter-spacing: 1px;
            font-size: 1em;
            text-transform: uppercase;
            font-weight: bold;
         /*    z-index: -; */
        } 
/* 	p{


	} */
	#indp{
	font-family: 'IBMPlexSansKR-Regular';
	font-size: 1.6em;
	font-weight: bold;
	
	}
</style>
<body>
    <section class="index-wrapper">
        <div class="flipping-section">
            <div id="flip">
                <!-- 캐치프레이즈 결정되고 나면 각 이름들은 대체할 것. -->
                <div><div>오늘의 꿈나무가 내일의 요리왕!</div></div>
                <div><div>4가지 분야로 나도 이젠 요리 전문가</div></div>
                <div><div>참신한 레시피와 색다른 요리를 내 손으로</div></div>
                <div><div>가볍게 즐기는 오늘의 일일 클래스</div></div>
                <div><div>평생의 요리 인생을 바꿀 오늘 하루</div></div>
            </div>
            <div class="fixed">
                cooking-king
            </div>
            </div>
             <div class="cat-images">
                <div class="ci1">
                    <a href=""><img src="<%= request.getContextPath() %>/images/index/idx1.png" alt="" class="cat-i" id="cat-img1"></a>
               <br></br>
                <p id="indp">MAIN DISH</p>
                </div>
                <div class="ci2">
                    <a href=""><img src="<%= request.getContextPath() %>/images/index/idx4.jpg" alt="" class="cat-i" id="cat-img4"></a>
				<br></br>
                <p id="indp">DESSERT</p>
                </div>
                <div class="ci3">
                    <a href=""><img src="<%= request.getContextPath() %>/images/index/idx3.jpg" alt="" class="cat-i" id="cat-img3"></a>
				<br></br>
                <p id="indp">DRINKS</p>
                </div>
                <div class="ci4">
                    <a href=""><img src="<%= request.getContextPath() %>/images/index/idx2.jpg" alt="" class="cat-i" id="cat-img2"></a>
               <br></br>
                <p id="indp">LIQUORS</p>
                </div>
            </div> 
            </section>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>