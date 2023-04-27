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
    width: 42%;
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
    height: 500px;
    margin-bottom : 20px;
  }
  .text-areaq {
    width: 100%;
    display: flex;
    border: 0.0625rem solid #e7e7e7;
  }
  .text-areaw {
    flex: 1;
    width: 100%;
    heigtht: 50%;
    display: flex;
  }

  #selBtn {
    display: flex;
    justify-content: end;
  }

  .select {
    padding: 2rem 0 2rem;
    height: 520px;
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
  }

  input[type="checkbox"] + label div{
    padding-left: 1rem;
    font-size: 1.2rem;
  }


  input[type="checkbox"]:checked + label div {
  color: #00c7ae; /* 선택된 레이블 텍스트 색상 변경 */
}

.sub_label{
	display: flex;
    align-items: center;
    height: 4rem;
    width: 40%;
    padding-left: 1rem;
	}
.inputClass0, .inputClass1, .inputClass2, .inputClass3, .inputClass5{
	
	width:inherit;
	border-style:none;
	font-style: normal;
	font-size: 1.1em;
	text-align:right;
	
}
.inputClass4 {
	width:inherit;
	border-style:none;
	font-style: normal;
	font-size: 1.1em;
	height:inherit;
} 
.sub_div{
  	padding-left: 1rem;
    font-size: 1.2rem;
    white-space:nowrap;
  }
  .sub_div2{
  	display: flex;
    align-items: center;
    font-size: 1.1em;
    gap: 8px;
    white-space: nowrap;
    width: inherit;
    margin-right: 8px;
    font-style: normal;
  }
  .sub_div3{
  	display: flex;
    align-items: baseline;
    font-size: 1.1em;
    white-space: nowrap;
    width: inherit;
    font-style: normal;
    height:500px;
  }
  

	body {
	  margin: 24px;
	}
	
	
	.upload_dropZone {
	  color: #00c7ae;
	  background-color: #ffff;
	  outline: 2px dashed #00c7ae;
	  outline-offset: -12px;
	  height: 504px;
	}
	.upload_dropZone.highlight {
	  outline-offset: -4px;
	  outline-color: #00c7ae;
	  background-color: #00c7ae;
	}
	
	.btn-upload {
	  color: #fff;
	  background-color: #00c7ae;
	}
	
	.upload_img {
	  width: calc(33.333% - (2rem / 3));
	  object-fit: contain;
	}
	.submit_div{
		display: flex;
	    justify-content: right;
    }
    .submit_btn{
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
   .quest0{
   	 height: 520px;
   }
   .div_height{
	   	display: flex;
	    align-items: center;
	    justify-content: center;
	    height: 120px;
	    border: 0.0625rem solid #e7e7e7;
   }
</style>
<body>

<%@ include file="../common/header.jsp" %>

<!-- header -->
<div class="usec_visual">
  <div class="uvisual">
    <div class="suriSize">
      사업장 등록
    </div>
  </div>
</div>

<!-- content -->
<div class="sec_content">
  <div class="content">
    <div class="suriSize">
      <div class="main1">
        <div class="mainForm">
          <div>
            <div class="first">완료 시 평균 4개 의뢰 도착</div>
            <div class="loading">
              <div class="bar"></div>
              <span class="barPercent">0%</span>
            </div>
          </div>
          <div class="below">
            <div class="service">어떤 서비스를 지원하시나요?</div>
			<form name="image_form" action="${cpath}/order2/upload" method="post" enctype="multipart/form-data">
				<div id="imageUp" style="display:none;">
					<fieldset class="upload_dropZone text-center mb-3 p-4">
						<legend class="visually-hidden">Image uploader</legend>
						<i class="fa-solid fa-cloud-arrow-up fa-2xl" style="color: #00c7ae;"></i>
						<p class="small my-2">이미지를 드래그 해주세요<br><i>또는</i></p>
						<input id="upload_image_background" class="uploadImg position-absolute invisible" type="file" name="imageUp" multiple="multiple"/>
						<input type="hidden" name="member_id" value="ff">
						<label class="btn btn-upload mb-3" for="upload_image_background">파일 선택</label>
						<div class="upload_gallery d-flex flex-wrap justify-content-center gap-3 mb-0"></div>
					</fieldset>
				</div>
				<div id="quest1">
					<ul class="select">
		              <li class="text-areaq">
		                <input type="checkbox" value="자전거" id="checkbox-area-0" name="category" onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-0">
		                  <span></span>
		                  <div>자전거</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="오토바이" id="checkbox-area-1" name="category"   onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-1">
		                  <span></span>
		                  <div>오토바이</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="에어컨" id="checkbox-area-2" name="category"   onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-2">
		                  <span></span>
		                  <div>에어컨</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="보일러" id="checkbox-area-3" name="category" onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-3">
		                  <span></span>
		                  <div>보일러</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="컴퓨터" id="checkbox-area-4" name="category" onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-4">
		                  <span></span>
		                  <div>컴퓨터</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="음향/악기" id="checkbox-area-5" name="category" onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-5">
		                  <span></span>
		                  <div>음향/악기</div>
		                </label>
		              </li>
		              <li class="text-areaq">
		                <input type="checkbox" value="기타" id="checkbox-area-6" name="category" onclick="checkOnlyOne(this)" class="selClass"/>
		                <label for="checkbox-area-6">
		                  <span></span>
		                  <div>기타</div>
		                </label>
		              </li>
		            </ul>
				</div>
				<div id="quest2" style="display:none;">
					<div class="quest0">
						<div class= "div_height">
						<li class="text-areaw">
						    <label class="sub_label" for="text-area-0">
						        <span></span>
						        <div class="sub_div">상점명&nbsp;</div>
						    </label>
						    <input type="text" id="text-area-0" class="inputClass0" name="shopName"/>
						</li>
						</div>
						<div class= "div_height">
						<li class="text-areaw">
						    <label class="sub_label" for="text-area-0">
						        <span></span>
						        <div class="sub_div">총 경력&nbsp;</div>
						    </label>
						    <div class="sub_div2">
						        <input type="text" id="text-area-1" class="inputClass1" name="experience"/><span>년</span>
						    </div>
						</li>
						</div>
						<div class= "div_height">
						<li class="text-areaw">
						    <label class="sub_label" for="text-area-0">
						        <span></span>
						        <div class="sub_div">연락 가능한 시간&nbsp;</div>
						    </label>
						    <div class="sub_div2">
						        <input type="text" id="text-area-2" class="inputClass2" name="startTime"/><span>시</span>
						        <div>~</div>
						        <input type="text" id="text-area-3" class="inputClass3" name="endTime"/><span>시</span>
						    </div>
						</li>
						</div>
						<div class= "div_height">
						<li class="text-areaw">
						    <label class="sub_label" for="text-area-0">
						        <span></span>
						        <div class="sub_div">사업장 주소&nbsp;</div>
						    </label>
						    <div class="sub_div2">
						        <input type="text" id="text-area-5" class="inputClass5" name="address" placeholder="시 / 구 입력해주세요."/>
						    </div>
						</li>
						</div>
					</div>
				</div>
				<div id="quest3" style="display:none;">
				    <li class="text-area">
				        <label for="text-area-0">
				        <span></span>
				        </label>
				        <div class="sub_div3">
				        <textarea id="text-area-4" class="inputClass4" placeholder="20자 이상 작성해주세요." name="intro"></textarea>
				        </div>
				    </li>
				</div>
			   
	            <div id="selBtn">
			         <input type="button" value="다음" class="nextBtn" onclick="next();"/>	
		         </div>
			</form>
          </div>
          
      </div>
      </div>
      <div class="main2">
       	<h4>Surion은 어떤 곳인가요?</h4>
				<p>서비스가 필요한 고객과 서비스를 제공하는 숨은 고수를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다.
					1분 내외의 요청서를 작성하면, 여러 고수님들이 맞춤형 견적을 보내드려요. 맘에 쏙 드는 고수의 맞춤형 서비스를
					받아보세요.</p>
				<h4>모든 분야의 고수만을 모았다!</h4>
				<p>수리 및 무언가를 원하시나요? 모든 물건은 그에 맞는 수리법이 있는 것인데, 숨고에는 다양한 경력의 수리
					전문가가 활동하고 있어요. 지금 바로 요청서를 작성하시고, 쉽고 간편하게 전문가님과 상담해보세요!</p>
				<h3>
					내가 찾는 고수<br> Surion에서 만나세요 &#128161;
				</h3>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>
	<script>
	
console.clear();
('use strict');



// Drag and drop - single or multiple image files
// https://www.smashingmagazine.com/2018/01/drag-drop-file-uploader-vanilla-js/
// https://codepen.io/joezimjs/pen/yPWQbd?editors=1000
(function () {

  'use strict';
  
  // Four objects of interest: drop zones, input elements, gallery elements, and the files.
  // dataRefs = {files: [image files], input: element ref, gallery: element ref}

  const preventDefaults = event => {
    event.preventDefault();
    event.stopPropagation();
  };

  const highlight = event =>
    event.target.classList.add('highlight');
  
  const unhighlight = event =>
    event.target.classList.remove('highlight');

  const getInputAndGalleryRefs = element => {
    const zone = element.closest('.upload_dropZone') || false;
    const gallery = zone.querySelector('.upload_gallery') || false;
    const input = zone.querySelector('input[type="file"]') || false;
    return {input: input, gallery: gallery};
  }

  const handleDrop = event => {

    const dataRefs = getInputAndGalleryRefs(event.target);
    dataRefs.files = event.dataTransfer.files;
    handleFiles(dataRefs);
  }


  const eventHandlers = zone => {

    const dataRefs = getInputAndGalleryRefs(zone);
    if (!dataRefs.input) return;

    // Prevent default drag behaviors
    ;['dragenter', 'dragover', 'dragleave', 'drop'].forEach(event => {
      zone.addEventListener(event, preventDefaults, false);
      document.body.addEventListener(event, preventDefaults, false);
    });

    // Highlighting drop area when item is dragged over it
    ;['dragenter', 'dragover'].forEach(event => {
      zone.addEventListener(event, highlight, false);
    });
    ;['dragleave', 'drop'].forEach(event => {
      zone.addEventListener(event, unhighlight, false);
    });

    // Handle dropped files
    zone.addEventListener('drop', handleDrop, false);

    // Handle browse selected files
    dataRefs.input.addEventListener('change', event => {
      dataRefs.files = event.target.files;
      handleFiles(dataRefs);
    }, false);

  }


  // Initialise ALL dropzones
  const dropZones = document.querySelectorAll('.upload_dropZone');
  console.log(dropZones);
  for (const zone of dropZones) {
    eventHandlers(zone);
  }


  // No 'image/gif' or PDF or webp allowed here, but it's up to your use case.
  // Double checks the input "accept" attribute
  const isImageFile = file => 
    ['image/jpeg', 'image/png', 'image/svg+xml'].includes(file.type);


  function previewFiles(dataRefs) {
    if (!dataRefs.gallery) return;
    for (const file of dataRefs.files) {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onloadend = function() {
        let img = document.createElement('img');
        img.className = 'upload_img mt-2';
        img.setAttribute('alt', file.name);
        img.src = reader.result;
        dataRefs.gallery.appendChild(img);
      }
    }
  }

  // Based on: https://flaviocopes.com/how-to-upload-files-fetch/
  const imageUpload = dataRefs => {
    // Multiple source routes, so double check validity
    if (!dataRefs.files || !dataRefs.input) return;

    const url = dataRefs.input.getAttribute('data-post-url');
    if (!url) return;

    const name = dataRefs.input.getAttribute('data-post-name');
    if (!name) return;

    const formData = new FormData();
    formData.append(name, dataRefs.files);

    fetch(url, {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      console.log('posted: ', data);
      
      if (data.success === true) {
        previewFiles(dataRefs);
      } else {
        console.log('URL: ', url, '  name: ', name)
      }
    })
    .catch(error => {
      console.error('errored: ', error);
    });
  }


  // Handle both selected and dropped files
  const handleFiles = dataRefs => {

    let files = [...dataRefs.files];

    // Remove unaccepted file types
    files = files.filter(item => {
      if (!isImageFile(item)) {
        alert('Not an image, ', item.type);
      }
      return isImageFile(item) ? item : null;
    });

    if (!files.length) return;
    dataRefs.files = files;

    previewFiles(dataRefs);
    imageUpload(dataRefs);
  }

})();




//여기부터 제이쿼리

var barElem = document.querySelector('.bar'); // 로딩바 막대
var barPercent = document.querySelector('.barPercent'); // 로딩바 수치 % 
var service = document.querySelector('.service'); // 로딩바 밑에 있는 헤더 글귀

$(function(){
	var frm = $('#imageUp');
	var frmData;
});

function checkOnlyOne(clickedCheckbox) {
	  // 체크된 체크박스의 value 값을 가져옵니다.
	  var selectedValue = clickedCheckbox.value;

	  // 클래스가 selClass인 체크박스들을 모두 선택 해제합니다.
	  $('.selClass').prop('checked', false);

	  // 클릭된 체크박스만 선택합니다.
	  $(clickedCheckbox).prop('checked', true);
	}
	
	

//2
function next(){
	
	if (!$('.selClass').is(':checked')) {
		alert('하나 이상의 항목을 선택해주세요.');
		return;
	}
	
	$('#quest1').css('display', 'none');
	$('#quest2').css('display', 'block');
	$('#quest3').css('display', 'none');
	$('#selBtn').html("<input type='button' value='이전' class='prevBtn' onclick='pre1();'/><input type='button' value='다음' class='nextBtn' onclick='next1();'/>")
	
	
	
	service.textContent = '상점 정보를 입력해주세요.';
	barElem.style.width = 33 + "%";
	barPercent.textContent = '33%';
	
	
}

//3
function next1(){
	$('#quest1').css('display', 'none');
	$('#quest2').css('display', 'none');
	$('#quest3').css('display', 'block');
	$('#selBtn').html("<input type='button' value='이전' class='prevBtn' onclick='pre2();'/><input type='button' value='다음' class='nextBtn' onclick='next2();'/>")
	
	service.textContent = '상세정보를 입력해주세요.';
	barElem.style.width = 66 + "%";
	barPercent.textContent = '66%';
}

//4
function next2(){
	$('#quest1').css('display', 'none');
	$('#quest2').css('display', 'none');
	$('#quest3').css('display', 'none');
	$('#imageUp').css('display', 'block');
	$('#selBtn').html("<input type='button' value='이전' class='prevBtn' onclick='pre3();'/><input type='submit' value='등록' class='nextBtn'/>")
	
	service.textContent = '사진을 등록해주세요.';
	barElem.style.width = 99 + "%";
	barPercent.textContent = '99%';
	
}


// 2 - 1 
function pre1(){
	$('#quest1').css('display', 'block');
	$('#quest2').css('display', 'none');
	$('#quest3').css('display', 'none');
	$('#selBtn').html("<input type='button' value='다음' class='nextBtn' onclick='next();'/>")
	
	service.textContent = '어떤 서비스를 지원하시나요?';
	barElem.style.width = 0 + "%";
	barPercent.textContent = '0%';	
}

// 3 - 2
function pre2(){
	$('#quest1').css('display', 'none');
	$('#quest2').css('display', 'block');
	$('#quest3').css('display', 'none');
	$('#selBtn').html("<input type='button' value='이전' class='prevBtn' onclick='pre1();'/><input type='button' value='다음' class='nextBtn' onclick='next1();'/>")
	
	service.textContent = '상점 정보를 입력해주세요.';
	barElem.style.width = 33 + "%";
	barPercent.textContent = '33%';
}


// 4 - 3
function pre3(){
	$('#quest1').css('display', 'none');
	$('#quest2').css('display', 'none');
	$('#quest3').css('display', 'block');
	$('#imageUp').css('display', 'none');
	$('#selBtn').html("<input type='button' value='이전' class='prevBtn' onclick='pre2();'/><input type='button' value='다음' class='nextBtn' onclick='next2();'/>")
	
	service.textContent = '상세정보를 입력해주세요.';
	barElem.style.width = 66 + "%";
	barPercent.textContent = '66%';
}


</script>
</body>
</html>
