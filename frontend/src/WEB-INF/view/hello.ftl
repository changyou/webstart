<#include "/assets/imports.ftl" />

<@override name="beforePage">
	<@css file="${CSS_PATH}/portal/index.css" />
</@override>

<@override name="body">

	<div class="portal">
		<a href="/">
			<h3>返回</h3>
		</a>
		<p>Response: ${name}</p>
	</div>

</@override>

<@extends name="/partials/html.ftl"/>
