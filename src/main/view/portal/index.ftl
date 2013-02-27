<#include "/assets/imports.ftl" />

<@override name="beforePage">
	<@css file="${CSS_PATH}/portal/index.css" />
</@override>

<@override name="body">

	<div class="portal">
		<a href="/hello">
			<h1>有一种魅力，叫独自走过</h1>
		</a>
		<p>DEBUG:${DEBUG?string}</p>
	</div>

</@override>

<@override name="afterPage">
	<@seajs config=JS_PATH + "/seaconfig.js"
		main=JS_PATH + "/portal/index.js" />
</@override>
<@extends name="/partials/html.ftl"/>
