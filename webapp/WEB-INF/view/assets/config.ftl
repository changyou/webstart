<#--
	全局设置
-->

<#-- PATHS -->
<#global APP_URL    = "http://localhost:3000" />
<#global CSS_PATH   = APP_URL + "/css" />
<#global JS_PATH    = APP_URL + "/js" />
<#global JS_MODULES = APP_URL + "/js/modules" />
<#global IMG_PATH   = APP_URL + "/img" />

<#-- SITE INFO -->
<#global APP_TITLE  = "网站名称" />
<#global STYLES_FILE_EXT = ".css" />
<#global SCRIPT_FILE_EXT = ".js" />

<#global SITE_STATE>
	<!-- Site Stat -->
	<div style="display:;">
	<script src="http://s4.cnzz.com/stat.php?id=4802554&web_id=4802554" language="JavaScript"></script>
	</div>
</#global>

<#--DEBUG CONFIG-->
<#global DEBUG_JS_PATH = JS_PATH + "/jsDebug.js" />
<#if !DEBUG??>
	<#global DEBUG = false />
	<#global STYLES_FILE_EXT = ".less" />
</#if>
<#global USE_LESSJS = false />