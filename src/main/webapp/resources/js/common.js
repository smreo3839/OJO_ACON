(function($){

	// document.ready
	$(document).ready(function(){
		
		var handleBodyPt = () => {
			var navTop = $('#navTop');
			if(navTop.css('position') == 'fixed') {
				$('body').css('padding-top', navTop.innerHeight());
			}			
		}
		handleBodyPt();

		//nav
		var navNow = (name) => {
			console.log(name);
			var url = location.href;
			var sFrom = url.search(name)
			var sLength = name.length;

			var target = (name == 'home' && sFrom < 0)? 'home' : url.substr(sFrom, sLength);
			
			if(name == target) {
				var nav = $('#navTop .nav-item.nav-' + name);
				nav.find('.nav-link').addClass('active');
				return true;
			} else {
				return false;
			}
		}

		var localSch = () => {
			var pageArr = ['room', 'group', 'member', 'mypage'];
			var op = false;
			for(var i = 0; i < pageArr.length; i++) {
				navNow(pageArr[i]);
				console.log(navNow(pageArr[i]));
				if(navNow(pageArr[i]) || pageArr.length == i) {
					op = true;
					break;
				}
			}
			
			if(op == false) {
				navNow('home');
			}
		}
		localSch();
		
	});

})(jQuery);

