<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0, 0, 0, .125);
        border-radius: .25rem;
        padding:0 !important;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
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


	#paddingnone{
		padding:0;
	}

</style>



            <!--채팅방 목록-->
            <div class="card shadow-sm p-3 mb-5 bg-body rounded" id="chat1" style="border-radius: 15px; height:90%;">
               
                <div id="paddingnone"class="container">
  
                    
                </div>
            </div>

 