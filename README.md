# MeisterProject
크몽 과 숨고 사이트를 참고하여 만든 홈페이지!<br>
<img src="https://user-images.githubusercontent.com/92138800/207755353-c7b6ad32-55aa-4967-8cd8-f02b9d666333.png" width="300"/>
<br><br>

## :dizzy: 프로젝트 기간 
2022.10.23 ~ 2022.12.01
<br><br>

## :question: 프로젝트 기획의도 
- N잡러, 부캐 시대에 맞춘 또 다른 수익 창출을 위한 나의 재능 판매
- 코로나로 인해 자연스럽게 자리잡은 온라인과 오프라인으로 받는 코칭
- 본인익 가진 재능으로 인한 리스크없이 도전 가능
<br><br>

## :waxing_crescent_moon: 멤버소개
> <b>팀장 : 정승필 : 모든페이지 </b><br>
> 팀원1 : 양진호 : 재능판매게시글 상세보기, 등록하기, 결제API<br>
> 팀원2 : 김혜리 : 재능판매페이지, 검색, 디자인<br>
> 팀원3 : 이이수 : 커뮤니티<br>
> 팀원4 : 유홍상 : 커뮤니티<br>
> 팀원5 : 한대웅 : 마이페이지, 채팅, 리뷰
<br>

## :first_quarter_moon: 개발환경
- HTML5 & CSS3
- JavaScript
- ajax
- jQuery
- OracleDB
- Eclipse (java11)
- tomcat9
<br>

## :waxing_gibbous_moon: 코드리뷰
Dao의 일부분<br>
```
// 판매게시판 메인 리스트와 페이징처리
public ArrayList<SellBoard> selectSellBoardList(Connection conn, PageInfo pi , int local_no, int interest_no ){

  ArrayList<SellBoard> list = new ArrayList<>();

  PreparedStatement psmt = null;
  ResultSet rset = null;
  String sql = prop.getProperty("selectSellBoardList");
  if(local_no == 0) {
    sql = sql.replace("$1", "");
  }else {
    sql = sql.replace("$1", "AND LOCAL_NO = ?");
  }
  if(interest_no == 0) {
    sql = sql.replace("$2", "");
  }else {
    sql = sql.replace("$2", "AND INTEREST_NO = ?");
  }

  try {
  psmt = conn.prepareStatement(sql);

  int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
  int endRow = startRow + pi.getBoardLimit() -1;

  int i =1;

  if(local_no != 0 && interest_no != 0) {
    psmt.setInt(i++, local_no);
    psmt.setInt(i++, interest_no);	
  }else if(local_no != 0){
    psmt.setInt(i++, local_no);
  }else if(interest_no != 0){
    psmt.setInt(i++, interest_no);
  }

  psmt.setInt(i++, startRow);
  psmt.setInt(i++, endRow);

  rset = psmt.executeQuery();

  while(rset.next()) {
    list.add(new SellBoard(rset.getInt("SELL_NO"),
                rset.getString("SELL_TITLE"),
                rset.getInt("PRICE"),
                rset.getInt("SELL_RECOMMEND"),
                rset.getDate("SELL_DATE"),
                rset.getInt("INTEREST_NO"),
                rset.getInt("LOCAL_NO"),
                rset.getString("NICKNAME"),
                rset.getString("TITLEIMG"),
                rset.getString("LOCAL_NAME"),
                rset.getString("INTEREST_NAME")));
  }
} catch (SQLException e) {
  e.printStackTrace();
}finally {
  close(rset);
  close(psmt);
}
  return list;

}
```
<br>

mapper 의 일부분
```
<!-- 판매게시판 메인 리스트 조회와 페이징처리 -->
<entry key="selectSellBoardList">
SELECT *
FROM (SELECT ROWNUM RNUM,
    A.*
    FROM  (SELECT  S.SELL_NO AS SELL_NO,
                S.SELL_TITLE AS SELL_TITLE,
                S.PRICE AS PRICE,
                S.SELL_RECOMMEND AS SELL_RECOMMEND,
                S.SELL_DATE AS SELL_DATE,
                INTEREST_NO AS INTEREST_NO,
                LOCAL_NO AS LOCAL_NO,
                M.NICKNAME AS NICKNAME,
                FILE_PATH || CHANGE_NAME AS TITLEIMG,
                USER_NO,
                LOCAL_NAME,
                INTEREST_NAME
        FROM SELL S
        JOIN MEMBER M USING (USER_NO)
        JOIN ATTACHMENT A ON (A.REF_NO = S.SELL_NO)
        JOIN INTEREST I USING (INTEREST_NO)
                  JOIN LOCAL L USING (LOCAL_NO)
        WHERE S.STATUS = 'Y' AND FILE_LEVEL=2
        $1
        $2
        ORDER BY SELL_DATE DESC) A
    )
  WHERE RNUM BETWEEN ? AND ?
</entry>
```


## :full_moon: 주요기능
<table>
  <tr>
    <th width="500px">메인페이지</th>
  </tr>
  <tr>
    <td>
      <img src="https://user-images.githubusercontent.com/92138800/210165689-6d9f4dd2-7f13-49ac-a173-e0a0cdba8d6a.gif" width="500" height="500" />            </td>
  </tr>
    <tr>
      <th width="500px">판매페이지 등록하기</th>
      <th width="500px">판매페이지 하기</th>
    </tr>
    <tr>
    <td>
      <img src="https://user-images.githubusercontent.com/92138800/210165689-6d9f4dd2-7f13-49ac-a173-e0a0cdba8d6a.gif" width="500" height="500" />            </td>
  </tr>
</table>

```
zz
```

___
***
___
