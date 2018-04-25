<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>회원가입</title>

<script language="javascript">

function validate() {
	//event.preventDefault();
	var objID = document.getElementById("my_id");
	var objPwd1 = document.getElementById("my_pwd1");
	var objPwd2 = document.getElementById("my_pwd2");
	var objEmail = document.getElementById("my_mail");
	var objName = document.getElementById("my_name");
	var objNum1 = document.getElementById("my_num1");
	var objNum2 = document.getElementById("my_num2");

	var arrNum1 = new Array();
	var arrNum2 = new Array();

	var tempSum=0;//주민번호 합을 넣는 공간

	//아이디와 패스워드 값 데이터 유효성 체크
	
	var regul1 = /^[a-zA-Z0-9]{4,12}$/;
	//이메일 값 데이터 유효성 체크
	//[]안에 있는 값만 쓰겠다
	var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	var regul3 = /^[가-힝a-zA-Z]{2,}$/;
	//var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	//아이디 입력 하지 않았을 경우
	if ((objID.value) == ""){
		alert("아이디를 입력하지 않았습니다.");
		objID.focus();
		return false;
	}
	//아이디 유효성 검사
	//내가 입력한 데이터를 검사하는 check()
	//만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
	if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
		return false;//반환 할 곳 없이 if문 탈출
	}
	//비밀번호 입력 하지 않았을 경우
	if ((objPwd1.value) == ""){
		alert("비밀번호를 입력해 주세요");
		objPwd1.focus();
		return false;
	}
	if ((objPwd2.value=="")){
		alert("비밀번호를 입력해 주세요");
		objPwd2.focus();
		return false;
	}

	//비밀번호 유효성 검사
	//만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
	if (!check(regul1,objPwd1,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
		return false;
	}
	
	//비밀번호와 비밀번호 확인이 일치 하지 않을 경우
	if ((objPwd1.value)!=(objPwd2.value)) {
		alert("비밀번호가 일치 하지 않습니다.");
		objPwd1.focus();
		objPwd2.focus();
		return false;
	}
	//이메일 입력 안했을 경우
	if ((objEmail.value)=="") {
		alert("이메일을 입력해 주세요");
		objEmail.focus();
		return false;
	}
	//이메일이 잘못된 경우
	if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
		return false;
	}
	//이름 입력 안 한 경우
	if ((objName.value)=="") {
		alert("이름을 입력해 주세요");
		objName.focus();
		return false;
	}
	//이름에 특수 문자가 들어간 경우
	if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
		return false;
	}

	//주민번호 앞자리를 각 배열에 넣어 검색 및 비교하기위한 단계
	//앞자리 값 만큼 돌림
	for (var i = 0; i <objNum1.value.length; i++) {
		//배열 칸마다 앞자리 값 하나씩 넣어줌
		arrNum1[i]=objNum1.value.charAt(i);
	}

	//주민번호 뒷자리를 각 배열에 넣어 검색 및 비교하기위한 단계
	//뒷자리 값 만큼 돌림
	for (var i = 0; i <objNum2.value.length; i++) {
		//배열 칸마다 뒷자리 값 하나씩 넣어줌
		arrNum2[i]=objNum2.value.charAt(i);
	}
	//주민번호 앞자리를 tempSum에 집어 넣기
	//앞자리 만큼 돌림
	for (var i = 0; i <objNum1.value.length; i++) {
		//tempSum에 앞자리를 연이어 넣어줌
		tempSum += arrNum1[i]*(2+i);
	}
	//주민번호 뒷자리를 tempSum에 집어 넣기
	//뒷자리 -1을 해주는 이유 : 뒷자리 마지막 자리는 더할 필요 없어서
	//뒷자리의 -1만큼 돌림
	for (var i = 0; i <objNum2.value.length-1; i++) {
		//뒷자리 2번째 자리 부터 
		if (i>=2) {
			//tempSum에 2~6번째까지 넣어줌
			tempSum += arrNum2[i]*i;
		}else{//뒷자리 0~1번째 자리
			//tempSum에 0~1번째까지 넣어줌
			tempSum += arrNum2[i]*(8+i);
		}
	}
	//주민번호 유효성 체크
	//주민번호 구하는 식
	if (((11-(tempSum%11))%10)!=arrNum2[6]) {
		alert("올바른 주민 번호가 아닙니다.");
		objNum1.value="";
		objNum2.value="";
		objNum1.focus();
		return false;
	}
	
	//주민번호를 입력하면 생년월일이 자동으로 입력된다.
	//substring은 시작문자와 끝문자를 검색하는 역할
	if (arrNum2[0]==1 || arrNum2[0]==2) {//1900년생 일때
		var y = parseInt(objNum1.value.substring(0,2));
		var m = parseInt(objNum1.value.substring(2,4));
		var d = parseInt(objNum1.value.substring(4,6));
		//년도,월,일을 각각 구함
		f.my_birth.value = 1900+y;//년도
		f.month.value = m;//월
		f.day.value = d;//일
	}else if(arrNum2[0]==3||arrNum2[0]==4){//2000년생 일때
		var y = parseInt(objNum1.value.substring(0,2));
		var m = parseInt(objNum1.value.substring(2,4));
		var d = parseInt(objNum1.value.substring(4,6));
		
		f.my_birth.value = 2000+y;//년도
		f.month.value = m;//월
		f.day.value = d;//일
	}
	
	//관심분야가 하나라도 체크 되지 않은 경우
	if (f.chk[0].checked == false &&f.chk[1].checked == false &&f.chk[2].checked == false &&f.chk[3].checked == false &&f.chk[4].checked == false) {
		alert("관심분야를 체크해 주세요");
		return false;
	}
	//자기소개 1글자라도 적지 않은 경우
	if (f.my_intro.value=="") {
		alert("자기소개를 입력해주세요");
		return false;
	}
}
function check(re,what,message){//정규화데이터,아이템 id,메세지
	if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
	//만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
}

</script>


</head>
<body>

<p>
	<h1 align="center">회원 가입</h1>
</p>
<div align="legt"><tap>
만든이 : jerry</div><br>
<FORM name="f" action="beanResult.jsp" method="post" onsubmit="return validate();">
<table width="50%" height="80" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#9999FF">
	<tr align="center">
		<td colspan="2" align="cener" bgcolor="skyblue">
			<div style="font-weight: bold; font-size: 18px">회원 기본 정보
			</div></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center">
			<div style="font-weight: bold;">아이디:
			</div></td>
		<td>&nbsp<input type="text" name="my_id" id="my_id" size="12" maxlength="12">&nbsp4~12자의 영문 대소문자와 숫자로만 입력</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호:</div></td>
		<td>&nbsp<input type="password" name="my_pwd1" id="my_pwd1" size="12" maxlength="12">&nbsp4~12자의 영문 대소문자와 숫자로만 입력</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">비밀번호 확인:</div></td>
		<td>&nbsp<input type="password" name="my_pwd2" id="my_pwd2" size="12" maxlength="12"></td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">메일주소:</div></td>
		<td>&nbsp<input type="text" name="my_mail" id="my_mail" size="30" maxlength="30">&nbsp예)id@domain.com</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">이름:</div></td>
		<td>&nbsp<input type="text" name="my_name" id="my_name" size="10" maxlength="10"></td>
	</tr>
	<tr align="center">
		<td colspan="2" bgcolor="skyblue">
			<div style="font-weight: bold; font-size: 18px">개인 신상 정보
			</div></td>
		
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">주민등록번호:</div></td>
		<td>&nbsp<input type="text" name="my_num1" id="my_num1" size="6" maxlength="6">&nbsp -&nbsp <input type="password" name="my_num2" id="my_num2" size="7" maxlength="7">&nbsp예)123456-1234567</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">생일:</div></td>
		<td>&nbsp<input type="text" name="my_birth" id="my_birth" size="4" maxlength="4">년
			&nbsp
			<select id="month" name="month" >
    		<option value="1" selected="selected">1</option>
    		<option value="2">2</option>
   	 		<option value="3" >3</option>
    		<option value="4">4</option>
    		<option value="5">5</option>
    		<option value="6">6</option>
    		<option value="7">7</option>
    		<option value="8">8</option>
    		<option value="9">9</option>
    		<option value="10">10</option>
    		<option value="11">11</option>
    		<option value="12">12</option>
			</select>
			월&nbsp<select id="day" name="day" >
    		<option value="1" selected="selected">1</option>
    		<option value="2">2</option>
   	 		<option value="3" >3</option>
    		<option value="4">4</option>
    		<option value="5">5</option>
    		<option value="6">6</option>
    		<option value="7">7</option>
    		<option value="8">8</option>
    		<option value="9">9</option>
    		<option value="10">10</option>
    		<option value="11">11</option>
    		<option value="12">12</option>
   	 		<option value="13">13</option>
    		<option value="14">14</option>
    		<option value="15">15</option>
    		<option value="16">16</option>
    		<option value="17">17</option>
    		<option value="18">18</option>
    		<option value="19">19</option>
    		<option value="20">20</option>
    		<option value="21">21</option>
    		<option value="22">22</option>
   	 		<option value="23">23</option>
    		<option value="24">24</option>
    		<option value="25">25</option>
    		<option value="26">26</option>
    		<option value="27">27</option>
    		<option value="28">28</option>
    		<option value="29">29</option>
    		<option value="30">30</option>
    		<option value="31">31</option>
			</select>일</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">관심분야:</div></td>
		<td>
		<input type="checkbox" name="chk" id="chk" value="COMPUTER" onclick="check_only(this)">컴퓨터
		<input type="checkbox" name="chk" id="chk" value="INTERNET" onclick="check_only(this)">인터넷
		<input type="checkbox" name="chk" id="chk" value="TRABLE" onclick="check_only(this)">여행
		<input type="checkbox" name="chk" id="chk" value="MOVIE" onclick="check_only(this)">영화감상
		<input type="checkbox" name="chk" id="chk" value="MUSIC" onclick="check_only(this)">음악감상
		</td>
	</tr>
	<tr>
		<td bgcolor="pink" align="center"><div style="font-weight: bold;">자기소개:</div></td>
		<td><textarea name="my_intro" cols="70" rows="5"></textarea></td>
	</tr>
	
</table>
	<p align="center">
	<input type="submit" value="회원 가입" name="submit">
	<input type="reset" value="다시 입력">
	</FORM>
</p>



</body>
</html>