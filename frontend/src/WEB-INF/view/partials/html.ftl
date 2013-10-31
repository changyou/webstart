<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="zh-CN" class="no-js">
<!--<![endif]-->
	<head>
	<@block name="head">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<@block name="beforePage"></@block>

		<@block name="pageTitle">
		<title>${APP_TITLE}</title>
		</@block>
	</@block>
	</head>
	<body>
	<@block name="body"></@block>
	<@block name="afterPage"></@block>
	<#-- 站点统计 -->
	<#-- ${SITE_STATE} -->
	</body>
</html>