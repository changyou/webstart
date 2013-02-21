<#--
	有关页面小组件
-->

<#-- add js -->
<#macro js file="">
	<#if file=="">
		<script>
			<#nested />
		</script>
	<#else>
		<script src="${file}"></script>
	</#if>
</#macro>

<#-- add css -->
<#macro css file="">
	<#if DEBUG && file?ends_with(".less")>
		<@less file=file />
		<#return />
	</#if>
	<#if file=="">
		<style type="text/css">
			<#nested/>
		</style>
	<#else>
		<link type="text/css" rel="stylesheet" href="${file}" />
	</#if>
</#macro>

<#-- add less -->
<#macro less file>
	<link type="text/less" rel="stylesheet/less" href="${file}" />
</#macro>

<#-- load seajs -->
<#macro seajs main config=JS_PATH + "/seaconfig.js">
	<#if main==""><#return /></#if>
	<script src="${APP_URL}/js/modules/seajs/sea.js"></script>
	<@js file=config />
	<#if DEBUG>
		<!-- JUST FOR DEVELOP -->
		<@js file=DEBUG_JS_PATH />
		<!-- JUST FOR DEVELOP -->
	</#if>
	<@js>
		seajs.use("${main}");
	</@js>
</#macro>