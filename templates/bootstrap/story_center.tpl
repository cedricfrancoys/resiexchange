{************************************
****** Story Wrapper Template *******
*************************************}
<!-- story_center.tpl -->
{checkActionsTpl location="tpl_pligg_content_start"}
{$the_story}
<div style="margin-bottom: 30pt;"></div>
<script language="javascript">
var story_link="{$story_url}";
{literal}

	$(function () {
		$('#storytabs a[href="#who_voted"]').tab('show');
		$('#storytabs a[href="#who_downvoted"]').tab('show');
		$('#storytabs a[href="#related"]').tab('show');
		$('#storytabs a[href="#comments"]').tab('show');
	});

{/literal}

{if $urlmethod==2}
    {literal}
        function show_comments(id){
			document.location.href=story_link+'/'+id+'#comment-'+id;
        }
        function show_replay_comment_form(id){
           document.location.href=story_link+'/reply/'+id+'#comment-reply-'+id;
        }
    {/literal}
{else}
    {literal}
        function show_comments(id){
			document.location.href=story_link+'&comment_id='+id+'#comment-'+id;
        }
        function show_replay_comment_form(id){
           document.location.href=story_link+'&comment_id='+id+'&reply=1#comment-reply-'+id;
        }
    {/literal}
{/if}
</script>

<div id="tabbed" class="tab-content">

	<div class="tab-pane fade active in" id="comments" >
		{checkActionsTpl location="tpl_pligg_story_comments_start"}
		<h3>{#PLIGG_Visual_Story_Comments#}</h3>
		<a name="comments" href="#comments"></a>
		<ol class="media-list comment-list">
			{checkActionsTpl location="tpl_pligg_story_comments_individual_start"}
				{$the_comments}
			{checkActionsTpl location="tpl_pligg_story_comments_individual_end"}
			{if $user_authenticated neq ""}
				{include file=$the_template."/comment_form.tpl"}
			{else}
				{checkActionsTpl location="anonymous_comment_form_start"}
				<div align="center" class="login_to_comment">
					<br />
					<h3><a href="{$login_url}">{#PLIGG_Visual_Story_LoginToComment#}</a> {#PLIGG_Visual_Story_Register#} <a href="{$register_url}">{#PLIGG_Visual_Story_RegisterHere#}</a>.</h3>
				</div>
				{checkActionsTpl location="anonymous_comment_form_end"}
			{/if}
		</ol>
		{checkActionsTpl location="tpl_pligg_story_comments_end"}
	</div>
	
	{checkActionsTpl location="tpl_pligg_story_tab_end_content"}
</div>
<!--/story_center.tpl -->

