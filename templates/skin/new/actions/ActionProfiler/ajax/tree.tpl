{if $oReport}
	<a href="#" class="profiler tree {if $sAction=='tree'}active{/if}" onclick="lsProfiler.toggleEntriesByClass('{$oReport->getId()}','tree',this); return false;">{$aLang.profiler_entries_show_tree}</a> 
	<a href="#" class="profiler all {if $sAction=='all'}active{/if}" onclick="lsProfiler.toggleEntriesByClass('{$oReport->getId()}','all',this); return false;">{$aLang.profiler_entries_show_all} ({$aStat.count})</a> 
	<a href="#" class="profiler query {if $sAction=='query'}active{/if}"  onclick="lsProfiler.toggleEntriesByClass('{$oReport->getId()}','query',this); return false;">{$aLang.profiler_entries_show_query} ({$aStat.query})</a>
	
	{include file='actions/ActionProfiler/ajax/level.tpl'}
{else}
	 {$aLang.error}
{/if}