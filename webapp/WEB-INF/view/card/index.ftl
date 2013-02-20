<#include "/assets/imports.ftl" />
<@override name="afterPage">
	<@seajs config=JS_PATH + "/seaconfig.js"
		main=JS_PATH + "/card/index.js" />
</@override>
<@override name="body">
	hello fff...
</@override>
<@extends name="partials/html.ftl"/>
