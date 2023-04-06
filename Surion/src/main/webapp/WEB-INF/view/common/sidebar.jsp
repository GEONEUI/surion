<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;
  }
  .inner-wrapper {
    position: relative;
    height: calc(100vh - 3.5rem);
    transition: transform 0.3s;
  }
  @media (min-width: 992px) {
    .sticky-navbar .inner-wrapper {
      height: calc(100vh - 3.5rem - 48px);
    }
  }

  .inner-sidebar {
    display: flex;
    flex-direction: column;
  }

  .inner-sidebar {
    left: 0;
    border-right: 1px solid #cbd5e0;
    background-color: #fff;
    z-index: 1;
  }

  .inner-sidebar-footer,
  .inner-sidebar-header {
    height: 3.5rem;
    border-bottom: 1px solid #cbd5e0;
    display: flex;
    align-items: center;
    padding: 0 1rem;
    flex-shrink: 0;
    font-size: 24px;
  }

  .inner-sidebar-body {
    padding: 1rem;
    overflow-y: auto;
    position: relative;
    flex: 1 1 auto;
  }


  @media (max-width: 767.98px) {
    .inner-sidebar {
      left: -235px;
    }

    .inner-expand .inner-wrapper {
      transform: translate3d(235px, 0, 0);
    }
  }

  .nav .show>.nav-link.nav-link-faded, .nav-link.nav-link-faded.active, .nav-link.nav-link-faded:active, .nav-pills .nav-link.nav-link-faded.active, .navbar-nav .show>.nav-link.nav-link-faded {
    color: #3367b5;
    background-color: #c9d8f0;
  }

  .nav-pills .nav-link.active, .nav-pills .show>.nav-link {
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
  ::-webkit-scrollbar {
    display: none;
  }
</style>

<!-- Inner sidebar -->
      <div class="inner-sidebar col-lg-3">
        <!-- Inner sidebar header -->
        <div class="inner-sidebar-header justify-content-center">
          MyPage
        </div>
        <!-- /Inner sidebar header -->

        <!-- Inner sidebar body -->
        <div class="inner-sidebar-body p-0">
          <div class="p-3 h-100" data-simplebar="init">
            <div class="simplebar-wrapper" style="margin: -16px;">
              <div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div>
              <div class="simplebar-mask">
                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                  <div class="simplebar-content-wrapper">
                    <div class="simplebar-content" style="padding: 16px;">
                      <nav class="nav nav-pills nav-gap-y-1 flex-column" id="navLink">
                        <a href="${cpath}/mypage/myinfo?pageview=1" class="nav-link nav-link-faded has-icon" class="myConfig">사용자 정보</a>
                        <a href="${cpath}/mypage/myinfo?pageview=2" class="nav-link nav-link-faded has-icon" class="myConfig">채팅목록</a>
                        <a href="${cpath}/mypage/myinfo?pageview=3" class="nav-link nav-link-faded has-icon" class="myConfig">채팅리스트?</a>
                        <a href="${cpath}/mypage/myinfo?pageview=4" class="nav-link nav-link-faded has-icon" class="myConfig">나의 의뢰</a>
                        <a href="${cpath}/mypage/myinfo?pageview=5" class="nav-link nav-link-faded has-icon" class="myConfig">여기부턴 정비사</a>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="width: 0px; display: none;"></div></div>
          </div>
        </div>
        <!-- /Inner sidebar body -->
      </div>
      <!-- /Inner sidebar -->

<script>
    function chatList(temp){
        let name = document.getElementById(temp);
        name.classList.toggle('active');
	}

</script>