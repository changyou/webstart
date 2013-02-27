<#--
	有关页面小组件
-->
<#include "/assets/version-control.ftl" />

<#-- add js -->
<#macro js file="">
	<#if file=="">
		<script>
			<#nested />
		</script>
	<#else>
		<script src="${file}?v=${ver(file)}"></script>
	</#if>
</#macro>

<#-- add css -->
<#macro css file="">
	<#if DEBUG && USE_LESSJS && file?ends_with(".less")>
		<@less file=file />
		<#return />
	</#if>
	<#if file=="">
		<style type="text/css">
			<#nested/>
		</style>
	<#else>
		<link type="text/css" rel="stylesheet" href="${file}?v=${ver(file)}" />
	</#if>
</#macro>

<#-- add less -->
<#macro less file>
	<link type="text/less" rel="stylesheet/less" href="${file}?v=${ver(file)}" />
</#macro>

<#-- load seajs -->
<#macro seajs main config=JS_PATH + "/seaconfig.js">
	<#if main==""><#return /></#if>
	<script src="${SEAJS_FILE}?v=${ver(SEAJS_FILE)}"></script>
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