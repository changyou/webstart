
<#--
	版本规则列表, 需要手动维护

	{ 规则：版本号 }
-->
<#assign verRules = {

	<#-- Match all -->
	".*": "0.1",

	<#-- Match /card/*.js -->
	".+\\.js$": "0.2",

	<#-- Match seaconfig.js -->
	".+seaconfig.js$": "0.11"

} />

<#--
	遍历版本规则列表，根据正则匹配版本号

	注：
		按keys顺序，后面会覆盖前面的匹配结果
-->
<#function ver file>

	<#local ret = "">
	<#list verRules?keys as r>
		<#if file?matches(r)>
			<#local ret=verRules[r] />
		</#if>
	</#list>

	<#return ret />
</#function>
