{************************************
********** Footer Template **********
*************************************}
<!-- footer.tpl -->
<div id="footer">
	{checkActionsTpl location="tpl_pligg_footer_start"}
	<span class="subtext"> 
		Copyright &copy; {php} echo date('Y'); {/php} {#PLIGG_Visual_Name#}
		| <a href="{$URL_advancedsearch}">{#PLIGG_Visual_Search_Advanced#}</a> 
		{if $Enable_Live}
			| <a href="{$URL_live}">{#PLIGG_Visual_Live#}</a>
		{/if}
		{if $Enable_Tags}
			| <a href="{$URL_tagcloud}">{#PLIGG_Visual_Tags#}</a>
		{/if}
		| <a href="{$URL_topusers}">{#PLIGG_Visual_Top_Users#}</a>
		| <a href="{$my_base_url}{$my_pligg_base}/rssfeeds.php">{#PLIGG_Visual_RSS_Feeds#}</a> 
	</span>
	{checkActionsTpl location="tpl_pligg_footer_end"}
</div>
<!--/footer.tpl -->