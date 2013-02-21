<#include "/assets/imports.ftl" />

<@override name="beforePage">
	<@css file="${CSS_PATH}/card/index.less" />
</@override>
<@override name="afterPage">
	<@seajs config=JS_PATH + "/seaconfig.js"
		main=JS_PATH + "/card/index.js" />
</@override>
<@override name="body">
	hello fff... 
	<br/>
	<a href="/hello"> say hello </a>
</@override>
<@extends name="partials/html.ftl"/>
