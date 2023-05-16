# http://dbrjsdml.cafe24.com/Surion

<p>수리온 - 인력 매칭과 자원 활용 플랫폼</p>



# 구성원

* 팀장 유건의 : 전체적인 프론트 디자인, 마이페이지, 커뮤니티 페이지
* 팀원 박득권 : 엔지니어 상세페이지, 리뷰모듈 개발
* 팀원 김예준 : 클라이언트 페이지, 수리 요청페이지
* 팀원 김보람 : 실시간 채팅, 거래 매칭시스템
* 팀원 김홍기 : 정비사 페이지, 업체등록 페이지


<br>
# 기획의도
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

# 배포환경
<div>
    <ul>
        <li>Cafe24 호스팅</li>
        <li>Tomcat 8.5.x / JSP 2.3 / Servlet 3.0 / JDK 8 / MariaDB 10.1.x UTF-8 / Bootstrap 5.3</li>
    </ul>
</div>
<br>
# 사용한 기술스택


# 기술 스택
<br>
<div>

|    JAVA    |    Bootstrap    |   Spring Boot |  Spring Data Jpa |    JSP   | MariaDB    |  Mybatis   |
| :--------: |    :--------:   |   :------:    |      :-----:     |  :-----: | :-----:    |   :-----:  |
|  ![java]   |   ![Bootstrap]  |   ![Boot]     |      ![Jpa]      |  ![JSP]  | ![MariaDB]   | ![Mybatis] |
    
</div>

<br>
# 기능 구현
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
            <strong>엔지니어</strong>
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
            <strong>클라이언트</strong>
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
# 이미지
<div>
    <table>
        <tbody>
            <tr>
                <td align="center">
                    메인페이지
                </td>
                <td align="center">
                    회원관련
                </td>
            </tr>
            <tr>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/maincate.png" width="100%">
                </td>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/account/join.png" width="100%">
                </td>
            </tr>
            <tr>
                <td align="center">MyPage</td>
                <td align="center">게시판(커뮤니티)</td>
            </tr>
            <tr>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/mypage/myedit.png" width="100%">
                </td>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/board/board.png" width="100%">
                </td>
            </tr>
            <tr>
                <td align="center">엔지니어 페이지</td>
                <td align="center">클라이언트 페이지</td>
            </tr>
            <tr>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairlist.png" width="100%">
                </td>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/buttonPaging.png" width="100%">
                </td>
            </tr>
                        <tr>
                <td align="center">엔지니어 상세보기</td>
                <td align="center">클라이언트 상세보기</td>
            </tr>
            <tr>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/requestUpdateDelete.png" width="100%">
                </td>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/repair/repairdetailmap.png" width="100%">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">채팅 & 대화방</td>
            </tr>
            <tr>
                <td>
                   <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/chatting.png" width="100%">
                </td>
                <td>
                    <img src="http://dbrjsdml.cafe24.com/Surion/resources/images/chat/estimateList.png" width="100%">
                </td>
            </tr>
        </tbody>
    </table>
</div>
<br>
<br>




     
[java]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1566913897/noticon/xbvewg1m3azbpnrzck1k.png
[Bootstrap]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1567128495/noticon/gpkdob34yhkxoo7cyyqv.png
[Boot]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1567008187/noticon/m4oad4rbf65fjszx0did.png
[Jpa]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1609094551/noticon/gkcjchloc7f7khlsyyyy.png
[JSP]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1592435019/noticon/z0s5osjhwlxpeo6pxslv.png
[MariaDB]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1566920129/noticon/r9gn1ilil1r8ar4w59dj.png
[Mybatis]: https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1592435324/noticon/judba41udt3wtirdj4ek.png
