<#compress>
	select
		SUB_RECORD_T.*
	from 
		SUB_RECORD_T
		<#if categoryName?exists>, RELATION_T, CATEGORY_T</#if>
		<#if mainName?exists || mainAge?exists>, MAIN_SUB_T, MAIN_RECORD_T</#if>
	where (1=1)
		<#if categoryName?exists>
		and 	CATEGORY_T.NAME like ':categoryName' 
		and CATEGORY_T.ID = RELATION_T.CATEGORY_ID
		and RELATION_T.SUB_ID = SUB_RECORD_T.ID
		</#if>
		<#if mainName?exists>
		and MAIN_RECORD_T.NAME like '%:mainName%'
		</#if>
		<#if mainAge?exists>
		and MAIN_RECORD_T.AGE = :mainAge
		</#if>
		<#if mainName?exists || mainAge?exists>
		and MAIN_SUB_T.SUB_ID = SUB_RECORD_T.ID
		and MAIN_SUB_T.MAIN_ID = MAIN_RECORD_T.ID
		</#if>
</#compress>