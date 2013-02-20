<#--
	有关页面小组件
-->

<#-- add js -->
<#macro js file="" inline=false>
	<#if file=="">
		<script>
			<#nested />
		</script>
		<#return />
	</#if>
	<#if inline>
		<script>
			<#include file parse=false />
		</script>
	<#else>
		<script src="${file}"></script>
	</#if>
</#macro>

<#-- add css -->
<#macro css file="" inline=false>
	<#if file=="">
		<style type="text/css">
			<#nested/>
		</style>
		<#return />
	</#if>
	<#if inline>
		<style type="text/css"><#include file parse=false /></style>
	<#else>
		<link type="text/css" rel="stylesheet" href="${file}" />
	</#if>
</#macro>

<#-- load seajs -->
<#macro seajs main config=JS_PATH + "/seaconfig.js">
	<#if main==""><#return /></#if>
	<script src="${APP_URL}/js/modules/seajs/sea.js"></script>
	<@js file=config />
	<#if DEBUG==true>
		<!-- JUST FOR DEVELOP -->
		<@js>
			seajs.config({
				vars: {
					"aaa": "fff"
				},
				debug: true
			});
		</@js>
		<!-- JUST FOR DEVELOP -->
	</#if>
	<@js>
		seajs.use("${main}");
	</@js>
</#macro>