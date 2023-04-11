<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
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
		.chatRoom:hover {
		background-color: gray;
		cursor: pointer;
		}


</style>






            <!--채팅방 목록-->
            <div class="card shadow-sm p-3 mb-5 bg-body rounded" id="chat1" style="border-radius: 15px; height:90%;">
               
                <div class="container" style="overflow:auto;">
                    <!--여기부터-->
                    <div class="col chatRoom shadow-sm p-3 mb-1 bg-body rounded" style="height:100px;">
                        <div class="d-flex">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                 alt="avatar 1" width="45px" height="45px">
                            <p class="fs-3 text ms-3">자전거 가게</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="fs-5 text">네</p>
                            <p class="fs-6 text">23.04.03</p>
                        </div>
                    </div>
                    <!--여기까지 채팅목록 한개-->
                    
                      <div class="col chatRoom shadow-sm p-3 mb-1 bg-body rounded" style="height:100px;">
                        <div class="d-flex">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                 alt="avatar 1" width="45px" height="45px">
                            <p class="fs-3 text ms-3">자전거 가게</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="fs-5 text">네</p>
                            <p class="fs-6 text">23.04.03</p>
                        </div>
                    </div>
                    
                    
                      <div class="col chatRoom shadow-sm p-3 mb-1 bg-body rounded" style="height:100px;">
                        <div class="d-flex">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                 alt="avatar 1" width="45px" height="45px">
                            <p class="fs-3 text ms-3">자전거 가게</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="fs-5 text">네</p>
                            <p class="fs-6 text">23.04.03</p>
                        </div>
                    </div>
                    
                    
                      <div class="col chatRoom shadow-sm p-3 mb-1 bg-body rounded" style="height:100px;">
                        <div class="d-flex">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                                 alt="avatar 1" width="45px" height="45px">
                            <p class="fs-3 text ms-3">자전거 가게</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p class="fs-5 text">네</p>
                            <p class="fs-6 text">23.04.03</p>
                        </div>
                    </div>
                    
                    
                </div>
            </div>

 