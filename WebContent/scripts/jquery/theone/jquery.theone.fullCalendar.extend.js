(function($) {
	$.fn.theoneFullCalendar = function(options) {
		var defaults = {
			extraParam : null,
			events : function(start, end, callback) {
				var aoData = _addExtraParam(start, end);

				var url = _getUrl();

				// not check on user session
				if (false) {
					$.theoneUtil.checkUserLogin(function() {
						$.getJSON(url, aoData, function(json) {
							new JsonStat(json, {
								onSuccess : function(json) {
									callback(json.events);
								},
								onFailure : function(json, error) {
									messageBox.alert(error);
								}
							});
						});
					});
				} else {
					$.getJSON(url, aoData, function(json) {
						new JsonStat(json, {
							onSuccess : function(json) {
								callback(json.events);
							},
							onFailure : function(json, error) {
								messageBox.alert(error);
							}
						});
					});
				}
			},

			// fullCalendar params
			theme: true,
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
		};

		// Extend our default options with those provided.
		var opts = $.extend( {}, defaults, options);
		// Our plugin implementation code goes here.

		// init the origin fullCalendar
		this.fullCalendar(opts);

		var _self = this;

		function _addExtraParam(start, end) {
			var aoData = {
				'start' : start.getTime(),
				'end' : end.getTime()
			};

			if (opts.extraParam != null) {
				opts.extraParam(aoData);
			}

			return aoData;
		}

		function _getUrl() {
			if (typeof opts.url == 'undefined' || opts.url == null) {
				alert("url is undefined!!");
				return "";
			}
			return opts.url;
		}

		return this;
	};
})(jQuery);