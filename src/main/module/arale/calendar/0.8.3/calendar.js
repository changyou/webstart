define("arale/calendar/0.8.3/model",["$","arale/base/1.0.1/base","arale/class/1.0.0/class","arale/events/1.0.0/events","gallery/moment/1.6.2/moment"],function(a,b,c){function j(a){if(a=(""+(a||0)).toLowerCase(),d.isNumeric(a))return a=parseInt(a);for(var b=0;i.length>b;b++)if(0===i[b].indexOf(a)){a=b;break}return a}function k(a){var b=[];for(e=0;h.length>e;e++)b.push({value:e,label:h[e]});for(var c={value:a,label:h[a]},d=[],e=0;b.length/3>e;e++)d.push(b.slice(3*e,3*e+3));return{current:c,items:d}}function l(a){for(var b=[{value:a-10,label:". . .",role:"previous-10-year"}],c=a-6;a+4>c;c++)b.push({value:c,label:c,role:"year"});b[7]={value:a,label:a,role:"year",current:!0},b.push({value:a+10,label:". . .",role:"next-10-year"});var d=[];for(c=0;b.length/3>c;c++)d.push(b.slice(3*c,3*c+3));var e={value:a,label:a};return{current:e,items:d}}function n(a){a=j(a);for(var b=[],c=a;7>c;c++)b.push({label:m[c],value:c});for(c=0;a>c;c++)b.push({label:m[c],value:c});var d={value:a,label:m[a]};return{current:d,items:b}}function o(a,b,c){var e,f,g,d=[];b=j(b);var h=function(a,b){d.push({value:a.format("YYYY-MM-DD"),label:a.date(),day:a.day(),className:b,available:p(a,c)})},i=a.clone().date(1),k=i.clone().add("months",-1),l=i.clone().add("months",1);if(e=i.day()-b,0>e&&(e+=7),0!=e)for(g=k.daysInMonth(),n=e-1;n>=0;n--)f=k.date(g-n),h(f,"previous-month");for(g=i.daysInMonth(),n=1;g>=n;n++)f=i.date(n),h(f,"current-month");if(e=35-d.length,0!=e)for(0>e&&(e+=7),n=1;e>=n;n++)f=l.date(n),h(f,"next-month");for(var m=[],n=0;d.length/7>n;n++)m.push(d.slice(7*n,7*n+7));var o={value:a.format("YYYY-MM-DD"),label:a.date()};return{current:o,items:m}}function p(a,b){if(null==b)return!0;if(d.isArray(b)){var c=b[0],e=b[1],g=!0;return c&&(g=g&&a>=f(c)),e&&(g=g&&f(e)>=a),g}return d.isFunction(b)?b(a):!0}var d=a("$"),e=a("arale/base/1.0.1/base"),f=a("gallery/moment/1.6.2/moment"),g=e.extend({attrs:{year:{setter:function(a){return l(a)}},month:{setter:function(a){return k(a)}},day:{setter:function(){return n(this.startDay)}},date:{setter:function(a){return o(a,this.startDay,this.range)}},mode:{setter:function(a){var b={date:!1,month:!1,year:!1};return b[a]=!0,b}},message:null},initialize:function(a){g.superclass.initialize.call(this),this.startDay=a.startDay||0,this.activeTime=f(a.focus).clone(),this.range=a.range||null;var b=a.message||{};b.today="Today",this.set("message",b),this.set("mode","date"),this._refresh()},changeYear:function(a){this.activeTime.add("years",a),this._refresh(),this.trigger("changeYear")},changeMonth:function(a){this.activeTime.add("months",a),this._refresh(),this.trigger("changeMonth")},changeDate:function(a){var b=this.activeTime.format("YYYY-MM");this.activeTime.add("days",a),this._refresh();var c=this.activeTime.format("YYYY-MM");b!=c&&this.get("mode").date&&this.trigger("changeMonth")},changeStartDay:function(a){this.startDay=a,this._refresh(),this.trigger("changeStartday")},changeMode:function(a,b){b||(b={}),"month"in b&&this.activeTime.month(b.month),"year"in b&&this.activeTime.year(b.year),this.get("mode")[a]?this.set("mode","date"):this.set("mode",a),this._refresh(),this.trigger("changeMode")},changeRange:function(a){this.range=a,this._refresh(),this.trigger("changeRange")},selectDate:function(a){if(a){var b=this.activeTime.format("YYYY-MM");this.activeTime=f(a),this._refresh();var c=this.activeTime.format("YYYY-MM");b!=c&&this.get("mode").date&&this.trigger("changeMonth")}return this.activeTime.clone()},isInRange:function(a){return p(a,this.range)},toJSON:function(){var a={},b=this.attrs;for(var c in b)a[c]=this.get(c);return a},_refresh:function(){this.set("year",this.activeTime.year()),this.set("month",this.activeTime.month()),this.set("date",this.activeTime.clone()),this.set("day"),this.trigger("refresh")},range:null,activeTime:null,startDay:0}),h=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],i=["sunday","monday","tuesday","wednesday","thursday","friday","saturday"],m=["Su","Mo","Tu","We","Th","Fr","Sa"];c.exports=g}),define("arale/calendar/0.8.3/calendar",["./model","$","gallery/moment/1.6.2/moment","arale/overlay/0.9.12/overlay","arale/position/1.0.0/position","arale/iframe-shim/1.0.0/iframe-shim","arale/widget/1.0.2/widget","arale/base/1.0.1/base","arale/class/1.0.0/class","arale/events/1.0.0/events","arale/widget/1.0.2/templatable","gallery/handlebars/1.0.0/handlebars"],function(a,b,c){function n(a,b){for(var c,d=b.get("mode"),e=["date","month","year"],f=0;e.length>f;f++)d[e[f]]&&(c=e[f]);if(c){var g="[data-value="+b.get(c).current.value+"]";a.find(".focused-element").removeClass("focused-element"),a.find(g).addClass("focused-element")}}var d=a("$"),e=a("gallery/moment/1.6.2/moment"),f=a("arale/overlay/0.9.12/overlay"),g=a("arale/widget/1.0.2/templatable"),h="i18n!lang",i=a(h)||{},j='<div class="ui-calendar">\n<ul class="ui-calendar-navigation" data-role="navigation-container">\n<li class="ui-calendar-previous-year" data-role="prev-year">&lt;&lt;</li>\n<li class="ui-calendar-previous-month" data-role="prev-month">&lt;</li>\n<li class="ui-calendar-month-year" data-role="month-year-container">\n<span class="month" data-role="mode-month" data-value="{{month.current.value}}">{{_ month.current.label}}</span>\n<span class="year" data-role="mode-year">{{year.current.label}}</span>\n</li>\n<li class="ui-calendar-next-month" data-role="next-month">&gt;</li>\n<li class="ui-calendar-next-year" data-role="next-year">&gt;&gt;</li>\n</ul><ul class="ui-calendar-control" data-role="pannel-container">\n{{#if mode.date}}\n{{#each day.items}}\n<li class="ui-calendar-day ui-calendar-day-{{value}}" data-role="day" data-value="{{value}}">{{_ label}}</li>\n{{/each}}\n{{/if}}\n</ul><div class="ui-calendar-data-container" data-role="data-container">\n{{#if mode.date}}\n{{#each date.items}}\n<ul class="ui-calendar-date-column">\n{{#each this}}\n<li class="ui-calendar-day-{{day}} {{className}}\n{{#unless available}}disabled-date{{/unless}}\n"\ndata-role="date" data-value="{{value}}"\n>{{label}}</li>\n{{/each}}\n</ul>\n{{/each}}\n{{/if}}{{#if mode.month}}\n{{#each month.items}}\n<ul class="ui-calendar-month-column">\n{{#each this}}\n<li data-role="month" data-value="{{value}}">{{_ label}}</li>\n{{/each}}\n</ul>\n{{/each}}\n{{/if}}{{#if mode.year}}\n{{#each year.items}}\n<ul class="ui-calendar-year-column">\n{{#each this}}\n<li data-role="{{role}}" data-value="{{value}}">{{_ label}}</li>\n{{/each}}\n</ul>\n{{/each}}\n{{/if}}\n</div><ul class="ui-calendar-footer" data-role="time-container">\n<li class="ui-calendar-today" data-role="today">{{_ message.today}}</li>\n{{#if mode.time}}\n<li class="ui-calendar-time" colspan="2" data-role="time"><span class="ui-calendar-hour">{{time.hour}}</span> : {{time.minute}}</li>\n{{/if}}\n</ul>\n</div>',k=a("./model"),l={trigger:null,triggerType:"click",format:"YYYY-MM-DD",output:{value:"",getter:function(a){return a=a?a:this.get("trigger"),d(a)}},align:{getter:function(){var a=this.get("trigger");return a?{selfXY:[0,0],baseElement:a,baseXY:[0,d(a).height()+10]}:{selfXY:[0,0],baseXY:[0,0]}}},startDay:"Sun",showTime:!1,hideOnSelect:!0,focus:{value:"",getter:function(a){return a=a?a:d(this.get("trigger")).val(),a?e(a,this.get("format")):e()}},range:null,template:j,model:{getter:function(){if(!this.hasOwnProperty("model")){var a={focus:this.get("focus"),range:this.get("range"),showTime:this.get("showTime"),startDay:this.get("startDay")};this.model=new k(a)}return this.model}}},m=f.extend({Implements:[g],attrs:l,events:{"click [data-role=mode-year]":"_changeMode","click [data-role=prev-year]":"prevYear","click [data-role=next-year]":"nextYear","click [data-role=mode-month]":"_changeMode","click [data-role=prev-month]":"prevMonth","click [data-role=next-month]":"nextMonth","click [data-role=previous-10-year]":"_selectYear","click [data-role=next-10-year]":"_selectYear","click [data-role=year]":"_selectYear","click [data-role=month]":"_selectMonth","click [data-role=day]":"_selectDay","click [data-role=date]":"_selectDate","click [data-role=today]":"_selectToday"},templateHelpers:{_:function(a){return i[a]||a}},setup:function(){m.superclass.setup.call(this);var a=this,b=d(this.get("trigger"));b.on(this.get("triggerType"),function(){a.show(),n(a.element,a.model)}),b.on("keydown",function(b){a._keyControl(b)}),b.on("blur",function(){a.hide()}),a.element.on("mousedown",function(a){if(d.browser.msie&&9>parseInt(d.browser.version,10)){var c=b[0];c.onbeforedeactivate=function(){window.event.returnValue=!1,c.onbeforedeactivate=null}}a.preventDefault()});var c=this.model;c.on("changeStartday changeMode",function(){a.renderPartial("[data-role=data-container]"),a.renderPartial("[data-role=pannel-container]"),a.renderPartial("[data-role=month-year-container]"),n(a.element,a.model)}),c.on("changeMonth changeYear",function(){var b=c.get("mode");(b.date||b.year)&&a.renderPartial("[data-role=data-container]"),a.renderPartial("[data-role=month-year-container]"),n(a.element,a.model)}),c.on("changeRange",function(){a.renderPartial("[data-role=data-container]")}),c.on("refresh",function(){n(a.element,a.model)})},show:function(){m.superclass.show.call(this);var a=this.get("output"),b=a.val();b&&this.setFocus(e(b,this.get("format")))},range:function(a){this.model.changeRange(a)},prevYear:function(){this.model.changeYear(-1)},nextYear:function(){this.model.changeYear(1)},prevMonth:function(){this.model.changeMonth(-1)},nextMonth:function(){this.model.changeMonth(1)},setFocus:function(a){this.model.selectDate(a),this.model.changeMode("date"),n(this.element,this.model)},_selectYear:function(a){var b=d(a.target);"year"===b.data("role")?this.model.changeMode("date",{year:b.data("value")}):this.model.changeMode("year",{year:b.data("value")})},_selectMonth:function(a){var b=d(a.target);this.model.changeMode("date",{month:b.data("value")})},_selectDay:function(a){var b=d(a.target);this.model.changeStartDay(b.data("value"))},_selectDate:function(a){var b=d(a.target),c=this.model.selectDate(b.data("value"));this._fillDate(c)},_selectToday:function(){var b=e().format("YYYY-MM-DD"),c=this.model.selectDate(b);this._fillDate(c)},_changeMode:function(a){var b=d(a.target).data("role").substring(5);this.model.changeMode(b)},_keyControl:function(a){var b={68:"date",77:"month",89:"year"};if(a.keyCode in b)return this.model.changeMode(b[a.keyCode]),a.preventDefault(),!1;var c={13:"enter",27:"esc",37:"left",38:"up",39:"right",40:"down"};if(a.keyCode in c){a.preventDefault();var d=c[a.keyCode],e=this.model.get("mode");a.shiftKey&&"down"===d?this.nextYear():a.shiftKey&&"up"===d?this.prevYear():a.shiftKey&&"right"===d?this.nextMonth():a.shiftKey&&"left"===d?this.prevMonth():"esc"===d?this.hide():e.date?this._keyControlDate(d):e.month?this._keyControlMonth(d):e.year&&this._keyControlYear(d)}},_keyControlDate:function(a){if("enter"===a){var b=this.model.selectDate();return this._fillDate(b),void 0}var c={right:1,left:-1,up:-7,down:7};this.model.changeDate(c[a])},_keyControlMonth:function(a){if("enter"===a){var b=this.model.selectDate();return this.model.changeMode("date",{month:b.month()}),void 0}var c={right:1,left:-1,up:-3,down:3};this.model.changeMonth(c[a])},_keyControlYear:function(a){if("enter"===a){var b=this.model.selectDate();return this.model.changeMode("date",{year:b.year()}),void 0}var c={right:1,left:-1,up:-3,down:3};this.model.changeYear(c[a])},_fillDate:function(a){if(!this.model.isInRange(a))return this.trigger("selectDisabledDate",a),this;this.trigger("selectDate",a);var b=this.get("trigger");if(!b)return this;var c=this.get("output");if(c[0].value===void 0)return this;var d=a.format(this.get("format"));c.val(d),this.get("hideOnSelect")&&this.hide()}});m.autoRender=function(a){a.trigger=a.element,a.element="",new m(a)},c.exports=m});