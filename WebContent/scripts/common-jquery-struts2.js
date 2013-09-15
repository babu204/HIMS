/**
This js only applicable by jquery-struts2 framework only.
*/


/**
 * This function used to detect the JSON return from server is valid or not. if
 * return is 'ERROR', meaning the server throws error. if return is 'SUCCESS',
 * meaning OK. if return is 'UNDEFINED', meaning the JSON is null or undefined.
 * 
 * @param json
 * @return
 */
function verifyReturnJsonStatus(json){
	if(typeof json == 'undefined' || json == null){
		return 'UNDEFINED';
	}
	
	if(typeof json['exception.message'] == 'string'){
		return 'ERROR';
	}
	
	return 'SUCCESS';
}

function JsonStat(json, options) {
	var defaults = {
		onSuccess : function(json) {
			alert("this is default success function for JsonStat. onSuccess function need to be overwrite");
		},
		onFailure : function(json) {
			_showErrorMessage();
		}
	};

	// Extend our default options with those provided.
	var opts = $.extend( {}, defaults, options);

	var _json = json;

	function _getJsonStatus() {
		if (typeof _json == 'undefined' || _json == null) {
			return 'UNDEFINED';
		}

		if (typeof _json['exception.message'] == 'string'
				&& _json['exception.message'] != '') {
			return 'ERROR';
		}

		if (typeof _json.fieldErrors == 'object'
				&& _json.fieldErrors.length) {
			return 'ERROR';
		}

		return 'SUCCESS';
	}

	function _getErrorMessage() {
		if (typeof _json == 'undefined' || _json == null) {
			return '';
		}

		if (typeof _json['exception.message'] == 'string'
				&& _json['exception.message'] != '') {
			return _json['exception.message'];
		}

		if (typeof _json.fieldErrors == 'object'
				&& _json.fieldErrors.length) {
			var s = '';

			$.each(_json.fieldErrors, function(n, value) {
				s += value.name + " - " + value.msg + "\n";
			});

			return s;
		}

		return '';
	}

	function _showErrorMessage() {
		messageBox.alert(_getErrorMessage());
	}

	this.getJsonStatus = _getJsonStatus;
	this.getErrorMessage = _getErrorMessage;
	this.showErrorMessage = _showErrorMessage;

	var stat = _getJsonStatus();
	if (stat == 'SUCCESS') {
		opts.onSuccess(_json);
	} else {
		opts.onFailure(_json, _getErrorMessage());
	}
};

messageBox = {};
messageBox.alert = function(msg){
	
	// if not defined
	if(!$("#messageBox_alert").length){
		// $("<div id='messageBox_alertModal'><p align='center'
		// id='messageBox_alert'></p></div>").appendTo("body");
		
		var s = "<div id='messageBox_alertModal'>\n<div class='ui-widget'>\n<div class='ui-state-error ui-corner-all' style='padding: 0 .7em;'>"
			+ "<p><span class='ui-icon ui-icon-alert' style='float: left; margin-right: .3em;'></span>"
			+ "<span id='messageBox_alert'></span></p>"
			+ "\n</div>\n</div>\n</div>";
		
		$(s).appendTo("body");
		/*
		 * <div class='ui-widget'> <div class='ui-state-error ui-corner-all'
		 * style='padding: 0 .7em;'> <p><span class='ui-icon ui-icon-alert'
		 * style='float: left; margin-right: .3em;'></span> <strong
		 * id='messageBox_alert'></strong></p> </div> </div>
		 */
		
		$("#messageBox_alertModal").theoneDialog({
			title:"Alert",
			// position : 'center',
			buttons:{
				"OK" : function(){
					$(this).dialog('close');
				}
			}
		});
	}
	
	$("#messageBox_alert").html(msg);
	$("#messageBox_alertModal").dialog('open');
};

messageBox.info = function(msg){
	
	// if not defined
	if(!$("#messageBox_info").length){
		// $("<div id='messageBox_alertModal'><p align='center'
		// id='messageBox_alert'></p></div>").appendTo("body");
		
		var s = "<div id='messageBox_infoModal'>\n<div class='ui-widget'>\n<div class='ui-widget-content ui-corner-all' style='padding: 0 .7em;'>"
			+ "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>"
			+ "<span id='messageBox_info'></span></p>"
			+ "\n</div>\n</div>\n</div>";
		
		$(s).appendTo("body");
		
		$("#messageBox_infoModal").theoneDialog({
			title:"Information",
			// position : 'center',
			buttons:{
				"OK" : function(){
					$(this).dialog('close');
				}
			}
		});
	}
	
	$("#messageBox_info").html(msg);
	$("#messageBox_infoModal").dialog('open');
};

messageBox.confirmYesNoCancel = function(msg, yesFunc, noFunc, cancelFunc){
	var _confirm = {};
	
	_confirm.yesFunc = function(){};
	_confirm.noFunc = function(){};
	_confirm.cancelFunc = function(){};
	
	if(typeof yesFunc == 'function'){
		_confirm.yesFunc = yesFunc;
	}
	
	if(typeof noFunc == 'function'){
		_confirm.noFunc = noFunc;
	}
	
	if(typeof cancelFunc == 'function'){
		_confirm.cancelFunc = cancelFunc;
	}
	
	// if not defined
	if(!$("#messageBox_confirmYesNoCancel").length){
		var s = "<div id='messageBox_confirmYesNoCancelModal'>\n<div class='ui-widget'>\n<div class='ui-widget-content ui-corner-all' style='padding: 0 .7em;'>"
			+ "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>"
			+ "<span id='messageBox_confirmYesNoCancel'></span></p>"
			+ "\n</div>\n</div>\n</div>";
		
		$(s).appendTo("body");
		
		$("#messageBox_confirmYesNoCancelModal").theoneDialog({
			title:"Confirmation",
			// position : 'center',
			buttons:{
				"Cancel" : function(){
					$(this).dialog('close');
				},
				"No" : function(){
					$(this).dialog('close');
				},
				"Yes" : function(){
					$(this).dialog('close');
				}
			}
		});
	}
	
	$("#messageBox_confirmYesNoCancel").html(msg);
	
	$("#messageBox_confirmYesNoCancelModal").dialog('option', 'buttons', {
			"Cancel" : function(){
				_confirm.cancelFunc();
				$(this).dialog('close');
			},
			"No" : function(){
				_confirm.noFunc();
				$(this).dialog('close');
			},
			"Yes" : function(){
				_confirm.yesFunc();
				$(this).dialog('close');
			}
		}
	);
	$("#messageBox_confirmYesNoCancelModal").dialog('option', 'close',function(event, ui){
		_confirm.cancelFunc();
	});
	
	$("#messageBox_confirmYesNoCancelModal").dialog('open');
}

messageBox.confirm = function(msg, yesFunc, noFunc){
	var _confirm = {};
	
	_confirm.yesFunc = function(){};
	_confirm.noFunc = function(){};
	_confirm.cancelFunc = function(){};
	
	if(typeof yesFunc == 'function'){
		_confirm.yesFunc = yesFunc;
	}
	
	if(typeof noFunc == 'function'){
		_confirm.noFunc = noFunc;
	}
	
	if(typeof cancelFunc == 'function'){
		_confirm.cancelFunc = cancelFunc;
	}
	
	// if not defined
	if(!$("#messageBox_confirm").length){
		var s = "<div id='messageBox_confirmModal'>\n<div class='ui-widget'>\n<div class='ui-widget-content ui-corner-all' style='padding: 0 .7em;'>"
			+ "<p><span class='ui-icon ui-icon-info' style='float: left; margin-right: .3em;'></span>"
			+ "<span id='messageBox_confirm'></span></p>"
			+ "\n</div>\n</div>\n</div>";
		
		$(s).appendTo("body");
		
		$("#messageBox_confirmModal").theoneDialog({
			title:"Confirmation",
			// position : 'center',
			buttons:{
				"No" : function(){
					$(this).dialog('close');
				},
				"Yes" : function(){
					$(this).dialog('close');
				}
			}
		});
	}
	
	$("#messageBox_confirm").html(msg);
	
	$("#messageBox_confirmModal").dialog('option', 'buttons', {
			"No" : function(){
				_confirm.noFunc();
				$(this).dialog('close');
			},
			"Yes" : function(){
				_confirm.yesFunc();
				$(this).dialog('close');
			}
		}
	);
	$("#messageBox_confirmModal").dialog('option', 'close',function(event, ui){
		_confirm.cancelFunc();
	});
	
	$("#messageBox_confirmModal").dialog('open');
}
