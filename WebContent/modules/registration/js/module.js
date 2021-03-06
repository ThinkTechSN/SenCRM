const setFlexibleCloudlets = function(value) {
	const nodes = parseInt($("input[name='registration.nodes']").val());
    const memory = nodes * value * 128;
    const power = nodes * value * 400;
    $(".settings .power").html(getSize(memory) + " + "+getPower(power));
};

const setFixedCloudlets = function(value) {
};

const setNodes = function(value) {
	var radio = $("input[type='radio'][value='private']");
	var price = 20 * value;
	radio.attr("data-price",price);
	$("span.private").find("span").html(price);
	const cloudlets = parseInt($("input[name='registration.flexibleCloudlets']").val());
    const memory = value * cloudlets * 128;
    const power = value * cloudlets * 400;
    $(".settings .power").html(getSize(memory) + " + "+getPower(power));
};

const getSize = function(value) {
	 var i = Math.floor(Math.log(value) / Math.log(1024));
	 return (value / Math.pow(1024, i)).toFixed(2) * 1 + ' ' + ['MiB', 'GiB', 'TiB'][i];
}

const getPower = function(value) {
    var i = Math.floor(Math.log(value) / Math.log(1000));
    return (value / Math.pow(1000, i)).toFixed(2) * 1 + ' ' + ['MHz', 'GHz', 'THz'][i];
}

app.ready(function(){
	var form = $(".registration form");
	if(form.length) {
		page.wait();
		head.load("css/animate.min.css","modules/registration/js/jquery.easyWizard.js", function() {
			$("div.registration").addClass("animated pulse");
			form.easyWizard({
				    prevButton: i18n("back"),
				    nextButton: i18n("next"),
				    submitButtonText: i18n("create"),
				    before : function(wizardObj,currentStep,nextStep) {
				    	if(nextStep.index() > currentStep.index()) {
					    	var valid = true;
					        $('input[required]',currentStep).each(function(index,element) {
					        	const val = $(element).val();
								if(val.trim() == '') {
									const message = $(this).next().attr("data-info");
									alert(message,function(){
										$(element).focus();
									});
								    return valid = false;
								}
					        });
					        if(!valid) return valid;
					        const email = $("input[type=email]",currentStep);
					        if(email.length) {
					        	var re = /\S+@\S+\.\S+/;
						        valid = re.test(email.val());
						        if(!valid) {
						        	alert(i18n("email-invalid"),function(){
										$(email).focus();
									});
						        }
					        }
					        if(!valid) return valid;
					        const password = $("#password",currentStep);
							const confirm = $("#confirm",currentStep);
							if(password.length && password.val() != confirm.val()) {
								alert(i18n("password-mismatch"),function(){
									password.focus();
								});
								valid = false;
							}
							const value = password.length ? password.val() : null;
							if(value && (value.length < 8 || value.length >= 100)) {
								alert(password.next().attr("data-info"),function(){
									password.focus();
								});
								valid = false;
							}
					        return valid;
				    	}
				    },
				    after : function(wizardObj,prevStep,currentStep) {
				    	setTimeout(function(){ 
				    		var input = currentStep.find("input.error");
				    		input = input.length ? input : currentStep.find("input:first");
				    		input.focus(); 
				    		}, 1000);
				    },
				    beforeSubmit: function(wizardObj) {
				    	if(!grecaptcha.getResponse()) {
						  alert(i18n("check-captcha"));
						  return false;
					    }
				    }
			});
			$(".easyWizardButtons button.prev",form).attr("data-translation","back");
			$(".easyWizardButtons button.next",form).attr("data-translation","next");
			$(".easyWizardButtons button.submit",form).attr("data-translation","create");
			$.each($(".easyWizardSteps li",form),function(index,li){
				const section = $("section[data-step="+(index+1)+"]").css("opacity","1").css("margin-top","0px");
				const title = section.attr("data-step-title");
				$(li).html("<span>"+(index+1)+"</span> . ");
				const span = $("<span>"+i18n(title)+"</span>");
				span.attr("data-translation",title);
				$(li).append(span);
			});
			$("input:first",form).focus();
			page.release();
	});
	form.on("submit",function(event){
		var url = $(this).attr("action");
		var data = $(this).serialize();
		app.post(url,data, function(response) {
			window.location.href = response.url;
		}, function(error) {
			$("body").css("opacity","1");
			alert(i18n("error-registration"), function() {
				$("input,a,select").removeAttr("disabled");
				$("input[name='user.firstName']").focus();
			});
		});
		$("input,a,select").attr("disabled","disabled");
		$("body").css("opacity","0.5");
		$("html, body").animate({ scrollTop: 0 }, 500);
		return false;
	});
	var amount = 0;
	$("input[type=checkbox]").each(function(index,element){
		const checked = $(element).attr("data-checked");
		if(checked=='true') {
			$(element).attr("checked","true").on('change', function() {
			    this.checked=!this.checked?!alert(i18n("option-required")):true;
			});
		}else {
			$(element).on('change', function() {
				amount = 0;
				$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
					var price = parseInt($(element).attr("data-price"));
					amount+=price;
					$("#amount").html(amount.toString().formatDigits());
				});
			});
		}
	});
	$("input[type=radio]").on('change', function() {
		amount = 0;
		$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
			var price = parseInt($(element).attr("data-price"));
			amount+=price;
			$("#amount").html(amount.toString().formatDigits());
		});
    });
	$("span.price",form).each(function(index,element){
		$(this).html($(this).html().formatDigits());
	});
	$(".voice",form).click(function(){
		var prev = $(this).prev();
		const info = prev.attr("data-info");
		prev.prev().focus();
		page.speak(info);
	});
	$("#form span.wrench").click(function(event){
		const radio = $("input[type='radio'][value='private']");
		radio.attr('checked', true).trigger('change');
		const id = $(this).attr("data-element");
		const settings = $("#"+id);
		const left = event.pageX;
		const top =  $(this).position().top +20;
		settings.css({top : top, left : 50}).toggle();
		if(!settings.is(":hidden")){
			$("input:first",settings).focus();
			$(".settings input:first").trigger("change");
		}
		return false;
	});
	$("#form .settings input").on("change",function(event){
		const val = parseInt($(this).val());
		if(val>=0) {
			const action = $(this).attr("data-action")+"("+val+");";
			eval(action);
		}
	});
	$("select[name='account.structure.size']").on("change",function(event){
		const val = $(this).val();
		if(val=="medium" || val=="big") {
			$("input[type='radio'][value='colocation']").attr("disabled","disabled");
			$("input[type='radio'][value='private']").attr("checked","checked").click();
		}else {
			$("input[type='radio'][value='colocation']").removeAttr("disabled");
		}
	}).val("small").trigger("change");
	$("select[name='user.lang']").val(page.language);
	$("input[data-price][type=radio]:checked,input[data-price][type=checkbox]:checked").each(function(index,element){
		var price = parseInt($(element).attr("data-price"));
		amount+=price;
		$("#amount").html(amount.toString().formatDigits());
	});
	$.get("https://ipinfo.io", function(response) {
		  app.getCountries("en",response.country);
	}, "jsonp");
	}
});