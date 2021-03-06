<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/functions.tld" prefix="my"%>
<html>
<head>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-2.1.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

<style type="text/css">
#left { 
	float: left; 
	width: 17%; 
}

 ul {
	list-style-type:none;
}


 li > a { 
	text-decoration:none; 
	color: black;
}


.mw_layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%
}

.mw_layer.open {
	display: block;
}

.mw_layer .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50)
}

#layer {
	position: absolute;
	top: 20px;
	left: 100px;
	width: 1100px;
	height: 600px;
	margin: 0 0;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	font-family: Tahoma, Geneva, sans-serif;
	color: #767676;
	line-height: normal;
	white-space: normal
}


.bLike {
	 border:none;
	 background-color: white;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
	 font-size: 10pt;
	 font-weight: bold;
	 color: #7f7f7f;
 }
 
 .bLikeCancel {
 	 border:none;
	 background-color: white;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
	 font-size: 10pt;
	 font-weight: bold;
	 color: #5890ff;
 }
 
 .replyBtn {
  	 border:none;
	 background-color: white;
	 border-right:0px; 
	 border-top:0px; 
	 boder-left:0px; 
	 boder-bottom:0px;
 }
 
 table {
 	background:white; 
 	width: 100%; 
 	height: 10px; 
 	-webkit-border-radius: 1px; 
 	padding:0.5em;
 }
 
 .btn_board_edit {
 	 border: none;
	 background-color: #F7F4F4;
 }

 .btn_board_delete {
 	 border: none;
	 background-color: #F7F4F4;
 }
 
 .btn_board_reply {
  /* 	border: none;
	background-color: #f6f7f8;
	border-color: #cccccc #c5c6c8 #b6b7b9; */
	
	background: #4e69a2;
    color: white;
    font-size: 12px;
    padding: 3px 11px 4px 11px;
    border: solid #1f628d 1px;
    text-decoration: none;
    text-align: center;
 }
 
.board-item-delete {
 	border: none;
	 background-color: #F7F4F4;
}

#right { 
	width: 15%; 
	border-left: 1px solid #B6B9C1;
	right:0px; 
	height:620px; 
	display: inline-block; 
	position:fixed;
}
</style>
<script type="text/javascript">
function openContent(board_num) {
    $('.mw_layer').addClass('open');
    // $('#layer').html(board_num);
    $.ajax({
       type : "GET",
       url : "detail",
       data : ({board_num : board_num}),
       success : function(data) {
          $('#layer').html(data);
       }
    });
 };

 jQuery(function($) {

    var layerWindow = $('.mw_layer');
    // ESC Event
    $(document).keydown(function(event) {
       if (event.keyCode != 27)
          return true;

       if (layerWindow.hasClass('open')) {
          layerWindow.removeClass('open');
       }
       return false;
    });
    // Hide Window

    layerWindow.find('>.bg').mousedown(function(event) {
       var myVideo = document.getElementById("videos");
       if (!$("#videos:empty")) {
           if ($("#videos").paused) {
        	   myVideo.play();
           } else {
        	   myVideo.stop();
           }
        }
       layerWindow.removeClass('open');
       
       return false;
    });
 });
</script>
</head>
<body>

<div id="left">
	<div style="margin: 10px;">
		<ul >
			<li style="margin: 10px;"><a href="profilePage" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15"> 프로필</a></li>
			<li style="margin: 10px;" ><a href="profile?num=${sessionScope.loginUser.m_num}" ><img alt="" src="resources/img/profile_icon.png" width="13" height="15"> 타임라인</a></li>
			<li style="margin: 10px;"><a href="main" ><img alt="" src="resources/img/newsfeed_icon.png" width="13" height="15"> 뉴스피드</li>
			<li style="margin: 10px;"><a href="profile?num=${sessionScope.loginUser.m_num}#info-3" ><img alt="" src="resources/img/friend_icon.png" width="13" height="15"> 친구</li>
			<li style="margin: 10px;"><a href="logout"><img alt="" src="resources/img/setting.png" width="18" height="18">로그아웃</a></li>
		</ul>
	</div>
</div>
<c:forEach var="board" items="${detail2}">

	<div class="board_item_container" style="width:40%;  padding: 1px; background-color: white; -webkit-border-radius: 0px; margin-left: auto; margin-right:auto; display: inline-block; margin-top: 10px;">
		<!-- ======  select 해서 보이는 DIV ========= -->
		<table>
			<tr width="500" height="50">
				<!-- =================== 프로필 사진 ====================== -->
				<td width="45">
					<a href="profile?num=${board.m_num}">
						<c:if test="${board.memberPicture eq null }">
							<img alt="" src="resources/img/noimg.jpg" width="40" height="40" style="margin: 10px;">
						</c:if>
						<c:if test="${board.memberPicture ne null }">
							<img alt="" src="resources/member_profile/${board.memberPicture }" width="40" height="40" style="margin: 10px;">
						</c:if>
					</a>
				</td>
				
				<td>
					<div style="width: 460; height: 20px; ">
						<a href="profile?num=${board.m_num}">${board.writer_name }</a>
						<div style="float: right">
							<!-- ======= 수정/삭제 버튼 ======= -->
							<c:if test="${sessionScope.loginUser.m_num == board.m_num }">
								<button class="btn_board_edit" board_num="${board.board_num }">수정</button>
								<button class="btn_board_delete" board_num="${board.board_num }">삭제</button>
							</c:if>
						</div>
					</div>

					<div style="display: inline-block; width:65px; height: 20px; font-size:9pt; color: #9197a3; "> ${board.reg_date }</div>
					<div style="display: inline-block; height: 20px; ">
						<c:choose>
							<c:when test="${board.open_level==0}">
								<span style="font-size:9pt; color: #9197a3;">· 전체공개</span>
							</c:when>
							<c:when test="${board.open_level==1}">
								<span style="font-size:9pt; color: #9197a3;">· 친구공개</span>
							</c:when>
							<c:when test="${board.open_level==2}">
								<span style="font-size:9pt; color: #9197a3;">· 나만보기</span>
							</c:when>
						</c:choose>
					</div>
				</td>
			</tr>
			
			<tr width="500" >
				<c:if test="${board.picture!='picture'}">
					<td colspan="2" style="padding: 5px;">
					<a style="cursor: pointer;" href="#layer" onclick="openContent('${board.board_num}')">
					<img name="image" src="${pageContext.request.contextPath}/resources/upload/${board.picture}" style="width: 400px; height: 350px; margin-left: auto; margin-right: auto;"></a></td>
				</c:if>
				<c:if test="${board.video!='video'}">
					<td colspan="2" style="padding: 5px;">
						<a style="cursor: pointer;" href="#layer" onclick="openContent('${board.board_num}')">
							<video src="${pageContext.request.contextPath}/resources/upload/${board.video }" name="video" width="400px" height="300px;" controls="controls">
						</a>
					</td>
				</c:if>
			</tr>
			
			<tr >
				<c:set var="content" value="${board.content }" />

				<!-- ==========  SUBSTRING HASHTAG ========== -->
				<%-- <c:set var="split" value="${my:split(content, '[^#[a-zA-Z0-9가-힣_]+\\\s]' )}" /> --%>
				<c:set var="length" value="${fn:length(content) }" /> <%-- length: ${length }<br> --%>
				<c:set var="start" value="${fn:indexOf(content,'#') }" /> <%-- start: ${start }<br> --%>
				
				<c:if test="${start >= 0 }">
					<c:set var="tag" value="${fn:substring(content, start, length) }" /> <%--  tag: ${tag }<br> --%>
					<c:set var="end" value="${fn:indexOf(tag, ' ')}" /> <%-- end: ${end } <br> --%>
					<c:set var="tag2" value="${fn:substring(tag, 1, end) }" /> <%--  tag2: ${tag2 } <br>  --%>
					
					<!-- replaceAll -->
						<c:set var="tag3" value="#${tag2 }" /> <%--  tag2: ${tag2 } <br> --%>
						<%-- <c:set var="replace" value="&lt;a href='?hashtag=${tag2}'&gt;${tag2 }&lt;/a&gt;" /> --%>
						<c:set var="replace" value="<a href='searchyoyo?hashtag=${tag2}'>${tag3 }</a>" />
						<c:set var="content" value="${my:replaceAll(content, tag3 , replace)}" />
						
					<!--  Next SUBSTRING HASHTAG ... -->
					<c:forEach begin="${start }" end="${end+1 }">
						<c:set var="tag" value="${fn:substringAfter(tag, tag2) }" /> 
						<c:set var="length" value="${fn:length(tag) }" />  
						<c:set var="start" value="${fn:indexOf(tag,'#') }" /> 
						<c:if test="${start > 0 }"> 
							<c:set var="tag" value="${fn:substring(tag, start, length) }" /> 
							<c:set var="end" value="${fn:indexOf(tag, ' ')}" /> 
							<c:if test="${end <= 0 }">
								<c:set var="tag2" value="${fn:substring(tag, start, length) }" /> 
							</c:if>
							<c:if test="${end > 0 }">
								<c:set var="tag2" value="${fn:substring(tag, 1, end) }" /> <%-- tag2: ${tag2 } <br> --%>
							</c:if>							
						</c:if>
						<!-- replaceAll -->
							<c:set var="tag3" value="#${tag2 }" /> 
							<%-- <c:set var="replace" value="&lt;a href='?hashtag=${tag2}'&gt;${tag2 }&lt;/a&gt;" /> --%>
							<c:set var="replace" value="<a href='searchyoyo?hashtag=${tag2}'>${tag3 }</a>" />
							<c:set var="content" value="${my:replaceAll(content, tag3 , replace)}" />
					</c:forEach>					
				</c:if>				
								
				<td class="content" board_num="${board.board_num}" colspan="2" style="background-color: #ffffff; width: 500px; padding: 5px;"> ${content }</td>
			</tr>


			
			<!-- ======= 수정 버튼 누르면 보이는 DIV ======= -->
			<tr class="edit" style="">
				<td colspan="2">
					<div class="editDiv" board_num="${board.board_num}"
						style="margin: auto; display: none; background: #F2F2F2;">
						<div class="highlight">
							<span class="test2" board_num="${board.board_num}"></span>				
							<div id="editTextarea" class="highlight" contenteditable="true" board_num="${board.board_num }">${board.content}</div>
						</div>
						<input type='hidden' name="editcontent" id="editcontent"
							board_num="${board.board_num}" />
						<div class="editBtnDiv">
							<div class="edit-cancle" style="float: right;">
								<button id="btn_edit_cancle" board_num="${board.board_num}">수정취소</button>
							</div>
							<div class="edit-Btn" style="float: right;">
								<button id="btn_editComplete" board_num="${board.board_num}">수정완료</button>
							</div>
						</div>
						<select class="openLevel" name="openLevel" board_num="${board.board_num}"
							style="margin-left: 120px; float: right;">
							<option value="0">전체공개</option>
							<option value="1">친구공개</option>
							<option value="2">나만보기</option>
						</select>
					</div>
				</td>
			</tr>


			<!-- =================== 좋아요, 댓글 ===================== -->
			<tr style="height: 30px; ">
				<td colspan="2" style="border-top: 1px solid #e6e6e6;">
					<c:if test="${board.b_like==0 }">
						<!-- 아직 좋아요 하지 않음 -->	
						<button class="bLike" board_num="${board.board_num}" bLikeCount="${board.bLikeCount }">
							<img src='resources/img/notlike.png' width='15' height='15' style='vertical-align: middle;'>
							좋아요 <span style='vertical-align: middle;'>${board.bLikeCount }</span>
						</button>
					</c:if>
					<c:if test="${board.b_like==1 }">
						<!-- 이미 좋아요 함 -->
						<button class="bLikeCancel" board_num="${board.board_num}" bLikeCount="${board.bLikeCount }">
							<img src='resources/img/like.png' width='15' height='15' style='vertical-align: middle;'>
								좋아요 <span style='vertical-align: middle;'>${board.bLikeCount }</span>
						</button>
					</c:if>
					<button class="replyBtn" id="replyBtn${board.board_num }">
						<img src='resources/img/reply.png' width='15' height='15' style='vertical-align: middle; width:15px; height:15px;'>
						<span style="color: #7f7f7f; font-size: 10pt; font-weight: bold;">댓글<font color="blue"> ${fn:length(board.replyList) }</font></span>
					</button>
				</td>
			</tr>
			<script>
			$( "#replyBtn${board.board_num }" ).click(function() {
				 if($("#replyBtn${board.board_num }").attr("open")==null){
				 	 $( ".reply_list_container${board.board_num }" ).show( "slow" );
				 	$( "#replyBtn${board.board_num }" ).attr("open","open");
				 }else if($( "#replyBtn${board.board_num }" ).attr("open")=="open"){
					 $( ".reply_list_container${board.board_num }" ).hide( "slow" );
					 $( "#replyBtn${board.board_num }" ).attr("open",null);
				 }
				});
			</script>
			<!-- =================== 댓글 목록 ===================== -->
			<tr>
				<td colspan="2">
					<form action="replyinsert" method="post" id="reply_form">
						<input type="hidden" value="${board.board_num }" name="board_num" id="board_num">
						<input type="hidden" value="${board.m_num }" name="w_m_num" id="m_num2">
						
						<div style="background-color: #E1E3E4; border-bottom: 1px solid #D2D6DA;">
							<c:if test="${sessionScope.loginUser.picture eq null}">
								<img alt="" src="resources/img/noimg.jpg" width="38" height="38">
							</c:if>
							<c:if test="${sessionScope.loginUser.picture ne null}">
								<img alt="" src="resources/member_profile/${sessionScope.loginUser.picture}" width="38" height="38">
							</c:if>
							<input type="text" size="40" name="reply" id="reply" style="vertical-align: middle;">
							<input type="submit" value="댓글등록" class="btn_board_reply">
						</div>
						
					</form>
						<div   class="reply_list_container${board.board_num }"
							style="overflow: scroll;  display: none; background-color: #E1E3E4;">
							<c:forEach var="reply" items="${board.replyList}" varStatus="i">
								<div class="reply_item" style="margin: 1px; margin-top: 5px; border-bottom:  1px solid #F1F1F1;">
									<div style="display:inline-block; width: 38px;">
										<c:if test="${reply.r_picture eq null }">
											<img alt="" src="resources/img/noimg.jpg" width="38" height="38">
										</c:if>
										<c:if test="${reply.r_picture ne null }">
											<img alt="" src="resources/member_profile/${reply.r_picture}" width="38" height="38">
										</c:if>
									</div>
									<div style="display:inline-block;  ">
										<a href="profile?num=${reply.m_num }">${reply.r_name}</a>
										${reply.r_date }
										<c:if test="${reply.m_num==sessionScope.loginUser.m_num }">
											<div style=" display: inline-block; ">
												<button id="modi${reply.reply_num}"  class="btn_board_edit">수정</button>
												<input type="button" value="삭제" onclick="removereply(${reply.reply_num })"  class="btn_board_delete">
											</div>
										</c:if>
									</div>
									
									<script type="text/javascript">
										function removereply(num){
											if (confirm("댓글을 정말 삭제하시겠습니까?") == true){    //확인
											    location.href='deletereply?reply_num='+num
											}else{   //취소
											    return;
											}
										}
									</script>
									
									<div style="margin-left: 40px;"> ${reply.r_content} </div>
									<c:set var="i" value="${reply.reply_num}"></c:set>

									<div id="update${reply.reply_num}" style="display: none;">
										<form action="updatereply?reply_num=${reply.reply_num }"
											method="post" id="update_reply_form">
											<img alt="" src="resources/img/noimg.jpg" width="38"
												height="38" style="float: left"><input type="text"
												size="40" name="update_reply" id="update_reply"
												value="${reply.r_content}" style="float: left"><input
												type="hidden" value="${reply.reply_num }"
												name="up_reply_num" id="up_reply_num"><input
												type="hidden" value="${reply.board_num }" name="board_num"
												id="board_num">
										</form>
										<img src="resources/cancel.png"
											id="cancel_update${reply.reply_num}" width="20px"
											height="20px" style="float: left; margin-left: 5px; cursor: pointer;" />
									</div>
									
									<script>
										$("#modi${i}").click(function(){
								       	 	$("#update${i}").show();
								    	});
									
										$("#cancel_update${i}").click(function(){
								       		 $("#update${i}").hide();
								    	});
									</script>
								</div>
							</c:forEach>
						</div></td>
					</div>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>

<div id="right" >
	<%@include file="friendList.jsp" %>
</div>

<div class="mw_layer">
     <div class="bg"></div>
     <div id="layer">
     	<jsp:include page="detail.jsp"></jsp:include>
     </div>
</div>
</body>
</html>