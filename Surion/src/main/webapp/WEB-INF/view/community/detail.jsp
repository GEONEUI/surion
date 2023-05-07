<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>
    body {
        background: #fff !important;
    }

    #my_page_right {
        padding: 35px 30px;
    }

    #navLink a:nth-child($ {
            pageview
        }

    ) {
        color: red !important;
    }

    .subject {
        padding-top: 20px;
        font-weight: bold;
        color: gray;
    }

    h3 {
        padding-top: 20px;
    }

    .loc {
        padding: 10px 0;
    }

    .picture {
        height: 3.5rem;
        background-color: lightgray;
    }

    .insert_title {
        width: 100%;
        padding: 1.25rem 0;
        margin: 0;
        border-color: transparent;
    }

    .option {
        display: flex;
        align-items: center;
        height: 62.97px;
        border: 1px dotted lightgray;
        justify-content: space-around;
    }

    .text {
        color: gray;
        padding-top: 20px;
        border-color: transparent;
        width: 100%;
        height: 300px;
    }

    .form-control {
        text-align: center;
    }

    .form-control option {
        text-align: center;
    }

    .category {
        color: gray;
    }

    .profile {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 45px 0;
    }


    .profile_left {
        display: flex;
    }


    .profile img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .profile_pic {
        width: 50px;
        height: 50px;
    }

    .namedate {
        margin-left: 10px;
    }

    .profile_name {
        font-weight: bold;
    }

    .pic_box {
        padding: 20px 0;
    }

    .pic_box img {

        max-width: 100%;
    }

    .likecomment {
        display: flex;
        align-items: center;
        padding: 10px 0;
    }

    .like {
        margin-right: 30px;
    }

    .comm {
        border: 1px solid lightgray;
        width: 500px;
        height: 70px;
    }

    .gosu_comments {
        padding: 30px;
        display: flex;
    }

    .gosu_profile {}

    .gosu_profile img {
        border-radius: 20%;
    }

    .gosu_nameinfo {
        margin-left: 10px;
    }

    .gosu_name {
        font-weight: bold;
    }

    .gosu_info {
        font-size: 15px;
        color: gray;
    }

    .comm_comment {
        padding: 10px 0;
    }

    .time_before {}

    .little {
        display: flex;
        width: 300px;
        font-size: 13px;
        color: gray;
    }

    textarea[readonly="readonly"] {
        padding: 15px;
        border: none;
    }

    .reply {}

    .reply .replaySave {
        display: flex;
        padding: 10px;
    }

    .reply .replaySave input:first-child {
        padding-left: 15px;
        width: 90%;
        height: 65px;
        border: 1px solid #ccc;
        outline: none;
    }

    .reply .replaySave input:last-child {
        width: 10%;
        border: 1px solid #ccc;
        background: none;
    }

    .reply .replayView .replayList {
        padding: 9px 30px;
        background: #f6f6f6;
        box-shadow: rgba(0, 0, 0, 0.05) 0 1px 2px 0;
        display: flex;
        align-items: center;
    }

    .reply .replayView .replayList p {
        margin-bottom: 5px;
    }

    .reply .replayView .replayList p:nth-child(1) {
        font-weight: bold;
    }

    .reply .replayView .replayList p:nth-child(3) {
        font-size: 14px;
        color: #666;
    }

    .icon {
        margin-right: 15px;
    }

    .icon img {
        border-radius: 12px;
    }

    .replayRemove {
        margin-left: auto;
    }

    .replayImg {
        margin: 70px 0;
    }

    .replayImg img {
        max-width: 500px;
    }
    
    pre{
    	white-space: break-spaces;
    	font-size: 18px;
    }
    

</style>
<!-- <script> //선택한 것 보여주기 function change(){ var values =
   document.getElementById('test').value; document.getElementById('show').value =
   values; } </script> -->

<body>
    <%@ include file="../common/header.jsp"%>
    <div class="suriSize">
        <div class="container">
            <div class="row justify-content-between" style="min-height: 500px;">
                <div class="col-lg-12" id="my_page_right">
                    <!-- 커뮤니티 글 자세히 보기 -->
                    <div class="category">커뮤니티 > ${community.comm_list}</div>
                    <div class="subject">${community.suri_list}</div>
                    <h3>${community.title}</h3>
                    <div class="profile">
                        <div class="profile_left">
                        	<c:if test="${originMember.imgurl eq null}">
                        		<img src="${cpath}/resources/communityImages/default.png" alt="글쓴이 프로필 이미지">
                        	</c:if>
                        	<c:if test="${originMember.imgurl ne null}">
                        		<img src="${cpath}/resources/communityImages/${originMember.imgurl}" alt="글쓴이 프로필 이미지">
                        	</c:if>
                            
                            <div class="namedate">
                                <div class="profile_name">id : ${community.id}</div>
                                <div class="profile_date">CreateAt : ${community.indate}</div>
                            </div>
                        </div>

                        <c:if test="${member.id == community.id}">
                            <div>
                                <input id="idx" type="hidden" name="idx" value="${community.idx}">
                                <button class="btn btn-danger btn-sm" data-btn='update'>수정하기</button>
                                <button class="btn btn-danger btn-sm" data-btn='delete'>삭제하기</button>
                                <button class="btn btn-danger btn-sm" data-btn='list'>목록으로</button>
                            </div>
                        </c:if>
                    </div>
                    <pre class="mb-3" style="width:100%;" readonly="readonly">${community.content}</pre>
                    <div class="replayImg">
                    	<c:if test="${community.img eq ''}">
                    		
                    	</c:if>
                    	<c:if test="${community.img ne ''}">
                    		<img src="${cpath}/resources/communityImages/${community.img}" alt="게시글 이미지">
                    	</c:if>
                    </div>
                    <div class="reply">
                        <div class="replayView"></div>
                        <div class="replaySave">
                            <input type="text" name="context" id="context">
                            <input type="button" value="댓글" onclick="getSave();">
                        </div>
                    </div>
                </div>
                <!-- //suriSize -->
            </div>
        </div>

        <script>
            var id = '${member.id}';
            var idx = '${community.idx}';
            var contextValue;
            var idOk;

            $(function() {
                getDate();

                $('button').on('click', function() {
                    var btn = $(this).data('btn');
                    var idx = $('#idx').val();
                    if (btn == 'list') {
                        location.href = '${cpath}/community/board';
                    } else if (btn == 'delete') {
                        location.href = '${cpath}/community/delete?idx=' + idx;
                        alert('게시글이 삭제 되었습니다.');
                    }else if (btn == 'update'){
                    	location.href = '${cpath}/community/update?idx=' + idx;
                    }
                });


            });


            function getSave() {
                contextValue = $('#context').val();

                $.ajax({
                    url: "${cpath}/community/ReplySave",
                    type: "get",
                    data: {
                        "id": id,
                        "context": contextValue,
                        "idx": idx
                    },
                    success: getDate,
                    error: function() {
                        alert('error')
                    }
                })
            }

            function getDate() {
                $.ajax({
                    url: "${cpath}/community/findReply",
                    data: {
                        "idx": idx
                    },
                    type: "get",
                    success: communityView,
                    error: function() {
                        alert('error')
                    }
                })
            }

            function communityView(res) {
                var view = '';
                $.each(res, function(idx, obj) {

                    if (obj.img == null) {
                        obj.img = "default.png";
                    }

                    if (obj.id == id) {
                        idOk = '<div class="replayRemove"><a href="" onclick="goDelete(' + obj.num + ')' +
                            '">X</a></div>'
                    } else {
                        idOk = "";
                    }

                    view += '<div class="replayList">';
                    view += '<div class="icon">';
                    view += '<img src="${cpath}/resources/images/' + obj.img + '" width="45"> ';
                    view += '</div>';
                    view += '<div class="replayListInfo">';
                    view += '<p class="name">' + obj.id + '</p>';
                    view += '<p class="context">' + obj.context + '</p>';
                    view += '<p class="indate">' + obj.indate + '</p>';
                    view += '</div>';
                    view += idOk;
                    view += '</div>';
                });

                $('#context').val("");
                $('.replayView').html(view);

            }

            function goDelete(data) {
                var num = data;
                $.ajax({
                    url: "${cpath}/community/ReplyDelete",
                    data: {
                        "num": num
                    },
                    type: "get",
                    success: communityView,
                    error: function() {
                        alert('error')
                    }
                })
            }

            function goUpdate() {
                alert('ss');
            }
        </script>
    </div>
   <%@ include file="../common/footer.jsp"%>
</body>



</html>