var recaptchaIds = [];

function validateEmail(a) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(a);
}

function getBase64Doc(a, b) {
    if($("#doc_change").val() == "yes"){
        var c = new FileReader;
        c.onload = b;
        c.readAsDataURL(a);
    }
}

function getBase64Selfie(a, b) {
    if($("#selfie_change").val() == "yes"){
        var c = new FileReader;
        c.onload = b;
        c.readAsDataURL(a);
    }
}

function readDocURL(a) {
    if (a.files && a.files[0]) {
        var b = new FileReader;
        b.onload = function(a) {
            $("#doc-preview").attr("src", a.target.result);
            $("#doc-preview1").attr("src", a.target.result);
            $("#doc_change").val("yes");
        };
        b.readAsDataURL(a.files[0]);
    }
}

function readSelfieURL(a) {
    if (a.files && a.files[0]) {
        var b = new FileReader;
        b.onload = function(a) {
            $("#selfie-preview").attr("src", a.target.result);
            $("#selfie-preview1").attr("src", a.target.result);
            $("#selfie_change").val("yes");
        };
        b.readAsDataURL(a.files[0]);
    }
}

function onloadCallback() {
    var a = document.querySelectorAll("div[class=g-recaptcha]");
    for (i = 0; i < a.length; i++) recaptchaIds[i] = grecaptcha.render(a[i].id, {
        sitekey: "6LegUjYUAAAAAOIptlp4CQGTVIFH6APqe8AhCIVs"
    });
}

function getCookie(a) {
    a = ("; " + document.cookie).split("; " + a + "=");
    if (2 == a.length) return a.pop().split(";").shift();
}

function isValidEthAddress(a) {
    return 0 == a.search(/^0x[a-fA-F0-9]{40}$/);
}

function isValidBCAddress(a) {
    if(a.length > 0){
        return 0 == a.search(/^[13][a-km-zA-HJ-NP-Z0-9]{26,33}$/);
    }
    return true;
}

function isAlphaNumericWithDashAndSpace(a) {
    return 0 == a.search(/^[a-z0-9\-\s]+$/i);
}

function isAlphaWithDashAndSpace(a) {
    return 0 == a.search(/^[a-z\-\s]+$/i);
}
$(function() {
    $("#datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-70:+0"
    });
});

function nextStep1() {
    if(isValidEthAddress($("#addressInput").val())){
        if(isValidBCAddress($("#bcaddressInput").val())){
            $("#eth-address-msg").text(""); 
            $("#eth-address").fadeOut("slow", function() {
                $("#personal-details").fadeIn("slow", function() {
                    $(".address-tab").css({
                        "border-bottom": "1px solid #6A6A6A",
                        "color": "#6A6A6A"
                    });
                    $(".details-tab").css({
                        "border-bottom": "1px solid #58b7df",
                        color: "#58b7df"
                    });
                });
            });
        }else{
            $("#errModal").modal("show"); 
            $(".modal-body").text("Invalid BTC Wallet address").css("color", "#C40404"); 
            $("#eth-address-msg").text("Invalid BTC Wallet address").css("color", "#C40404");
        }
    }else{
        $("#errModal").modal("show"); 
        $(".modal-body").text("Invalid ETH wallet address").css("color", "#C40404"); 
        $("#eth-address-msg").text("Invalid ETH wallet address").css("color", "#C40404");
    }
}

function nextStep2() {
    var a = !1;
    $(".acct-input").each(function() {
		//console.log($(this).attr('id'));
		if($(this).attr('id') == "doc-file" && $("#doc_change").val() == "no"){
			//console.log("in doc file");
			return true;
		}
		if($(this).attr('id') == "selfie-file" && $("#selfie_change").val() == "no"){
			//console.log("in selfie");
			return true;
			
		}
        1 > $(this).val().length && (a = !0);
    });
    
    if(0 == a){
        $("#submit-page-review").html("");
        $("#submit-page-review").append("<p><span>ETH Wallet: </span> " + $("#addressInput").val() + "</p>", "<p><span>First name: </span> " + $("#firstName").val() + "</p>", "<p><span>Last name: </span>" + $("#lastName").val() + "</p>", "<p><span>" + $("#id-label").text() + " : </span>" + $("#id").val() + "</p>", "<p><span>D.O.B: </span>" + $("#datepicker").val() + "</p>", "<p><span>Nationality: </span>" + $("#nationality").val() + "</p>", "<p><span>Gender: </span>" + $("#gender-select-box").val() + "</p>", "<p><span>Residence: </span>" + $("#residence").val() + "</p>");
    }
    
    //0 == $("#submit-page-review").children().length && $("#submit-page-review").append("<p><span>ETH Wallet: </span> " + $("#addressInput").val() + "</p>", "<p><span>First name: </span> " + $("#firstName").val() + "</p>", "<p><span>Last name: </span>" + $("#lastName").val() + "</p>", "<p><span>" + $("#id-label").text() + " : </span>" + $("#id").val() + "</p>", "<p><span>D.O.B: </span>" + $("#datepicker").val() + "</p>", "<p><span>Nationality: </span>" + $("#nationality").val() + "</p>", "<p><span>Gender: </span>" + $("#gender-select-box").val() + "</p>", "<p><span>Residence: </span>" + $("#residence").val() + "</p>");
    
    //alert($("#submit-page-review").html());
    //alert($("#firstName").val());
    0 == a ? $("#personal-details").fadeOut("slow", function() {
        $("#submit-page").fadeIn("slow", function() {
            
            $(".details-tab").css({
                "border-bottom": "1px solid #6A6A6A",
                color: "#6A6A6A"
            });
            $(".submit-tab").css({
                "border-bottom": "1px solid #58b7df",
                color: "#58b7df"
            });
        });
        window.scrollTo(0, 0);
        
    }) : ($("#errModal").modal("show"), $(".modal-body").text("Please fill in ALL fields before proceeding").css("color", "#C40404"));
}

function backStep2() {
    $("#personal-details").fadeOut("slow", function() {
        $("#eth-address").fadeIn("slow", function() {
            $(".details-tab").css({
                "border-bottom": "1px solid #6A6A6A",
                color: "#6A6A6A"
            });
            $(".address-tab").css({
                "border-bottom": "1px solid #58b7df",
                color: "#58b7df"
            });
        });
    });
}

function backStep3() {
    $("#submit-page").fadeOut("slow", function() {
        $("#personal-details").fadeIn("slow", function() {
            $(".submit-tab").css({
                "border-bottom": "1px solid #6A6A6A",
                color: "#6A6A6A"
            });
            $(".details-tab").css({
                "border-bottom": "1px solid #58b7df",
                color: "#58b7df"
            });
        });
    });
}
var recaptcha1, recaptcha2, recaptcha3;

function recaptchaResponse1(a) {
    recaptcha1 = a;
}

function recaptchaResponse2(a) {
    recaptcha2 = a;
}

function recaptchaResponse3(a) {
    recaptcha3 = a;
}
$(document).ready(function() {
    $("#refresh-btn").on("click", function() {
        location.reload();
    });
    $("#datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-70:+0"
    });
    $(".checkbox").change(function() {
        $("#info-checkbox").is(":checked") && $("#terms-checkbox").is(":checked") ? ($("#submit-btn").prop("disabled", !1), $("#submit-btn").css("background-color", "#58b7df")) : $("#submit-btn").prop("disabled", !0);
    });
    $("#residence").change(function() {
        //"UNITED STATES OF AMERICA" == $(this).val() || "CANADA" == $(this).val() ? ($("#license-option").prop("hidden", !1), $("#nric-option").prop("hidden", !0), $("#idType").val("NRIC") && ($("#idType").val("PASSPORT"))) : ($("#nric-option").attr("hidden", !1), $("#license-option").attr("hidden", !0), $("#idType").val("PASSPORT"));
    });
    $("#idType").change(function() {
        //"DRIVING LICENSE" == $(this).val() ? () : "NRIC" == $(this).val() ? () : ();
    });
    $("#doc-file").change(function() {
                if(10 < $(this)[0].files[0].size / 1024 / 1024){
                    $("#errModal").modal("show");
                    $(".modal-body").text("");
                    $(".modal-body").text("Image file is too large. File must be less than 10MB.").css("color", "#C40404");
                    $(this).val("");
                    return false;
                }
		var ext1 = $(this).val().split('.').pop().toLowerCase();
                //console.log(ext1);
                if($.inArray(ext1, ['png','jpg','jpeg']) == -1) {
                        $("#errModal").modal("show");
			$(".modal-body").text("");
                        $(".modal-body").text("Uploaded file is not a valid image. Only JPG, PNG files are allowed.").css("color", "#C40404");
                        $(this).val("");
			return false;
                }
	
                readDocURL(this);
    });
    $("#selfie-file").change(function() {
        if(10 < $(this)[0].files[0].size / 1024 / 1024){
            $("#errModal").modal("show");
            $(".modal-body").text("");
            $(".modal-body").text("Image file is too large. File must be less than 10MB.").css("color", "#C40404");
            $(this).val("");
            return false;
        }
        
        var ext2 = $(this).val().split('.').pop().toLowerCase();
        if($.inArray(ext2, ['png','jpg','jpeg']) == -1) {
                $("#errModal").modal("show");
                $(".modal-body").text("");
                $(".modal-body").text("Uploaded file is not a valid image. Only JPG, PNG files are allowed.").css("color", "#C40404");
                $(this).val("");
                return false;
        }
        
        readSelfieURL(this);
    });
    document.cookie = "applicationSent=false";
    var a = {
        lines: 11,
        length: 22,
        width: 10,
        radius: 25,
        scale: 1,
        corners: 1,
        color: "#d1d1d1",
        opacity: .3,
        rotate: 0,
        direction: 1,
        speed: 1,
        trail: 60,
        fps: 20,
        zIndex: 2E9,
        className: "spinner",
        top: "50%",
        left: "50%",
        shadow: !1,
        hwaccel: !1,
        position: "absolute"
    };
    $("#email-form").submit(function(b) {
        b.preventDefault();
        $(".overlay").show();
        var c = document.getElementById("loader"),
            d = (new Spinner(a)).spin(c);
        validateEmail($("#email-input").val()) ? recaptcha1 ? $.ajax({
            type: "POST",
            url: "kyc_edit_step1.php",
            data: {
                email: $("#email-input").val(),
                response: recaptcha1
            },
            success: function(a) {
                //console.log(a);
                d.stop(c);
                $(".overlay").hide();
                $("#email").fadeOut("slow", function() {
                    $("#code").fadeIn("slow", function() {});
                });
            },
            error: function(a) {
                //console.log(a);
                d.stop(c);
                $(".overlay").hide();
                $("#errModal").modal("show");
                $("#recaptcha1-msg").text("");
                400 == a.status ? ($(".modal-body").text(a.responseJSON.message).css("color", "#C40404"), $("#email-form-msg").text(a.responseJSON.message).css("color", "#C40404")) : 500 == a.status ? ($(".modal-body").text("The server is currently busy. Please try again later.").css("color", "#C40404"), $("#email-form-msg").text("")) : 401 == a.status ? ($(".modal-body").text(a.responseJSON.message).css("color", "#C40404"), $("#email-form-msg").text(a.responseJSON.message).css("color", "#C40404")) : ($(".modal-body").text("The server is currently busy. Please try again later.").css("color", "#C40404"), $("#email-form-msg").text(""));
                $("#email-input").css("border", "1px solid #C40404");
                grecaptcha.reset(0);
            }
        }) : (d.stop(c), $(".overlay").hide(), $("#errModal").modal("show"), $(".modal-body").text(""), $(".modal-body").text("Invalid recaptcha").css("color", "#C40404"), $("#recaptcha1-msg").text("Invalid recaptcha").css("color", "#C40404")) : (d.stop(c), $(".overlay").hide(), $(".modal-body").text(""), $(".modal-body").text("Please enter a valid email address.").css("color", "#C40404"), $("#email-form-msg").text("Please enter a valid email address.").css("color", "#C40404"), $("#email-input").css("border", "1px solid #CC0000"));
    });
    $("#code-form").submit(function(b) {
        b.preventDefault();
        $(".overlay").show();
        var c = document.getElementById("loader"),
            d = (new Spinner(a)).spin(c);
        32 <= $("#code-input").val().length ? recaptcha2 ? $.ajax({
            type: "POST",
            url: "kyc_edit_step2.php",
            data: {
                verificationCode: $("#code-input").val(),
                email: $("#email-input").val(),
                response: recaptcha2
            },
            success: function(a) {
                
                $.ajax({
                    type: "POST",
                    url: "kyc_edit_info_get.php",
                    data: {
                        verificationCode: $("#code-input").val(),
                        email: $("#email-input").val()
                    },
                    success: function(a) {
                        //console.log(a);
                        
                        $("#addressInput").val(a['kyc_data'].id);
                        $("#firstName").val(a['kyc_data'].first_name);
                        $("#lastName").val(a['kyc_data'].last_name);
                        $("#datepicker").val(a['kyc_data'].dob);
                        $("#nationality").val(a['kyc_data'].nationality);
                        $("#gender-select-box").val(a['kyc_data'].gender);
                        $("#residence").val(a['kyc_data'].residence);
                        $("#idType").val(a['kyc_data'].id_type);
                        $("#id").val(a['kyc_data'].id_num);
						$('#doc-preview').attr("src", "http://dev.tokensale.com/uploads/"+a['kyc_data'].doc1);
						$('#selfie-preview').attr("src", "http://dev.tokensale.com/uploads/"+a['kyc_data'].doc2);
                                                $('#doc-preview1').attr("src", "http://dev.tokensale.com/uploads/"+a['kyc_data'].doc1);
						$('#selfie-preview1').attr("src", "http://dev.tokensale.com/uploads/"+a['kyc_data'].doc2);
                        //$("#doc-file").val();
						//$("#selfie-file").val();

						d.stop(c);
						$(".overlay").hide();
						var b = new Timer;
						b.start({
							countdown: !0,
							startValues: {
								minutes: 30
							}
						});
						$("#countdownExample .values").html(b.getTimeValues().toString());
						b.addEventListener("secondsUpdated", function(a) {
							$("#countdownExample .values").html(b.getTimeValues().toString());
						});
						b.addEventListener("targetAchieved", function(a) {
							$("#countdownExample .values").html("Session expired. Please start over.");
							$("#account, #account-header, #tabs").fadeOut("slow", function() {
								$("#expired-page").fadeIn("slow", function() {});
							});
						});
						//document.cookie = "token=" + a.data;
						$("#code, #registration-header").fadeOut("slow", function() {
							$("#account, #account-header, #tabs").fadeIn("slow", function() {});
						});
						
                    },
                    error: function(a) {
                        //console.log(a);
                        d.stop(c);
                        $(".overlay").hide();
                        $("#recaptcha2-msg").text("");
                        $(".modal-body").text("");
                        $("#errModal").modal("show");
                        400 == a.status ? ($("#code-input").css("border", "1px solid #CC0000"), $(".modal-body").text(a.responseJSON.message).css("color", "#C40404"), $("#code-form-msg").text(a.responseJSON.message).css("color", "#C40404")) : 401 == a.status ? $(".modal-body").text(a.responseJSON.message).css("color", "#C40404") : 500 == a.status && $(".modal-body").text("The server is currently busy. Please try again later.").css("color", "#C40404");
                        grecaptcha.reset(1);
                    }
                });
  
            },
            error: function(a) {
                //console.log(a);
                d.stop(c);
                $(".overlay").hide();
                $("#recaptcha2-msg").text("");
                $(".modal-body").text("");
                $("#errModal").modal("show");
                400 == a.status ? ($("#code-input").css("border", "1px solid #CC0000"), $(".modal-body").text(a.responseJSON.message).css("color", "#C40404"), $("#code-form-msg").text(a.responseJSON.message).css("color", "#C40404")) : 401 == a.status ? $(".modal-body").text(a.responseJSON.message).css("color", "#C40404") : 500 == a.status && $(".modal-body").text("The server is currently busy. Please try again later.").css("color", "#C40404");
                grecaptcha.reset(1);
            }
        }) : (d.stop(c), $(".overlay").hide(), $(".modal-body").text(""), $("#errModal").modal("show"), $(".modal-body").text("Invalid recaptcha").css("color", "#C40404"), $("#recaptcha2-msg").text("Invalid recaptcha"), $("#recaptcha2-msg").css("color", "#C40404")) : (d.stop(c), $(".overlay").hide(), $(".modal-body").text(""), $("#errModal").modal("show"), $(".modal-body").text("Invalid code").css("color", "#C40404"), $("#code-form-msg").text("Invalid code"), $("#code-form-msg").css("color", "#C40404"), $("#code-input").css("border", "1px solid #CC0000"));
    });
    $("#account-form").submit(function(b) {
        b.preventDefault();
        //var c = getCookie("token"),
            d = !1;
        b = {};
        $(".overlay").show();
        var e = document.getElementById("loader"),
            f = (new Spinner(a)).spin(e);
        $(".acct-input").each(function() {
            
            if($(this).attr('id') == "doc-file" && $("#doc_change").val() == "no"){
                    //console.log("in doc file");
                    return true;
            }
            if($(this).attr('id') == "selfie-file" && $("#selfie_change").val() == "no"){
                    //console.log("in selfie");
                    return true;

            }
            
            1 > $(this).val().length && (d = !0);
        });
        
        if (0 == d)
            if ($("#info-checkbox").is(":checked") && $("#terms-checkbox").is(":checked"))
                    if (recaptcha3) {
                        if (isValidEthAddress($("#addressInput").val()) || (b.address = "Invalid ETH Wallet Address", $("#addressInput").css("border", "1px solid #C40404")), isAlphaWithDashAndSpace($("#firstName").val()) || (b.firstName = "Invalid first name value", $("#firstName").css("border", "1px solid #C40404")), isAlphaWithDashAndSpace($("#firstName").val()) || (b.lastName = "Invalid last name value", $("#lastName").css("border", "1px solid #C40404")), "false" == getCookie("applicationSent")) {
                            var g = 0;
                            $(".modal-body").empty();                          
                            for (var h in b) b.hasOwnProperty(h) && g++, $(".modal-body").append("<p>" + b[h] + "</p>");
                            //0 < g ? ($(".overlay").hide(), f.stop(e), $("#errModal").modal("show"), $(".modal-body").css("color", "#C40404")) : ($(".modal-body").empty(), b = {}, function() {

                                    a = {
                                        email: $("#email-input").val(),
                                        verificationCode: $("#code-input").val(),
                                        response: recaptcha3,
                                        eth: $("#addressInput").val(),
                                        bc: $("#bcaddressInput").val(),
                                        fName: $("#firstName").val(),
                                        lName: $("#lastName").val(),
                                        encodedDocData: {
                                            document: $("#doc-preview").attr("src"),
                                            selfie: $("#selfie-preview").attr("src")
                                        },
                                        dob: $("#datepicker").val(),
                                        nationality: $("#nationality").val(),
                                        gender: $("#gender-select-box").val(),
                                        residence: $("#residence").val(),
                                        id_type: $("#idType").val(),
                                        id_num: $("#id").val(),
                                        is_doc_change: $("#doc_change").val(),
                                        is_selfie_change: $("#selfie_change").val()
                                    };
                                    $.ajax({
                                        type: "POST",
                                        url: "kyc_edit_step3.php",
                                        data: a,
                                        success: function(a) {
                                            f.stop(e);
                                            document.cookie = "applicationSent=true";
                                            $("#account-header, #registration").fadeOut("slow", function() {
                                                $("#success-page").fadeIn("slow", function() {});
                                            });
                                        },
                                        error: function(a) {
                                            $(".overlay").hide();
                                            f.stop(e);
                                            400 == a.status ? ($("#errModal").modal("show"), $(".modal-body").text(a.responseJSON.message).css("color", "#C40404"), $("#errMsg").text(a.responseJSON.message).css("color", "#C40404")) : 401 == a.status ? $("#account-header, #registration").fadeOut("slow", function() {
                                                $("#expired-page").fadeIn("slow", function() {
                                                    $("#expired-error").text(a.responseJSON.message).css("color", "#C40404");
                                                });
                                            }) : 500 == a.status && ($("#errModal").modal("show"), $(".modal-body").text("The server is currently busy. Please try again later.").css("color", "#C40404"));
                                            grecaptcha.reset(2);
                                        }
                                    });
                            //});
                        }
                    } else $(".overlay").hide(), f.stop(e), $("#errModal").modal("show"), $(".modal-body").text("Invalid recaptcha").css("color", "#C40404"), $("#errMsg").text("Invalid recaptcha"), $("#errMsg").css("color", "#C40404");
        else $(".overlay").hide(), f.stop(e), $("#errModal").modal("show"), $(".modal-body").text("Must check both boxes before submitting.").css("color", "#C40404"), $("#errMsg").text("Must check both boxes before submitting.").css("color", "#C40404");
        else $(".overlay").hide(), f.stop(e), $("#errModal").modal("show"), $(".modal-body").text("Please fill in ALL fields.").css("color", "#C40404"), $("#errMsg").text("Please fill in ALL fields.").css("color", "#C40404");
    });
});