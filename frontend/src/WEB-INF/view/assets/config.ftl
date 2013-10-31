<#--
	全局设置
-->

<#-- PATHS -->
<#global APP_URL    = "http://localhost:3000" />
<#global CSS_PATH   = APP_URL + "/style" />
<#global JS_PATH    = APP_URL + "/script" />
<#global JS_MODULES = APP_URL + "/lib" />
<#global IMG_PATH   = APP_URL + "/image" />

<#-- SITE INFO -->
<#global APP_TITLE  = "网站名称" />

<#global SEAJS_FILE = APP_URL + "/lib/seajs/sea.js" />
<#global SITE_STATE>
	<!-- Site Stat -->
	<div style="display:none;">
	<script src="http://s4.cnzz.com/stat.php?id=4802554&web_id=4802554" language="JavaScript"></script>
	</div>
</#global>

<#--DEBUG CONFIG-->
<#if !DEBUG??>
	<#global DEBUG = false />
	<#global STYLES_FILE_EXT = ".less" />
</#if>
