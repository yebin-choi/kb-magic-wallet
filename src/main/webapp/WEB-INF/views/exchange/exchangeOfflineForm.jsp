<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jiwon
  Date: 2023-09-11
  Time: 오후 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>깨비의 요술 지갑 - 환전</title>

    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../../../assets/vendor/fonts/boxicons.css"/>

    <!-- Core CSS -->
    <link rel="stylesheet" href="../../../assets/vendor/css/core.css" class="template-customizer-core-css"/>
    <link rel="stylesheet" href="../../../assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
    <link rel="stylesheet" href="../../../assets/css/demo.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../../../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../../../assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../../../assets/js/config.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ncpClientId는 등록 환경에 따라 일반(ncpClientId), 공공(govClientId), 금융(finClientId)으로 나뉩니다. 사용하는 환경에 따라 키 이름을 변경하여 사용하세요. 참고: clientId(네이버 개발자 센터)는 지원 종료 -->
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk"></script>

</head>
<body>

<script>
    $(document).ready(function () {
        $("#saveChangesButton").click(function () {
            handleEnter()
        });
    });

    function summitForm() {
        $("#offlineReceiptForm").submit();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const walletSelect = document.getElementById("walletSelect");
        const walletOptions = walletSelect.querySelectorAll('option');
        const personalWalletRadio = document.querySelector('input[value="0"]');
        const groupWalletRadio = document.querySelector('input[value="1"]');

        // 초기화 함수
        function initializeSelectOptions() {
            const selectedRadio = document.querySelector('input[name="walletType"]:checked');
            const selectedValue = selectedRadio ? selectedRadio.value : "0"; // 기본값은 개인지갑

            walletOptions.forEach((option) => {
                const optionType = option.getAttribute("data-type");
                if ((selectedValue === "0" && optionType === "PERSONAL_WALLET") ||
                    (selectedValue === "1" && optionType === "GROUP_WALLET")) {
                    option.style.display = 'block'; // 해당 지갑 유형의 옵션 표시
                } else {
                    option.style.display = 'none'; // 해당 지갑 유형이 아닌 옵션 숨기기
                }
            });
        }

        // 초기화 함수 호출
        initializeSelectOptions();

        // 라디오 버튼 변경 이벤트 처리
        personalWalletRadio.addEventListener("change", initializeSelectOptions);
        groupWalletRadio.addEventListener("change", initializeSelectOptions);
    });

    document.addEventListener("DOMContentLoaded", function () {
        const walletSelect = document.getElementById("walletSelect");
        const walletOptions = walletSelect.querySelectorAll('option');
        const personalWalletRadio = document.querySelector('input[value="0"]');
        const groupWalletRadio = document.querySelector('input[value="1"]');

        // 초기화 함수
        function initializeSelectOptions() {
            const selectedRadio = document.querySelector('input[name="walletType"]:checked');
            const selectedValue = selectedRadio ? selectedRadio.value : "0"; // 기본값은 개인지갑

            walletOptions.forEach((option) => {
                const optionType = option.getAttribute("data-type");
                const optionRole = option.getAttribute("data-role");

                if ((selectedValue === "0" && optionType === "PERSONAL_WALLET") ||
                    (selectedValue === "1" && optionType === "GROUP_WALLET")) {
                    option.style.display = 'block'; // 해당 지갑 유형의 옵션 표시
                } else {
                    option.style.display = 'none'; // 해당 지갑 유형이 아닌 옵션 숨기기
                }

                if (optionRole === "GENERAL") {
                    option.disabled = true; // "GENERAL" 역할의 옵션 비활성화
                    option.style.color = "#D8D8D8"; // 비활성화된 텍스트 색상
                    option.style.backgroundColor = "#F2F2F2"; // 비활성화된 배경 색상
                }
            });
        }

        // 초기화 함수 호출
        initializeSelectOptions();

        // 라디오 버튼 변경 이벤트 처리
        personalWalletRadio.addEventListener("change", initializeSelectOptions);
        groupWalletRadio.addEventListener("change", initializeSelectOptions);
    });

    /*document.addEventListener("DOMContentLoaded", function () {

        const walletSelect = document.getElementById("walletSelect");
        const walletOptions = walletSelect.querySelectorAll('option');
        const personalWalletRadio = document.querySelector('input[value="0"]');
        const groupWalletRadio = document.querySelector('input[value="1"]');

        // 초기화 함수
        function initializeSelectOptions() {
            const selectedRadio = document.querySelector('input[name="walletType"]:checked');
            const selectedValue = selectedRadio ? selectedRadio.value : "0"; // 기본값은 개인지갑

            walletOptions.forEach((option) => {
                const optionType = option.getAttribute("data-type");
                const optionRole = option.getAttribute("data-role");

                console.log(optionRole)

                if ((selectedValue === "0" && optionType === "PERSONAL_WALLET") ||
                    (selectedValue === "1" && optionType === "GROUP_WALLET")) {
                    option.style.display = 'block'; // 해당 지갑 유형의 옵션 표시
                } else {
                    option.style.display = 'none'; // 해당 지갑 유형이 아닌 옵션 숨기기
                }

                if (optionRole === "GENERAL") {
                    option.disabled = true; // "GENERAL" 역할의 옵션 비활성화
                    option.style.color = "#D8D8D8"; // 비활성화된 텍스트 색상
                    option.style.backgroundColor = "#F2F2F2"; // 비활성화된 배경 색상
                }
            });
        }

        // 초기화 함수 호출
        initializeSelectOptions();

        // 라디오 버튼 변경 이벤트 처리
        personalWalletRadio.addEventListener("change", initializeSelectOptions);
        groupWalletRadio.addEventListener("change", initializeSelectOptions);
    });*/


    /*   function validateForm() {
           // 모든 요소가 입력되었는지 검사
           const currencyCode = document.forms["offlineReceiptForm"]["currencyCode"].value;
           const amount = document.forms["offlineReceiptForm"]["amount"].value;
           const walletType = document.forms["offlineReceiptForm"]["walletType"].value;
           const walletId = document.forms["offlineReceiptForm"]["walletId"].value;
           const bankId = document.forms["offlineReceiptForm"]["bankId"].value;
           const receiptDate = document.forms["offlineReceiptForm"]["receiptDate"].value;

           if (
               currencyCode === "통화선택" ||
               amount === "" ||
               walletType === "" ||
               walletId === "지갑을 선택하세요" ||
               bankId === "수령 지점을 선택하세요" ||
               receiptDate === ""
           ) {
               alert("모든 값을 입력해주세요.");
               return false;
           }

           // amount가 0 이상인지 검사
           if (parseFloat(amount) <= 49) {
               alert("금액은 50 이상이어야 합니다.");
               return false;
           }

           // 지갑 잔액 확인 여부 검사
           const walletBalance = document.getElementById("walletBalance").value;
           if (walletBalance === "") {
               alert("지갑 잔액을 확인해주세요.");
               return false;
           }

           // 모든 검사 통과 시 폼 제출
           return true;
       }*/

    let expectedAmountCK = () => {
        var code = $('select[name="currencyCode"]').val();
        var amount = $('input[name="amount"]').val();

        let data = {
            code: code,
            amount: amount
        }

        // AJAX POST 요청
        $.ajax({
            type: "post",
            url: "/exchange/expectedAmount",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json", // 예상되는 응답 형식(JSON 등)
            success: function (response) {
                // 성공 시 실행할 코드
                $('#expectedAmount').attr('placeholder', response.expectedAmount.toLocaleString());
                $('#tradingBaseRate').attr('placeholder', response.tradingBaseRate.toLocaleString());
                $('#applicableExchangeRate').attr('placeholder', response.applicableExchangeRate.toLocaleString());
            },
            error: function (error) {
                // 오류 발생 시 실행할 코드
                console.error("오류: " + error);
            }
        });
    }

    let balanceCK = () => {
        let walletId = $('select[name="walletId"]').val();
        let walletType = $('input[name="walletType"]:checked').val();

        let data = {
            walletId: walletId,
            walletType: walletType
        }

        // AJAX POST 요청
        $.ajax({
            type: "post",
            url: "/exchange/walletBalance",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "json", // 예상되는 응답 형식(JSON 등)
            success: function (response) {
                // 성공 시 실행할 코드
                $('#walletBalance').attr('placeholder', response.toLocaleString());
                $('#walletBalance').val(response.toLocaleString());
            },
            error: function (error) {
                // 오류 발생 시 실행할 코드
                console.error("오류: " + error);
            }
        });
    }

    let bankCK = () => {

        let bankSelect = document.getElementById("bankSelect");
        let bankId = bankSelect.value;
        // alert("bankCK");
        $.ajax({
            url: "/bank/" + bankId,
            type: "GET",
            contentType: "application/json",
            dataType: "json", // 예상되는 응답 형식(JSON 등)
            success: function (response) {
                console.log(response);

                // 리턴 받은 좌표 값을 변수에 저장
                let x = response.lng;
                let y = response.lat;
                console.log(x);
                console.log(y);

                // 지도 생성
                map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(y, x), // 지도를 열 좌표
                    zoom: 18
                });

                // 지도에 해당 좌표 마커(아이콘 설정)
                marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(y, x),
                    map: map
                });
            },
            error: function (error) {
                // 오류 발생 시 실행할 코드
                console.error("오류: " + error);
            }
        });
    }

</script>

<jsp:include page="../common/navbar.jsp"></jsp:include>
<div class="pageWrap">
    <div class="center">
        <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
                <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">환전/</span>오프라인</h4>
                <!-- Basic Layout -->
                <form id="offlineReceiptForm" action="${pageContext.request.contextPath}/exchange/offline/form"
                      method="post">
                    <div class="row">
                        <div class="row align-items-start">
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0">환전 정보</h4>
                                    <small class="text-muted float-end"></small>
                                </div>
                                <div class="card-body">

                                    <div class="row gx-3 gy-2 align-items-center">
                                        <div class="col-2">
                                            환전 신청 금액
                                        </div>
                                        <div class="col-2">
                                            <select class="form-select color-dropdown" name="currencyCode">
                                                <option selected>통화선택</option>
                                                <option value="1">USD</option>
                                                <option value="2">JPY</option>
                                            </select>
                                        </div>
                                        <div class="col-5">
                                            <input type="number" class="form-control" placeholder="최소금액 50"
                                                   name="amount">
                                        </div>
                                        <div class="col-3">
                                            <button type="button" class="btn btn-primary"
                                                    onclick="expectedAmountCK();">환전 예상 금액 확인
                                            </button>
                                        </div>
                                        <div id="">
                                            <label class="form-label">출금금액</label>
                                            <input type="text" id="expectedAmount" class="form-control" placeholder=""
                                                   readonly/>

                                            <label class="form-label">현재 고시 환율</label>
                                            <input type="text" id="tradingBaseRate" class="form-control" placeholder=""
                                                   readonly/>

                                            <label class="form-label">적용 환율</label>
                                            <input type="text" id="applicableExchangeRate" class="form-control"
                                                   placeholder="" readonly/>
                                            <div class="form-text">* 환율 변동에 따라 예상 원화금액과 실제 출금금액 간에 차이가 발생할 수 있습니다.
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            환전 사유
                                        </div>
                                        <div class="col-10">
                                            <select class="form-select color-dropdown">
                                                <option selected>관광, 친지방문 등 일반 해외경비</option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row align-items-center">
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">출금 지갑 선택</h5>
                                    <small class="text-muted float-end"></small>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-2 form-check">
                                            <input class="form-check-input" type="radio" name="walletType" value="0"
                                                   checked>
                                            <label class="form-check-label">개인지갑</label>
                                        </div>
                                        <div class="col-2 form-check">
                                            <input class="form-check-input" type="radio" name="walletType" value="1">
                                            <label class="form-check-label">모임지갑</label>
                                        </div>
                                    </div>
                                    <div class="row gx-3 gy-2 align-items-center">
                                        <div class="col-10">
                                            <select id="walletSelect" class="form-select color-dropdown"
                                                    name="walletId">
                                                <option selected>지갑을 선택하세요</option>
                                                <c:forEach items="${walletList}" var="wallet" varStatus="loop">
                                                    <option value="${wallet.walletId}" data-role="${wallet.role}"
                                                            data-type="${wallet.walletType}">${wallet.nickname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-2">
                                            <button type="button" class="btn btn-primary"
                                                    onclick="balanceCK();">지갑 잔액 확인
                                            </button>
                                        </div>
                                        <div id="##">
                                            <label class="form-label">지갑잔액</label>
                                            <input id="walletBalance" type="text" class="form-control"
                                                   placeholder="지갑 잔액을 확인하세요" readonly/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row align-items-end">
                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0">수령 정보</h4>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        수령희망지점
                                        <label class="form-label"></label>
                                        <div class="input-group input-group-merge">
                                            <select id="bankSelect" class="form-select color-dropdown" name="bankId"
                                                    onchange="bankCK()">
                                                <option selected>수령 지점을 선택하세요</option>
                                                <c:forEach items="${bankList}" var="bank" varStatus="loop">
                                                    <option value="${bank.bankId}">${bank.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div id="mapImage" class="mb-3">
                                        은행 위치 마크
                                        <div id="map" style="width:100%;height:600px;"></div>
                                        <code id="snippet" class="snippet"></code>
                                        <script id="code">
                                            // var map = new naver.maps.Map('map', {
                                            //     center: new naver.maps.LatLng(37.3595704, 127.105399),
                                            //     zoom: 15
                                            // });
                                            //
                                            // var marker = new naver.maps.Marker({
                                            //     position: new naver.maps.LatLng(37.3595704, 127.105399),
                                            //     map: map
                                            // });
                                        </script>
                                    </div>

                                    <div class="mb-3">
                                        수령희망날짜
                                        <label class="form-label"></label>
                                        <div class="input-group input-group-merge">
                                            <input id="receiptDate" class="form-control form-label"
                                                   type="datetime-local" name="receiptDate">
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">수령 신청
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">결제 비밀번호 확인</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close">
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <jsp:include page="../common/virtualKeyboard.jsp"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                닫기
                                            </button>
                                            <button type="button" id="saveChangesButton" class="btn btn-primary">
                                                비밀번호 확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            </form>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>
