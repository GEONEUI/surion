<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>수리플랫폼</title>
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;1,100;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">	
	<style>


	/* reset css  */
	@import url("https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css");
	*{
		padding:0;
		margin:0;
		box-sizing:border-box;
	}

	figure{
		margin: 0;
	}

	ul,li{
		list-style:none;
		margin: 0;
		padding: 0;
	}

	a{
		text-decoration: none;
		color: #333;
	}

	.suriSize{
		width: 1200px;
		margin:0 auto;
		padding: 0 16px;
	}
	.st{
		margin-top: 70px;
	}

	@media(max-width:1100px){
		.suriSize{
			width: 100%;
		}
	}



	li{
		list-style:none;
	}

	a{
		text-decoration: none;
		color: #000;
	}

	body{
		font-family: 'Noto Sans KR', sans-serif;
		letter-spacing:-1px;
		margin: 0 !important;
		padding-top: 13vh;
	}

	

		/* media */

	@media(max-width:1200px){
		.suriSize{
			width: 100%;
		}
		.uinner{
			width: 100% !important;
		}
		.askList a{
			width:31% !important;
		}
	}	

	@media(max-width:1024px){
		.askList a{
			width:42% !important;
		}
	}	



	</style>
</head>