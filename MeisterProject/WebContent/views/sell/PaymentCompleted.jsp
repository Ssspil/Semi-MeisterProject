<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <h3>결제 완료</h3>

    <div style="border: 1px solid;">
        <div>
            결제가 정상적으로 완료되었습니다.
        </div>
        <div>
            상품명 : 
            <span>이미지</span>
            <span>판매글 제목</span>
        </div>
    </div>
<hr>
    <h3>결제 정보</h3>
    <div style="border: 1px solid;">
        <table>
            <tr>
                <td>
                    주문 합계 금액
                </td>
                <td>

                </td>
                <td>
                    할인금액
                </td>
                <td>

                </td>
                <td>
                    최종결제금액
                </td>
            </tr>
            <tr>
                <td>
                    5,000원
                </td>
                <td>

                </td>
                <td>
                    0원
                </td>
                <td>

                </td>
                <td>
                    5,000원
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>

                </td>
                <td>
                    
                </td>
                <td>
                    결제수단 : 신용카드
                </td>
            </tr>

        </table>
    </div>
    <div>
    <button>쇼핑 계속하기</button>
    <button>결제내역보기</button>
    </div>




    <%@ include file="../common/footer.jsp" %>
</body>
</html>