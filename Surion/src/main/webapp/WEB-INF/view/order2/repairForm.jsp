<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-04-07
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp" %>

<style>
  /* uvisual */
  .usec_visual{
    background: #000;
  }
  .usec_visual .uvisual{
    width: 100%;
    height: 320px;
    background: url('./image/submit.png')center center / cover no-repeat;
    padding: 6rem 0;
    font-size: 3rem;
    color: #fff;
  }

  /* content */
  .content {
    height: 887px;
    background: #fafafa;
    padding-top: 3rem;
  }

  .suriSize {
    display: flex;
  }

  .mainForm {
    width: 560px;
    height: 800px;
    background: #fff;
    border-radius: 1rem;
    border: .0625rem solid #e1e1e1;
    padding: 2.4375rem;
    transform: translateY(-6.25rem);
  }

  .main1 {
    width: 51%;
    padding-right: 2.2rem;
  }

  .main2 {
    width: %;
  }

  .main2 h3 {
    line-height: 3rem;
  }

  .main2 h4 {
    margin-bottom: 0.25rem;
    font-size: 1rem;
    line-height: 2.0625rem;
    font-weight: 500;
    letter-spacing: -.025rem;
  }

  .main2 p {
    margin-bottom: 2.5rem;
    color: #737373;
    font-size: .875rem;
    line-height: 2rem;
    font-weight: 400;
    letter-spacing: -.0125rem;
  }



  .loading {
    display: flex;
    align-items: center;

  }

  .loading .bar{
    width: 0%;
    transition:1s;
    height: 5px;
    background: linear-gradient(to right, #93F9B9, #1D976C);
    margin-right: 5px;
  }

  .loading span{
    color: #00c7ae;
    font-weight: bold;
  }

  .first {
    font-size: .75rem;
    color: #737373;
  }

  .loading div:nth-child(2) {
    width: 3rem;
    color: #00c7ae;
    font-weight: bold;
  }

  .service {
    font-size: 2rem;
    padding-bottom: 1.5rem;
  }

  .below {
    padding-top: 3rem;
  }

  .text-area {
    width: 100%;
    display: flex;
    border: 0.0625rem solid #e7e7e7;
  }

  .selBtn {
    display: flex;
    justify-content: end;
  }

  .select {
    padding: 2rem 0 2rem;
  }

  .nextBtn {
    width: 7.5rem;
    height: 48px;
    border-style: none;
    background: #00c7ae;
    color: #fff;
    font-weight: bold;
    font-size: 1.1rem;
    border-radius: 0.3rem;
    margin-left: 1rem;
  }

  .prevBtn {
    width: 7.5rem;
    height: 48px;
    border: 0.0625rem solid #e1e1e1;
    background: #fff;
    color: #00c7ae;
    font-weight: bold;
    font-size: 1.1rem;
    border-radius: 0.3rem;
  }

  .progress	{
    width: 100%;
    height: 0.25rem;
    border-radius: 2px;
    box-shadow: none;
    margin: 0;
    flex: 1;
  }

  .progress {
    appearance: none;
  }

  .progress::-webkit-progress-bar {
    background:#f0f0f0;
    border-radius:10px;
    box-shadow: inset 3px 3px 10px #ccc;
  }

  .progress::-webkit-progress-value {
    border-radius:10px;
    background: #1D976C;
    background: -webkit-linear-gradient(to right, #93F9B9, #1D976C);
    background: linear-gradient(to right, #93F9B9, #1D976C);
  }

  .loadingGage {
    padding-left: 15px;
  }

  /* input css */
  input[type="checkbox"]{
    display: none;
  }

  input[type="checkbox"] + label{
    display:flex;
    align-items: center;
    height: 4rem;
    width: 100%;
    cursor: pointer;
    padding-left: 1rem;
  }
  input[type="checkbox"] + label span{
    width: 20px;
    height: 20px;
    position: relative;
    background: url('./image/checkbox.svg') center center / contain no-repeat;
  }

  input[type="checkbox"] + label div{
    padding-left: 1rem;
    font-size: 1.2rem;
  }


  input[type="checkbox"]:checked + label span::after{
    content:"";
    font-size: 25px;
    width: 20px;
    height: 20px;
    text-align: center;
    position: absolute;
    left: 0;
    top:0;
    background: url('./image/checkSuc.svg') center center / contain no-repeat;
  }

  #root {
    width: 100%;
    margin: 0 auto;
    max-width: 800px;
  }

  .title {

  }

  .contents {
    display: flex;
    flex-direction: row;
    margin-top: 30px;
  }
  .contents .upload-box {
    width: calc(50% - 15px);
    box-sizing: border-box;
    margin-right: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .contents .upload-box .drag-file {
    width: 100%;
    height: 360px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 3px dashed #dbdbdb;
  }
  .contents .upload-box .drag-file.highlight {
    border: 3px dashed red;
  }
  .contents .upload-box .drag-file .image {
    width: 40px;
  }
  .contents .upload-box .drag-file .message {
    margin-bottom: 0;
  }
  .contents .upload-box .file-label {
    margin-top: 30px;
    background-color: #00c7ae;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    width: 65%;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    font-size: 1.1rem;
  }
  .contents .upload-box .file {
    display: none;
  }

  .contents .files {
    width: calc(50% - 15px);
    box-sizing: border-box;
    overflow: auto;
    height: 360px;
  }
  .contents .files .file {
    display: flex;
    padding: 20px 20px;
    border-bottom: 1px solid #dbdbdb;
  }
  .contents .files .file:last-child {
    margin-bottom: 0px;
    border-bottom: none;
  }

  .contents .files .file .thumbnail {
    display: flex;
    flex: none;
    width: 50px;
    margin-right: 20px;
    align-items: center;
  }
  .contents .files .file .thumbnail .image {
    width: 100%;
  }

  .contents .files .file .details {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .contents .files .file .details .header {
    display: flex;
  }
  .contents .files .file .details .header .name {
    width: 100px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }
  .contents .files .file .details .header .size {
    margin-left: auto;
  }

  .contents .files .file .progress {
    position: relative;
    height: 6px;
    background-color: #dbdbdb;
    overflow: hidden;
    margin-top: 4px;
    border-radius: 10px;
  }

  .contents .files .file .status {
    display: flex;
    width: 100%;
  }
  .contents .files .file .status .percent {
  }
  .contents .files .file .status .speed {
    margin-left: auto;
  }

  @media(max-width: 700px) {
    .contents {
      display: flex;
      flex-direction: column;
      margin-top: 30px;
    }
    .contents .upload-box {
      width: 100%;
      box-sizing: border-box;
      margin-right: 0;
    }
    .contents .upload-box .drag-file {
      height: 150px;
    }
    .contents .files {
      width: 100%;
      box-sizing: border-box;
      margin-right: 0;
      overflow: initial;
    }
</style>
<body>
<%@ include file="../common/header.jsp" %>

<!-- header -->
<div class="usec_visual">
  <div class="uvisual">
    <div class="suriSize">
      정비사 등록
    </div>
  </div>
</div>

<!-- content -->
<div class="sec_content">
  <div class="content">
    <div class="suriSize">
      <div class="main1">
        <form class="mainForm">
          <div>
            <div class="first">완료 시 평균 4개 의뢰 도착</div>
            <div class="loading">
              <div class="bar"></div>
              <span>0%</span>
            </div>
          </div>
          <div class="below">
            <div class="service">어떤 서비스를 받기 원하시나요?</div>
            <ul class="select">
              <li class="text-area">
                <input type="checkbox" value="자전거" id="checkbox-area-0" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-0">
                  <span></span>
                  <div>자전거</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="오토바이" id="checkbox-area-1" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-1">
                  <span></span>
                  <div>오토바이</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="에어컨" id="checkbox-area-2" name="selectOne"   onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-2">
                  <span></span>
                  <div>에어컨</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="보일러" id="checkbox-area-3" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-3">
                  <span></span>
                  <div>보일러</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="컴퓨터" id="checkbox-area-4" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-4">
                  <span></span>
                  <div>컴퓨터</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="음향" id="checkbox-area-5" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-5">
                  <span></span>
                  <div>음향/악기</div>
                </label>
              </li>
              <li class="text-area">
                <input type="checkbox" value="기타" id="checkbox-area-6" name="selectOne" onclick="checkOnlyOne(this)" class="selClass"/>
                <label for="checkbox-area-6">
                  <span></span>
                  <div>기타</div>
                </label>
              </li>
            </ul>
          </div>
          <div class="selBtn">
            <input type="button" value="이전" class="prevBtn" onclick=""/>
            <input type="button" value="다음" class="nextBtn" onclick="next()"/>
          </div>
      </div>
      </form>
      <div class="main2">
        <h4>정비사님의 수리사진을 등록해주세요.</h4>
        <div id="root">
          <hr>
          <div class="contents">
            <div class="upload-box">
              <div id="drop-file" class="drag-file">
                <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
                <p class="message">파일을 드래그 해주세요.</p>
              </div>
              <label class="file-label" for="chooseFile">파일 업로드</label>
              <input class="file" id="chooseFile" type="file" multiple onchange="dropFile.handleFiles(this.files)">
            </div>
            <div id="files" class="files">
              <div class="file">
                <div class="thumbnail">
                  <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일타입 이미지" class="image">
                </div>
                <div class="details">
                  <header class="header">
                    <span class="name">Photo.png</span>
                    <span class="size">7.5 mb</span>
                  </header>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <div class="status">
                    <span class="percent">37% done</span>
                    <span class="speed">90KB/sec</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <h4 class="mt-5">수리 분야의 고수만을 모았다!</h4>
        <p>수리 및 무언가를 원하시나요?
          모든 물건은 그에 맞는 수리법이 있는 것인데, 숨고에는 다양한 경력의 수리 전문가가 활동하고 있어요.
          지금 바로 요청서를 작성하시고, 쉽고 간편하게 전문가님과 상담해보세요!</p>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>
<script>
  // 체크박스 1개만 클릭
  function checkOnlyOne(element) {
    const checkboxes = document.getElementsByName("selectOne");
    checkboxes.forEach((cb) => {
      cb.checked = false;
    })
    element.checked = true;
  }

  var total = 33;
  var barElem = document.querySelector('.bar');
  const loading = document.querySelector('.loading');
  const select = document.querySelector('.select');



  const bicycle = ''
          +'<li class="text-area">'
          +'<input type="checkbox" value="타이어펑크" id="checkbox-area-0" name="selectOne"' +'onclick="checkOnlyOne(this)" class="selClass"/>'
          +'<label for="checkbox-area-0">'
          +'<span></span>'
          +'<div>타이어펑크</div>'
          +'</label>'
          +'</li>';

  let goNextValue;

  function next()	{
    goNextValue = document.querySelector('.selClass:checked').value;
    if(goNextValue == '자전거'){
      select.innerHTML = bicycle;
    }

    barElem.style.width = total + "%";
  }


  function DropFile(dropAreaId, fileListId) {
    let dropArea = document.getElementById(dropAreaId);
    let fileList = document.getElementById(fileListId);

    function preventDefaults(e) {
      e.preventDefault();
      e.stopPropagation();
    }

    function highlight(e) {
      preventDefaults(e);
      dropArea.classList.add("highlight");
    }

    function unhighlight(e) {
      preventDefaults(e);
      dropArea.classList.remove("highlight");
    }

    function handleDrop(e) {
      unhighlight(e);
      let dt = e.dataTransfer;
      let files = dt.files;

      handleFiles(files);

      const fileList = document.getElementById(fileListId);
      if (fileList) {
        fileList.scrollTo({ top: fileList.scrollHeight });
      }
    }

    function handleFiles(files) {
      files = [...files];
      files.forEach(previewFile);
    }

    function previewFile(file) {
      console.log(file);
      fileList.appendChild(renderFile(file));
    }

    function renderFile(file) {
      let fileDOM = document.createElement("div");
      fileDOM.className = "file";
      fileDOM.innerHTML = `
			<div class="thumbnail">
				<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일타입 이미지" class="image">
			</div>
			<div class="details">
				<header class="header">
				<span class="name">${file.name}</span>
				<span class="size">${file.size}</span>
				</header>
				<div class="progress">
				  <div class="bar"></div>
				</div>
				<div class="status">
				  <span class="percent">100% done</span>
				  <span class="speed">90KB/sec</span>
				</div>
			  </div>
			`;
      return fileDOM;
    }

    dropArea.addEventListener("dragenter", highlight, false);
    dropArea.addEventListener("dragover", highlight, false);
    dropArea.addEventListener("dragleave", unhighlight, false);
    dropArea.addEventListener("drop", handleDrop, false);

    return {
      handleFiles
    };
  }

  const dropFile = new DropFile("drop-file", "files");






</script>
</body>
</html>
