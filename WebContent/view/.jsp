<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="../css/header.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<link rel="stylesheet" type="text/css" href="../css/product.css">


<div class="sc-gFXMyG eLuBBY">
	<div class="sc-gQNndl hAyfor">
		<nav class="sc-ecaExY kilEnt">
			<div class="sc-jMMfwr eCRUZo">
				<a class="sc-gbzWSY ikxKKP" href="/products/new">상품등록</a>
			</div>
			<div class="sc-jMMfwr cmoNXt">
				<a class="sc-gbzWSY ikxKKP" href="/products/manage">상품관리</a>
			</div>
			<div class="sc-jMMfwr cmoNXt">
				<a href="" target="_blank" rel="noopener noreferrer"
					class="sc-jqIZGH iQbNXO">구매/판매 내역</a>
			</div>
		</nav>
	</div>
	<div class="sc-guztPN jewnmT">
		<main class="sc-cFlXAS eCVIzW">
			<section class="sc-hcnlBt lbOuTv">
				<h2>
					<span style="text-align: center;">상품등록</span>
				</h2>
				<ul class="sc-hkbPbT gBKUKp">
					<li class="sc-jRhVzh bKbtZg"><div class="sc-iHhHRJ bqTuxH">
							상품이미지
						</div>
						<div class="sc-kqlzXE cVGKCL">
								<div class="sc-lnmtFM kBbiwa">
									<img src="" class="" width="150" height="150" id="preview-image">
									<a class="sc-clNaTc gCetdh">이미지 등록1
									<input type="file" id="input-image"
										accept="image/*" multiple=""></a>
									<img src="" class="rounded-circle" width="150" height="150" id="preview-image">
									<a class="sc-clNaTc gCetdh">이미지 등록2
									<input type="file" id="input-image"
										accept="image/*" multiple=""></a>
									<img src="" class="rounded-circle" width="150" height="150" id="preview-image">
									<a class="sc-clNaTc gCetdh">이미지 등록3
									<input type="file" id="input-image"
										accept="image/*" multiple=""></a>
								</div>
							<div class="sc-iuDHTM kAvIcl"></div>
							<div class="sc-cmTdod leeXYl">
								<div class="container">
								</div>
								<div class="sc-drlKqa iyOoTS">
									<button type="button" class="sc-bIqbHp catNaU">
										<img src="" width="34" height="32" alt="닫기 버튼 아이콘">
									</button>
									<div class="sc-jxGEyO gydguO">
										<div class="sc-gacfCG cwUnom">상품이미지</div>
										<div class="sc-dEfkYy hxXbNf"></div>
										<div class="sc-gNJABI hCjWzn"></div>
									</div>
								</div>
							</div>
						</div></li>
					<li class="sc-jRhVzh bKbtZg"><div class="sc-iHhHRJ gEbXZQ">
							제목<span>*</span>
						</div>
						<div class="sc-kqlzXE cVGKCL">
							<div class="sc-bYnzgO gBHliw">
								<div class="sc-OxbzP irhsQl">
									<input type="text" placeholder="상품 제목을 입력해주세요."
										class="sc-cPuPxo bwkwtE" value="">
								</div>
							</div>
						</div></li>
					<li class="sc-jRhVzh bKbtZg"><div class="sc-iHhHRJ iNPcdu">
							카테고리<span>*</span>
						</div>
						<div class="sc-kqlzXE cVGKCL">
							<div class="sc-ghsgMZ eyejLu">
								<div class="sc-dznXNo jijsAS">
									<ul class="sc-ekulBa ukfAV">
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">여성의류</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">남성의류</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">신발</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">가방</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">시계/쥬얼리</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">패션 액세서리</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">디지털/가전</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">스포츠/레저</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">차량/오토바이</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">스타굿즈</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">키덜트</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">예술/희귀/수집품</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">음반/악기</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">도서/티켓/문구</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">뷰티/미용</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">가구/인테리어</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">생활/가공식품</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">유아동/출산</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">반려동물용품</button></li>
										<li class="sc-ciodno fIrIxL"><button type="button"
												class="sc-gGCbJM cTFlBg">기타</button></li>
									</ul>
								</div>
							</div>
							<h3 class="sc-lcpuFF jBbfDp">
								선택한 카테고리 : <b></b>
							</h3>
						</div></li>
					<li class="sc-jRhVzh bKbtZg"><div class="sc-iHhHRJ gEbXZQ">
							가격<span>*</span>
						</div>
						<div class="sc-kqlzXE cVGKCL">
							<div class="sc-aewfc bUecNl">
								<input type="text" placeholder="숫자만 입력해주세요."
									class="sc-iIHjhz dGIRiA" value="">원
							</div>
						</div></li>
					<li class="sc-jRhVzh bKbtZg"><div class="sc-iHhHRJ iwrcUQ">설명</div>
						<div class="sc-kqlzXE cVGKCL">
							<textarea placeholder="상품 설명을 입력해주세요." rows="6"
								class="sc-dBAPYN keRYei"></textarea>
							<div class="sc-dvpmds ceBRdp"></div>
						</div></li>
					<li class="sc-jRhVzh bKbtZg">
						<div class="sc-kqlzXE cVGKCL">
							<button type="button" class="sc-cNQqM cuPGMJ">판매 등록</button>
						</div>
					</li>
				</ul>
			</section>
		</main>
	</div>
</div>
<script type="text/javascript">
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        reader.readAsDataURL(input.files[0])
    }
} 
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
</script>
<%@include file="../include/footer.jsp"%>