<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />


<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    .rate {
        display: inline-block;
        border: 0;
        margin-right: 1%;
    }

    .rate > input {
        display: none;
    }

    .rate > label {
        float: right;
        color: #ddd
    }

    .rate > label:before {
        display: inline-block;
        font-size: 1rem;
        padding: .3rem .2rem;
        margin: 0;
        cursor: pointer;
        font-family: FontAwesome;
        content: "\f005 ";
    }

    .rate .half:before {
        content: "\f089 ";
        position: absolute;
        padding-right: 0;
    }

    .rate input:checked ~ label,
    .rate label:hover,
    .rate label:hover ~ label {
        color: #f73c32 !important;
    }

    .rate input:checked + .rate label:hover,
    .rate input input:checked ~ label:hover,
    .rate input:checked ~ .rate label:hover ~ label,
    .rate label:hover ~ input:checked ~ label {
        color: #f73c32 !important;
    }

    body {
        margin-top: 20px;
        color: #1a202c;
        text-align: left;
        background-color: #e2e8f0;
    }


    @media (min-width: 992px) {
        .sticky-navbar .inner-wrapper {
            height: calc(100vh - 3.5rem - 48px);
        }
    }


    .inner-main-body {
        padding: 1rem;
        position: relative;
        flex: 1 1 auto;
    }

    .inner-main-body .sticky-top,
    .sticky-top {
        z-index: 999;
    }


    @media (max-width: 767.98px) {

        .inner-expand .main-body {
            overflow: hidden;
        }

        .inner-expand .inner-wrapper {
            transform: translate3d(235px, 0, 0);
        }
    }

    .nav .show > .nav-link.nav-link-faded, .nav-link.nav-link-faded.active, .nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active, .navbar-nav .show > .nav-link.nav-link-faded {
        color: #3367b5;
        background-color: #c9d8f0;
    }

    .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
        color: #fff;
        background-color: #467bcb;
    }

    .nav-link.has-icon {
        display: flex;
        align-items: center;
    }

    .nav-link.active {
        color: #467bcb;
    }

    .nav-pills .nav-link {
        border-radius: .25rem;
    }

    .nav-link {
        color: #4a5568;
    }

    .card {
        box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0, 0, 0, .125);
        border-radius: .25rem;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }

    ::-webkit-scrollbar {
        display: none;
    }


    .test {
        height: 115px;
        transition: .2s;
        cursor: pointer;
        overflow-y: hidden
    }

    .active .test {
        height: 300px;
        cursor: context-menu;

    }


</style>


 <!-- 여기부터 -->
            <div onclick="go(this)">
                <div class=" p-2 forum-content show">
                    <div class="d-flex card mb-2 test" style="flex-direction: inherit; flex-wrap:wrap;">
                        <div class="col-lg-7 card-body p-2 p-sm-3">
                            <div class="media forum-item">
                                <div class="d-flex">
	                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
	                                         class="mr-3 rounded-circle" width="50" alt="User"/>
	                                    <h3 class="ms-3 align-self-center">자전거 가게</h3>
	                                    <p class="mt-2 ms-2"><span class="text-secondary font-weight-bold">13분 전</span></p>
                                    
                                </div>
                                <div class="media-body d-flex">
                                    <fieldset class="rate">
                                        <input type="radio" id="rating310" name="rating2" value="10" onclick="return(false);"
                                        ><label for="rating310"
                                                title="5점"></label>
                                        <input type="radio" id="rating39" name="rating2" value="9" onclick="return(false);"
                                               checked><label class="half" for="rating39" title="4.5점"></label>
                                        <input type="radio" id="rating38" name="rating2" value="8" onclick="return(false);"
                                        ><label for="rating38"
                                                title="4점"></label>
                                        <input type="radio" id="rating37" name="rating2" value="7" onclick="return(false);"
                                        ><label class="half" for="rating37"
                                                title="3.5점"></label>
                                        <input type="radio" id="rating36" name="rating2" value="6" onclick="return(false);"
                                        ><label for="rating36"
                                                title="3점"></label>
                                        <input type="radio" id="rating35" name="rating2" value="5" onclick="return(false);"
                                        ><label class="half" for="rating35"
                                                title="2.5점"></label>
                                        <input type="radio" id="rating34" name="rating2" value="4" onclick="return(false);"
                                        "><label for="rating34"
                                                 title="2점"></label>
                                        <input type="radio" id="rating33" name="rating2" value="3" onclick="return(false);"
                                        ><label class="half" for="rating33"
                                                title="1.5점"></label>
                                        <input type="radio" id="rating32" name="rating2" value="2" onclick="return(false);"
                                        ><label for="rating32" title="1점"></label>
                                        <input type="radio" id="rating31" name="rating2" value="1" onclick="return(false);">
                                        <label class="half" for="rating31" title="0.5점"></label>
                                    </fieldset>
                                    <p class="text-muted mb-0 align-self-center" style="font-size: small">(4.5 /
                                        5.0)</p>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-5 card-body p-2 p-sm-3 align-self-center">
                            <div class="media forum-item d-flex justify-content-end">
                                <h1 class="display-5">100,000 원</h1>
                            </div>
                        </div>
                        <div class="col-lg-12 px-3" style="max-height: 300px">
                            <p>서울시 강동구</p>
                            <p>연락 가능 시간 : 10시 ~ 19시</p>
                            <p>안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다. 업력 올해로 15년이며, 방문/출장 수리 모두 가능합니다. 업계
                                최고 수준을 모시겠습니다. 감사합니다.</p>
                            <div class="d-flex justify-content-end pe-3 mb-3">
                                <form action="${cpath}/test" method="post" onsubmit="return confirm('자전거가게에 수리를 맡기시겠습니까?');">
                                	<input type="hidden" value="자전거가게임" name="id" class="gosuName">
                                	<button type="submit" class="btn btn-outline-primary">여기서 고치기
                                </button>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- 여기까지 글 하나 -->
            <div onclick="go(this)">
                <div class=" p-2 forum-content show">
                    <div class="d-flex card mb-2 test" style="flex-direction: inherit; flex-wrap:wrap;">
                        <div class="col-lg-7 card-body p-2 p-sm-3">
                            <div class="media forum-item">
                                <div class="d-flex">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                         class="mr-3 rounded-circle" width="50" alt="User"/>
                                    <h3 class="ms-3 align-self-center">자전거 가게</h3>
                                    <p class="mt-2 ms-2"><span class="text-secondary font-weight-bold">13분 전</span></p>
                                </div>
                                <div class="media-body d-flex">
                                    <fieldset class="rate">
                                        <input type="radio" id="rating10" name="rating3" value="10" onclick="return(false);"
                                        ><label for="rating10"
                                                title="5점"></label>
                                        <input type="radio" id="rating9" name="rating3" value="9" onclick="return(false);"
                                               checked><label class="half"
                                                              for="rating9"
                                                              title="4.5점"></label>
                                        <input type="radio" id="rating8" name="rating3" value="8" onclick="return(false);"
                                        ><label for="rating8"
                                                title="4점"></label>
                                        <input type="radio" id="rating7" name="rating3" value="7" onclick="return(false);"
                                        ><label class="half" for="rating7"
                                                title="3.5점"></label>
                                        <input type="radio" id="rating6" name="rating3" value="6" onclick="return(false);"
                                        ><label for="rating6"
                                                title="3점"></label>
                                        <input type="radio" id="rating5" name="rating3" value="5" onclick="return(false);"
                                        ><label class="half" for="rating5"
                                                title="2.5점"></label>
                                        <input type="radio" id="rating4" name="rating3" value="4" onclick="return(false);"
                                        ><label for="rating4"
                                                 title="2점"></label>
                                        <input type="radio" id="rating3" name="rating3" value="3" onclick="return(false);"
                                        ><label class="half" for="rating3"
                                                title="1.5점"></label>
                                        <input type="radio" id="rating2" name="rating3" value="2" onclick="return(false);"
                                        ><label for="rating2" title="1점"></label>
                                        <input type="radio" id="rating1" name="rating3" value="1" onclick="return(false);">
                                        <label class="half" for="rating1" title="0.5점"></label>
                                    </fieldset>
                                    <p class="text-muted mb-0 align-self-center" style="font-size: small">(4.5 /
                                        5.0)</p>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-5 card-body p-2 p-sm-3 align-self-center">
                            <div class="media forum-item d-flex justify-content-end">
                                <h1 class="display-5">100,000 원</h1>
                            </div>
                        </div>
                        <div class="col-lg-12 px-3" style="max-height: 300px">
                            <p>서울시 강동구</p>
                            <p>연락 가능 시간 : 10시 ~ 19시</p>
                            <p>안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다. 업력 올해로 15년이며, 방문/출장 수리 모두 가능합니다. 업계
                                최고 수준을 모시겠습니다. 감사합니다.</p>
                            <div class="d-flex justify-content-end pe-3 mb-3">
                                <button type="button" class="btn btn-outline-primary" onclick="selectCom()">여기서 고치기
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div onclick="go(this)">
                <div class=" p-2 forum-content show">
                    <div class="d-flex card mb-2 test" style="flex-direction: inherit; flex-wrap:wrap;">
                        <div class="col-lg-7 card-body p-2 p-sm-3">
                            <div class="media forum-item">
                                <div class="d-flex">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                         class="mr-3 rounded-circle" width="50" alt="User"/>
                                    <h3 class="ms-3 align-self-center">자전거 가게</h3>
                                    <p class="mt-2 ms-2"><span class="text-secondary font-weight-bold">13분 전</span></p>
                                </div>
                                <div class="media-body d-flex">
                                    <fieldset class="rate">
                                        <input type="radio" id="rating110" name="rating4" value="10" onclick="return(false);"
                                        ><label for="rating110"
                                                title="5점"></label>
                                        <input type="radio" id="rating19" name="rating4" value="9" onclick="return(false);" checked>
                                        <label class="half" for="rating19" title="4.5점"></label>
                                        <input type="radio" id="rating18" name="rating4" value="8" onclick="return(false);">
                                        <label for="rating18" title="4점"></label>
                                        <input type="radio" id="rating17" name="rating4" value="7" onclick="return(false);">
                                        <label class="half" for="rating17" title="3.5점"></label>
                                        <input type="radio" id="rating16" name="rating4" value="6" onclick="return(false);">
                                        <label for="rating16" title="3점"></label>
                                        <input type="radio" id="rating15" name="rating4" value="5" onclick="return(false);">
                                        <label class="half" for="rating15" title="2.5점"></label>
                                        <input type="radio" id="rating14" name="rating4" value="4" onclick="return(false);">
                                        <label for="rating4" title="2점"></label>
                                        <input type="radio" id="rating13" name="rating4" value="3" onclick="return(false);"
                                        ><label class="half" for="rating13" title="1.5점"></label>
                                        <input type="radio" id="rating12" name="rating4" value="2" onclick="return(false);"
                                        ><label for="rating12" title="1점"></label>
                                        <input type="radio" id="rating11" name="rating4" value="1" onclick="return(false);">
                                        <label class="half" for="rating11" title="0.5점"></label>
                                    </fieldset>
                                    <p class="text-muted mb-0 align-self-center" style="font-size: small">(4.5 /
                                        5.0)</p>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-5 card-body p-2 p-sm-3 align-self-center">
                            <div class="media forum-item d-flex justify-content-end">
                                <h1 class="display-5">100,000 원</h1>
                            </div>
                        </div>
                        <div class="col-lg-12 px-3" style="max-height: 300px">
                            <p>서울시 강동구</p>
                            <p>연락 가능 시간 : 10시 ~ 19시</p>
                            <p>안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다. 업력 올해로 15년이며, 방문/출장 수리 모두 가능합니다. 업계
                                최고 수준을 모시겠습니다. 감사합니다.</p>
                            <div class="d-flex justify-content-end pe-3 mb-3">
                                <button type="button" class="btn btn-outline-primary" onclick="selectCom()">여기서 고치기
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div onclick="go(this)">
                <div class=" p-2 forum-content show">
                    <div class="d-flex card mb-2 test" style="flex-direction: inherit; flex-wrap:wrap;">
                        <div class="col-lg-7 card-body p-2 p-sm-3">
                            <div class="media forum-item">
                                <div class="d-flex">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                         class="mr-3 rounded-circle" width="50" alt="User"/>
                                    <h3 class="ms-3 align-self-center">자전거 가게</h3>
                                    <p class="mt-2 ms-2"><span class="text-secondary font-weight-bold">13분 전</span></p>
                                </div>
                                <div class="media-body d-flex">
                                    <fieldset class="rate">
                                        <input type="radio" id="rating210" name="rating1" value="10" onclick="return(false);"
                                        ><label for="rating210"
                                                title="5점"></label>
                                        <input type="radio" id="rating29" name="rating1" value="9" onclick="return(false);"
                                               checked><label class="half"
                                                              for="rating29"
                                                              title="4.5점"></label>
                                        <input type="radio" id="rating28" name="rating1" value="8" onclick="return(false);"
                                        ><label for="rating28"
                                                title="4점"></label>
                                        <input type="radio" id="rating27" name="rating1" value="7" onclick="return(false);"
                                        ><label class="half" for="rating27"
                                                title="3.5점"></label>
                                        <input type="radio" id="rating26" name="rating1" value="6" onclick="return(false);"
                                        ><label for="rating26"
                                                title="3점"></label>
                                        <input type="radio" id="rating25" name="rating1" value="5" onclick="return(false);"
                                        ><label class="half" for="rating25"
                                                title="2.5점"></label>
                                        <input type="radio" id="rating24" name="rating1" value="4" onclick="return(false);"
                                        ><label for="rating24"
                                                 title="2점"></label>
                                        <input type="radio" id="rating23" name="rating1" value="3" onclick="return(false);"
                                        ><label class="half" for="rating23"
                                                title="1.5점"></label>
                                        <input type="radio" id="rating22" name="rating1" value="2" onclick="return(false);"
                                        ><label for="rating22" title="1점"></label>
                                        <input type="radio" id="rating21" name="rating1" value="1" onclick="return(false);">
                                        <label class="half" for="rating21" title="0.5점"></label>
                                    </fieldset>
                                    <p class="text-muted mb-0 align-self-center" style="font-size: small">(4.5 /
                                        5.0)</p>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-5 card-body p-2 p-sm-3 align-self-center">
                            <div class="media forum-item d-flex justify-content-end">
                                <h1 class="display-5">100,000 원</h1>
                            </div>
                        </div>
                        <div class="col-lg-12 px-3" style="max-height: 300px">
                            <p>서울시 강동구</p>
                            <p>연락 가능 시간 : 10시 ~ 19시</p>
                            <p>안녕하세요. 강동구에서 자전거 정비업체를 운영하고 있습니다. 업력 올해로 15년이며, 방문/출장 수리 모두 가능합니다. 업계
                                최고 수준을 모시겠습니다. 감사합니다.</p>
                            <div class="d-flex justify-content-end pe-3 mb-3">
                                <button type="button" class="btn btn-outline-primary" onclick="selectCom()">여기서 고치기
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

<script>

    function go(a) {
        a.classList.toggle('active');
    }
	
   

</script>