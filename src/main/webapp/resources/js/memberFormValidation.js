$(document).ready(function(){
	var pwd1 = $('#pwd1');
	var pwd2 = $('#pwd2');
	var msg = $('#pwd-msg');
	var txt = '';
	
	//비번 유효성체크
	pwd1.change(function(){
		if(!chkPwd( $.trim(pwd1.val()))){
			var txt = '비밀번호를 확인하세요.\n(영문,숫자를 혼합하여 6~20자 이내)';
			alert(txt);
			pwd1.focus();
			return false;
		 }
	});
	
	function chkPwd(str){
		 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		 if(!reg_pwd.test(str)){
			return false;
		 }
		 return true;
	}
	
	//비밀번호 일치체크
	$('input[type=password]').change(function(){
		if(pwd1.val() == '' || pwd2.val() == '') return;
		
		if(pwd1.val() === pwd2.val()) {
			txt = "비밀번호가 일치합니다.";
			$('#pwd-msg2').removeClass('invalid-feedback').addClass('valid-feedback').text(txt);
			$("#pwd1, #pwd2").removeClass('is-invalid').addClass('is-valid');
		} else if(pwd1.val() != '' && pwd2.val() != '') {
			txt = "비밀번호가 일치해야 합니다";	
			$('#pwd-msg2').removeClass('valid-feedback').addClass('invalid-feedback').text(txt);
			$("#pwd1, #pwd2").removeClass('is-valid').addClass('is-invalid');
		}	
	});
});