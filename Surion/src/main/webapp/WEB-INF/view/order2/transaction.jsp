<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<!-- Bootstrap 5 JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper-base.min.js" data-crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.7.0/dist/js/bootstrap.bundle.min.js" data-crossorigin="anonymous"></script>

<%@ include file="../common/front_header.jsp" %>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    a{
        text-decoration: none;
    }

    li{
        list-style: none;

    }

    .h_form {
        display: flex;
        gap: 16px;
        padding: 24px;
        margin: 0;
        background-color: #fafafc;
        border-radius: 12px;
    }
    .h_list{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        border-radius: 8px;
        padding: 12px 16px;
        box-shadow: 0 4px 14px rgba(48,52,65,0.08);
        flex: 1;
        background-color: #ffffff;
        color: #303441;
    }
    .h_card{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .h_count{
        text-decoration: none;
        cursor: pointer;
        font-weight: 700;
        font-size: 24px;
        text-align: right;
        color: #303441;
    }
    .status_list{
        display: flex;
        justify-content: space-between;
        font-weight: 400;
        font-size: 13px;
    }
    .h_card_list{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        border-radius: 8px;
        padding: 12px 16px;
        flex: 1;
        background-color: #ffffff;
        color: #303441;
        gap: 4px;
    }
    .b_content{
        display: flex;
        column-gap: 8px;
        margin-top: 0em;
        justify-content:space-between;
    }
    .check_button{
        outline: none;
        border-width: 1px;
        border-style: solid ;
        box-sizing: border-box;
        border-radius: 4px;
        line-height: 1;
        font-weight: 500;
        transition: background-color 0.3s,border-color 0.3s;
        justify-content: center;
        cursor: pointer;
        position: relative;
        user-select: none;
        white-space: nowrap;
        max-width: 100%;
        height: 36px;
        font-size: 14px;
        padding: 0 16px;
        min-width: 64px;
        background-color: #00c7ae;
        border-color: #00c7ae;
        color: #ffff;

    }
    .dropdown-toggle{
        border-color:#adb5bd;
        flex: 0 0 auto;
        width: 100px;
        text-align: left;
        height: 36px;
    }
    .date{
        border-color:#adb5bd;
        border-radius:0.375rem;
        height:36px;
        width:200px;
        display:flex;
    }
    .date_{
        gap: 8px;
    }
    .search{
        flex: 1;
        width: 100%;
        height: 100%;
        background-image: none;
        box-sizing: border-box;
        font-size: inherit;
        border: none;
        font-weight: inherit;
        background-color: transparent;
        text-align: left;
        color: inherit;
    }
    .check_parents{
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }
    .check_list{
        display: flex;
        gap: 8px;
        width: 400px;
    }
    .check_box {
        font-size: 16px;
        color: #303441;
        cursor: pointer;
    }
    .check{
        white-space: nowrap;
        outline: none;
        position: relative;
        line-height: 1;
        display: inline-flex;
        vertical-align: middle;
        align-items: center;
        justify-content: center;

    }
    .exel_parents{
        display:flex;
        justify-content:space-between;
        width: 250px;
    }

    .exel_button{
        outline: none;
        border-width: 1px;
        border-style: solid;
        box-sizing: border-box;
        border-radius: 4px;
        line-height: 1;
        font-weight: 500;
        justify-content: center;
        cursor: pointer;
        position: relative;
        user-select: none;
        white-space: nowrap;
        max-width: 100%;
        height: 32px;
        font-size: 13px;
        padding: 0 12px;
        min-width: 64px;
        background-color: transparent;
        border-color: #303441;
        color: #303441;
        width: 116px;
    }
    .exel_text{
        outline: none;
        display: inline-flex;
        position: relative;
        line-height: 1;
        vertical-align: middle;
        justify-content: center;
        align-items: center;
    }

    .check_input{
        position: absolute;
        left: 0;
        z-index: 19;
        opacity: 0;
        top: 0;
        bottom: 0;
        right: 0;
        cursor: inherit;
    }
    .checkbox_inner{
        position: relative;
        top: 0;
        left: 0;
        display: inline-block;
        width: 16px;
        height: 16px;
        border-width: 1px;
        border-style: solid;
        border-radius: 3px;
        border-color: #c8cad2;
        background-color: #fff;
    }
    .checkbox_text{
        margin: 0 8px;
    }

    .radio_input {
        position: absolute;
        left: 0;
        z-index: 19;
        opacity: 0;
        top: 0;
        bottom: 0;
        right: 0;
        cursor: inherit;
    }
    .radio_inner{
        position: relative;
        top: 0px;
        left: 0px;
        display: inline-block;
        width: 16px;
        height: 16px;
        border: 1px solid #00c7ae;
        border-radius: 50%;
        transition: border-color 0.36s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
    }
    .radio_text {
        margin: 0 8px;
    }
    .section_2{
        margin-top: 40px;
    }

    .section_3{
        margin-top: 12px;
        height: 600px;
        display: flex;
        flex-direction: column;
        row-gap: 8px;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        text-align: center;
        border: 1px solid rgb(228, 229, 237);
        border-radius: 8px;
        font-weight: 400;
        font-size: 14px;
        color: rgb(154, 155, 167);
    }
    .textarea{
        margin: 0px;
        padding: 0px;
        color: rgb(48, 52, 65);
        font-weight: 500;
    }
    .adver{
        margin-top: 40px;
        display: block;
    }


</style>

<body>
<%@ include file="../common/header.jsp" %>
<div class="suriSize">
    <div class="container">
        <p style="font-size: 18px;
           font-weight: bold;">수리 내역</p>
        <section>
            <div class="h_content">
                <ul class="h_form">
                    <li class="h_list">
                        <div class="h_card">
                            <i class="fa-light fa-wrench fa-2xl" style="color: #00c7ae; "></i><div>수리요청</div>
                        </div>
                        <a class="h_count" href="/#">0</a>
                    <li>
                    <li class="h_list">
                        <div class="h_card">
                            <i class="fa-solid fa-wrench fa-2xl" style="color: #00c7ae;"></i><div>수리중</div>
                        </div>
                        <a class="h_count" href="/#">0</a>
                    <li>
                    <li class="h_list">
                        <div class="h_card">
                            <i class="fa-regular fa-screwdriver-wrench fa-2xl" style="color: #00c7ae;"></i><div>수리완료</div>
                        </div>
                        <a class="h_count" href="/#">0</a>
                    <li>
                    <li class="h_list">
                        <div class="h_card_list">
                            <div class="status_list">수리요청<a href="/#">0</a></div>
                            <div class="status_list">수리중<a href="/#">0</a></div>
                            <div class="status_list">수리완료<a href="/#">0</a></div>
                            <div class="status_list">수리취소<a href="/#">0</a></div>
                        </div>
                    <li>
                </ul>
            </div>
        </section>
        <section class="section_2">
            <form class="b_content">
                <div class="btn-group">
                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">
                        진행중
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">진행중</a></li>
                        <li><a class="dropdown-item" href="#">수리중</a></li>
                        <li><a class="dropdown-item" href="#">수리 완료</a></li>
                    </ul>
                </div>
                <div class="date_" style="display:flex;">
                    <div class="date">
                        <input id="startDate" class="form-control" type="date" />
                        <span id="startDateSelected"></span>
                    </div>
                    ~
                    <div class="date">
                        <input id="endDate" class="form-control" type="date"/>
                        <span id="endDateSelected"></span></div>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">
                        닉네임
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">닉네임</a></li>
                        <li><a class="dropdown-item" href="#">수리번호</a></li>
                        <li><a class="dropdown-item" href="#">의뢰인</a></li>
                    </ul>
                </div>
                <div class="input_search"><input type="text" placeholder="검색어 입력" class="search"></div>
                <button role="button" class="check_button"><span>조회</span></button>
            </form>
            <div class="check_parents">
                <div class="check_list">
                    <label class="check_box">
							<span class="check">
								<input type="radio" class="radio_input">
								<span class="radio_inner"></span>
								<span class="radio_text">업데이트 순</span>
							</span>
                    </label>
                    <label class="check_box">
							<span class="check">
								<input type="radio" class="radio_input">
								<span class="radio_inner"></span>
								<span class="radio_text">수리완료 순</span>
							</span>
                    </label>
                    <label class="check_box">
							<span class="check">
								<input type="radio" class="radio_input">
								<span class="radio_inner"></span>
								<span class="radio_text">의뢰일시 순</span>
							</span>
                    </label>
                    <label class="check_box">
							<span class="check">
								<input type="radio" class="radio_input">
								<span class="radio_inner"></span>
								<span class="radio_text">거래금액 순</span>
							</span>
                    </label>
                </div>
                <div class="exel_parents">
                    <label class="exel">
							<span class="exel_text">
								<input type="checkbox" class="check_input">
								<span class="checkbox_inner"></span>
								<span class="checkbox_text">세금계산서 신청</span>
							</span>
                    </label>
                    <button role="button" class="exel_button">엑셀 다운로드<i class="fa-light fa-download"></i></button>
                </div>
            </div>
        </section>
        <section class="section_3">
            <p class="textarea"> 요청 기간 내에 거래 내역이 없습니다.</p>
            요청 기간을 변경하여 확인해 보세요.
            <br>
            (기본 조회 기간: 1년)
        </section>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>

</body>

</html>
