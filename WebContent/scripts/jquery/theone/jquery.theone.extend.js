/*******************************************************************************
 * <pre>
 * SUMMARY
 * 
 * General function
 * ****************
 * null2Empty
 * emptySelect
 * loadSelect
 * formFieldValue
 * theoneUtil.checkLoginStatusUrl
 * theoneUtil.loginUrl
 * theoneUtil.getLoginStatus
 * theoneUtil.checkUserLogin
 * 
 * Datatables
 * ***********
 * refer to jquery.theone.dataTables.extend.js
 * 
 * Online1 Plugin
 * ***********
 * theoneDatepicker
 * theoneNumber
 * theoneValidate
 * theoneDialog
 * theoneAutocomplete
 * theoneExit
 * theoneGoto
 * theoneUploadify
 * 
 * Form Validation
 * ************
 * notAllowNegative
 * requiredSelect
 * 
 * </pre>
 ******************************************************************************/

(function($) { // hide the namespace
    $.fn.theoneButton = function(options) {
        var defaults = {
            buttonColor : "blue"
            , iconLogo : ""
            , text : true
            , size : ""
            , width : ""
            , height : ""
        };
        // Extend our default options with those provided.
        var opts = $.extend(defaults, options);
        // Our plugin implementation code goes here.

        var iconLogo = options.iconLogo;
        var buttonColor = options.buttonColor;
        var showText = options.text;
        var buttonSize = options.size;
        var width = options.width;
        var height = options.height;

        var buttonColorClassName = "btn btn-primary";
        var iconColor = "icon-white ";
        var fontColor = "color: white";
        if ("red" == buttonColor) {
            buttonColorClassName = "btn btn-danger";
        } else if ("green" == buttonColor) {
            buttonColorClassName = "btn btn-success";
        } else if ("blue" == buttonColor) {
            buttonColorClassName = "btn btn-primary";
        } else if ("light-blue" == buttonColor) {
            buttonColorClassName = "btn btn-info";
        } else if ("orange" == buttonColor) {
            buttonColorClassName = "btn btn-warning";
        } else if ("black" == buttonColor) {
            buttonColorClassName = "btn btn-inverse";
        } else if ("white" == buttonColor) {
            buttonColorClassName = "btn";
            iconColor = " ";
            fontColor = "color: #222222;";
        }

        var fontSize = "11px";
        if ("large" == buttonSize) {
            buttonSize = " btn-large";
        } else if ("mini" == buttonSize) {
            buttonSize = " btn-mini";
            var fontSize = "10px";
        } else {
            buttonSize = "";
        }

        $(this).addClass(buttonColorClassName + buttonSize);
        var label = $(this).html();
        if (showText == false) {
            label = "";
        }
        var innerContent = "<i class='" + iconColor + iconLogo + "'></i><span style='padding-left: 5px;" + fontColor + "'>" + label + "</span>";

        $(this).html(innerContent).css("font-size", fontSize).css("font-family", "'Helvetica Neue',Helvetica,Arial,sans-serif").css("text-align", "left");

        //.css("float", "left")

        if (width != "") {
            $(this).html(innerContent).css("width", width)
        }
        if (height != "") {
            $(this).html(innerContent).css("height", height)
        }
        return this;
    };
	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Global default setting - start
	 * * * * * * * * * * * * * * * * * * * * * * * * */
	// overide the datepicker default setting.
	$.datepicker.setDefaults( {
		dateFormat : 'dd/mm/yy',
		changeMonth : true,
		changeYear : true,
		// showButtonPanel: true,
		yearRange : '-100:+50'
	});
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Global default setting - END
	 * * * * * * * * * * * * * * * * * * * * * * * * */

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * General Function - START
	 * * * * * * * * * * * * * * * * * * * * * * * * */
	$.fn.null2Empty = function(text) {
		if (text == null) {
			return "";
		} else {
			return $.trim(text);
		}
	};
	
	$.fn.emptySelect = function() {
		return this.each(function() {
			if (this.tagName == 'SELECT')
				this.options.length = 0;
		});
	}

	$.fn.loadSelect = function(json, options) {
		var defaults = {
	            disableClass : null,
	            enableClass : null
			};
		
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.
		
		return this.each(
				function() {
					var $this = $(this);
					
					if (this.tagName == 'SELECT') {
						// original value
						var origValue = $this.val();
						
						$this.emptySelect();
						
						var selectElement = this;
						
						$.each(json, function(index, optionData) {
							var option = new Option(optionData.value,
									optionData.key);
							if ($.browser.msie) {
								selectElement.add(option);
							} else {
								selectElement.add(option, null);
							}
						});
						
						var ind = $this.attr("selectedIndex");
						if (ind == -1) {
							$this.attr("disabled", true);
							$this.emptySelect();
							if(opts.enableClass!=null){
								$this.removeClass(opts.enableClass);
							}
							if(opts.disableClass!=null){
								$this.addClass(opts.disableClass);
							}
						}else{
							$this.removeAttr("disabled");
							
							// if the options has origin value, set value
							if($("option[value=" + origValue + "]", $this).length){
								$this.val(origValue);
							}
							if(opts.enableClass!=null){
								$this.addClass(opts.enableClass);
							}
							if(opts.disableClass!=null){
								$this.removeClass(opts.disableClass);
							}
						}
					}
				});
	}
	
	/**
	 * Return in array of [fieldName, value].
	 * NOTE : fieldName is name for field and not id for field.
	 * Example, return in [
	 * 	['username', 'jason'], ['user.username','jason']
	 * ]
	 */
	$.fn.formFieldValue = function(successful){
		if (typeof successful == 'undefined') successful = true;
		// from jquery.form.js
		var result = this.fieldSerialize(successful);
		var ss = result.split("&");
		
		var arr = new Array();
		if(ss.length){
			for(i=0; i<ss.length; i++){
				//arr[i] = ss[i].split("=");
				arr.push(ss[i].split("="));
			}
		}
		return arr;
	}

	$.theoneUtil = {
		loginStatusUrl : '',
		loginUrl : '',
		getLoginStatus : function(callback) {
			if (this.loginStatusUrl == '') {
				alert("loginStatusUrl is undefined, please check your javascript init page like [layout1.jsp]");
				return false;
			}

			$.getJSON(this.loginStatusUrl, {}, function(json) {
				var loginStatus = json.login;

				callback(loginStatus);
			});
		},
		checkUserLogin : function(callback) {
			var url = this.loginUrl;
			this
					.getLoginStatus(function(loginStatus) {
						if (loginStatus == false) {
							if (url == '') {
								alert("loginUrl is undefined, please check your javascript init page like [layout1.jsp]");
								return;
							}

							// alert("redirect to login");
							window.location = url;
							return;
						} else {
							if (typeof callback == 'undefined') {
								alert("The callback function is undefined");
								return;
							} else if (typeof callback != 'function') {
								alert("The callback is not a FUNCTION");
								return;
							}
							callback();
						}
					});
		}
	};

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * General Function - END
	 * * * * * * * * * * * * * * * * * * * * * * * * */

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Online1 plugin - start
	 * * * * * * * * * * * * * * * * * * * * * * * * */
	$.fn.theoneDatepicker = function(options) {
        var defaults4Datepicker = {
            onSelect : function(dateText, inst) {
				// validate the input
        		if(!typeof $(this).valid == 'undefined')
        			$(this).valid();
            }
        };

		var defaults = {
			mask : "99/99/9999"
		};
		// Extend our default options with those provided.
		var opts4Datepicker = $.extend(defaults4Datepicker, options);
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

		this.datepicker(opts4Datepicker).mask(opts.mask, opts);

        // used for Online1Datagrid
		$(this).attr('component_type', 'datepicker');

		return this;
	};

	$.fn.theoneNumber = function(options) {
		var defaults = {

		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

		this.numeric();

		return this;
	};

	$.fn.theoneValidate = function(options) {
		var defaults = {
            // to prevent user press 'enter' to submit form
            disableEnter : false,
			// the errorPlacement has to take the table layout into account
			errorPlacement : function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());
				else if (element.is(":checkbox"))
					error.appendTo(element.next());
				else
					error.appendTo(element.parent().next());
			},
			errorClass : "validateError",
			// set this class to error-labels to indicate valid fields
			success : function(label) {
				// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("checked");
		}
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

		this.validate(opts);

        if (opts.disableEnter) {
            this.bind("keypress", function(event) {
                if (event.keyCode == 13) return false;
            });
        }

		return this;
	};

	$.fn.theoneDialog = function(options) {
		var defaults = {
            bgiframe : true,
            modal : true,
            autoOpen : false,
            minWidth : 450,
            hide: 'clip'
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

		this.dialog(opts);

		return this;
	};

	$.fn.theoneAutocomplete = function(url, options) {

		var defaults = {
			/*
			 if resultEvent = true, need to implement onSelect & onUnselect event
			 */
			resultEvent : true,

			width : 260,
			selectFirst : false,
			max : 20, /* default is 10. The max records show OR RESPONSE from server */
			minChars : 1, /* default is 1. The minimum char keyin to show 'drop down' */
			mustMatch : true, /* must select a valid 'drop down' the display item (the 'drop down') */
			formatItem : function(data, i, n, value) {
				/*
				data - array [name, id] for example, [deptName, deptId]
				i - element (not index) in RESPONSE html
				n - total elements
				value - equals to data[0]
				*/
				return value;
			},
			// the result put in textfield when user selected
			formatResult : function(data, value) {
				/*
				data - array [name, id] for example, [deptName, deptId]
				value - equals to data[0]
				*/
				return value;
			}
		};

		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.
		this.autocomplete(url, opts);

		// register the event when user select a 'drop down' or lost focus on
		// the textfield.
		// this event will not triggered for lost focus if 'mustMatch:false'
		if (opts.resultEvent) {
			if (typeof opts.mustMatch == 'undefined' || !opts.mustMatch) {
				alert('To able to use resultEvent:true, mustMast:true');
				return;
			}

			if (typeof opts.onSelect == 'undefined') {
				alert('The onSelect for Autocomplete is not defined yet');
				return;
			}
			if (typeof opts.onUnselect == 'undefined') {
				alert('The onUnselect for Autocomplete is not defined yet');
				return;
			}

			this.result(function(event, data, formatted) {
				// not select any valid 'drop down'
					if (typeof data == 'undefined') {
						opts.onUnselect('', event, data, formatted);
					} else {
						var value = data[1];

						opts.onSelect(value, event, data, formatted);
					}
				});
		}

		return this;
	};

    $.fn.theoneExit = function(url, options) {
        var defaults = {
            confirm : false
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

        this.click(function(event){
            if(opts.confirm){
                alert("still not implemented yet!!");
            }else{
                window.location = url;
            }
        });
        return this;
    }
    
    $.fn.theoneGoto = function(url, options) {
        var defaults = {
            confirm : false
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

        this.click(function(event){
            if(opts.confirm){
                alert("still not implemented yet!!");
            }else{
                window.location = url;
            }
        });
        return this;
    }
    
    $.fn.theoneUploadify = function(options) {
        var defaults = {
    		'uploader' : uploadifySwfUrl,
    		'cancelImg' : uploadifyCancelImgUrl,
    		'folder' : 'uploads',
    		'queueID' : 'fileQueue',
    		'auto' : true,
    		'multi' : true,
    		'fileDataName' : 'fileData'
		};
		// Extend our default options with those provided.
		var opts = $.extend(defaults, options);
		// Our plugin implementation code goes here.

        this.uploadify(opts);
        return this;
    }

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Online1 plugin - end
	 * * * * * * * * * * * * * * * * * * * * * * * * */

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Form Validation - Start
	 * * * * * * * * * * * * * * * * * * * * * * * * */

	// this rules used for numeric field which not allow -ve value.
	$.validator.addMethod("notAllowNegative", function(value, element, param) {
		return this.optional(element)
				|| /^(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
	}, 'Please enter positive amount');

	// this rules used for select tag in Struts2 (<s:select/>) because default
	// selection for <s:select /> is index -1.
	$.validator.addMethod("requiredSelect", function(value, element, param) {
		return this.optional(element)
				|| /^(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value);
	}, 'This field is required');

	// this rules used for check special character in text field.
	$.validator.addMethod("notAllowSpecialCharacter", function(value, element,
			param) {
		return this.optional(element) || /^(\+)?(\w+)(\w+)?$/.test(value);
	}, 'Special Character not accept');

	/* * * * * * * * * * * * * * * * * * * * * * * * * 
	 * Form Validation - End
	 * * * * * * * * * * * * * * * * * * * * * * * * */
})(jQuery);

function registerSelectableSingleRow(tableModel, tableId) {
	$("#" + tableId + " tbody").click(function(event) {
		$(tableModel.fnSettings().aoData).each(function() {
			$(this.nTr).removeClass('row_selected');
		});
		$(event.target.parentNode).addClass('row_selected');
	});
}

function null2Empty(text) {
	if (text == null) {
		return "";
	} else {
		return $.trim(text);
	}
}