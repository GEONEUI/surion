# http://dbrjsdml.cafe24.com/Surion

<p>수리온 - 인력 매칭과 자원 활용 플랫폼</p>

<img src="http://dbrjsdml.cafe24.com/Surion/resources/images/main/main.png" width="700">

<br>
<h1>기획의도</h1>
<ul>
    <li style="list-style: none;">
        <strong>환경</strong>
        <ul>
            <li>해외직구로 인한 수리 못 받는 제품 증가<br>해외브랜드의 국내 시장 진입의 큰 걸림돌인 보증관리</li>
        </ul>
    </li>
    <li>
        <strong>공급 측면</strong>
        <ul>
            <li>코로나로 인한 낙원, 용산 일대의 전자상가<br> 폐업으로 정비공 실업자 증가. 고급인력 확보 가능</li>
        </ul>
    </li>
    <li>
        <strong>수요 측면</strong>
        <ul>
            <li>값비싼 공식수리서비스 및 고장난 제품 폐기량 증가로 잠재 수요 존재</li>
            <li>당근마켓 등 중고거래 소셜 플랫폼의 성장 등 높은 시장잠재력</li>
        </ul>
    </li>
    <li>
        <strong>기타 환경</strong>
        <ul>
            <li>SNS 발달로, 수리 영상 및 기술 전수 등 수리 용이성 증가</li>
            <li>해외 직구 등 외국 생산지 부품 조달 접근성 확보</li>
        </ul>
    </li>
</ul>

<h1>배포환경</h1>
<div>
    <ul>
        <li>Cafe24 호스팅</li>
        <li>Tomcat 8.5.x / JSP 2.3 / Servlet 3.0 / JDK 8 / MariaDB 10.1.x UTF-8 / Bootstrap 5.3</li>
    </ul>
</div>
<br>
<h1>사용한 기술스택</h1>
<div>
    <ul>
        <li>JAVA 1.8</li>
        <li>Bootstrap</li>
        <li>Spring Boot</li>
        <li>Spring Data Jpa</li>
        <li>Jsp</li>
        <li>MariaDB</li>
        <li>Mybatis</li>
    </ul>
</div>
<br>
<h1>기능 구현</h1>
<div>
    <ul>
<li>
            <strong>계정 관련</strong>
            <ul>
                <li>로그인,로그아웃,회원가입</li>
                <li>MyPage(작성한 글목록, 회원정보변경, 프로필변경)</li>
            </ul>
        </li>
        <li>
            <strong>계정 관련</strong>
            <ul>
                <li>로그인,로그아웃,회원가입</li>
                <li>MyPage(작성한 글목록, 회원정보변경, 프로필변경)</li>
            </ul>
        </li>
        <li>
            <strong>게시판</strong>
            <ul>
                <li>게시글 CRUD</li>
                <li>비동기통신 댓글</li>
                <li>버튼 페이징</li>
            </ul>
        </li>
        <li>
            <strong>기술자</strong>
            <ul>
                <li>정비업체등록</li>
                <li>검색기능</li>
                <li>다음지도 API활용 업체위치 표시</li>
                <li>상품 등록, 수정, 삭제, 견적제안</li>
                <li>정렬기능(인기순, 최신순, 카테고리별)</li>
                <li>버튼 페이징(비동기)</li>
            </ul>
        </li>
        <li>
            <strong>소비자</strong>
            <ul>
                <li>검색기능</li>
                <li>의뢰 등록, 수정, 삭제, 견적받기</li>
                <li>정렬기능(인기순, 최신순, 카테고리별)</li>
                <li>리뷰 등록</li>
                <li>버튼 페이징(비동기)</li>
            </ul>
        </li>
        <li>
            <strong>채팅</strong>
            <ul>
                <li>1:1 채팅구현</li>
                <li>상대방 프로필 확인</li>
                <li>거래 완료 기능</li>
            </ul>
        </li>
    </ul>
</div>
<br>
<h1>이미지</h1>
<div>
    <ul>
        <li>
            <strong>메인페이지</strong>
            <ul>
                <li>카테고리별 게시글 확인가능</li>
                <li>카테고리별 인기순위 확인가능</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/maincate.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/maincommunity.png" width="600"></p>
            </ul>
        </li>
        <li>
            <strong>로그인</strong>
            <ul>
                <li>로그인,로그아웃,회원가입 기능구현</li>
                <li>아이디 중복체크 구현</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/account/join.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/account/login.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/account/logout.png" width="600"></p><br>
            </ul>
        </li>
        <li>
            <strong>MyPage</strong>
            <ul>
                <li>회원정보 변경 구현(지도 API 사용 주소변경 구현)</li>
                <li>작성한 글 보기 구현</li>
                <li>변경할 프로필 미리보기 구현</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/mypage/myedit.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/mypage/myprofile.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/mypage/mywrite.png" width="600"></p><br>
            </ul>
        </li>
        <li>
            <strong>게시판(커뮤니티)</strong>
            <ul>
                <li>게시글 CRUD</li>
                <li>비동기통신 댓글</li>
                <li>버튼 페이징은 현재 글 갯수5개 페이징번호 5개씩으로 구현</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/board/board.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/board/boardreply.png" width="600"></p><br>
            </ul>
        </li>
        <li>
            <strong>기술자</strong>
            <ul>
                <li>정비업체등록</li>
                <li>검색기능</li>
                <li>다음지도 API활용 업체위치 표시</li>
                <li>상품 등록, 수정, 삭제, 견적제안</li>
                <li>정렬기능(인기순, 최신순, 카테고리별)</li>
                <li>버튼 페이징(비동기)</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairform registerdetail.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairlist.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairdetailmap.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairsearch.png" width="600"></p><br>
            </ul>
        </li>
        <li>
            <strong>소비자</strong>
            <ul>
                <li>검색기능</li>
                <li>의뢰 등록, 수정, 삭제, 견적받기</li>
                <li>정렬기능(인기순, 최신순, 카테고리별)</li>
                <li>리뷰 등록</li>
                <li>버튼 페이징(비동기)</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/buttonSorting.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/buttonPaging.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/requestUpdateDelete.png" width="600"></p><br>
            </ul>
        </li>
        <li>
            <strong>채팅</strong>
            <ul>
                <li>1:1 채팅구현</li>
                <li>상대방 프로필 확인</li>
                <li>거래 완료 기능</li><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/chatting.png" width="600"></p><br>
                <p><img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/estimateList.png" width="600"></p><br>
            </ul>
        </li>
    </ul>
</div>
<br>
<br>
