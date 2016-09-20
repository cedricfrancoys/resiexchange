{************************************
****** Submit Step 2 Template *******
*************************************}
<!-- submit_step_2_center.tpl -->
<div class="submit_page">
	<legend>{#PLIGG_Visual_Submit2_Details#}</legend>
	{checkActionsTpl location="tpl_pligg_submit_step2_start"}
	<form class="form-horizontal" action="{$URL_submit}" method="post" name="thisform" id="thisform" enctype="multipart/form-data" onsubmit="return checkForm()">
		<div class="col-md-6 submit_step_2_left">
			<div class="control-group">
				<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Title#}</label>
				<div class="controls">
					<input type="text" id="title" class="form-control title col-md-4" tabindex="1" name="title" value="{if $submit_title}{$submit_title}{else}{$submit_url_title}{/if}" size="54" maxlength="{$maxTitleLength}" />
					<p class="help-inline">{#PLIGG_Visual_Submit2_TitleInstruct#}</p>
				</div>
			</div>
            <!--
			<div class="control-group">
				<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Category#}</label>
				<div class="controls select-category{if $Multiple_Categories} multi-select-category{/if}">
					{if $Multiple_Categories}
						{section name=thecat loop=$submit_cat_array}
							{$submit_cat_array[thecat].spacercount|repeat_count:'&nbsp;&nbsp;&nbsp;&nbsp;'}
								 <input type="checkbox" class="form-control" name="category[]" value="{$submit_cat_array[thecat].id}" {if $submit_cat_array[thecat].auto_id == $submit_category  || in_array($cat_array[thecat].auto_id,$submit_additional_cats)}checked{/if}> <span class="multi-cat">{$submit_cat_array[thecat].name}</span>							
						{/section}
						<br />
					{else}
						<select id="category" class="form-control category" tabindex="2" name="category" onchange="if ($('#category option:selected').val()>0) $('#lp-category').text($('#category option:selected').text()); else $('#lp-category').text('');">
							<option value="">{#PLIGG_Visual_Submit2_CatInstructSelect#}</option>
							{section name=thecat loop=$submit_cat_array}
								<option value = "{$submit_cat_array[thecat].auto_id}" {if $submit_cat_array[thecat].auto_id == $submit_category  || in_array($cat_array[thecat].auto_id,$submit_additional_cats)}selected{/if}>
									{if $submit_cat_array[thecat].spacercount lt $submit_lastspacer}{$submit_cat_array[thecat].spacerdiff|repeat_count:''}{/if}
									{if $submit_cat_array[thecat].spacercount gt $submit_lastspacer}{/if}
									{$submit_cat_array[thecat].spacercount|repeat_count:'&nbsp;&nbsp;&nbsp;'}
									{$submit_cat_array[thecat].name}
									&nbsp;&nbsp;&nbsp;
									{assign var=submit_lastspacer value=$submit_cat_array[thecat].spacercount}
								</option>
							{/section}
						</select>
					{/if}
					<p class="help-inline">{#PLIGG_Visual_Submit2_CatInstruct#}</p>
				</div>
			</div>
            -->
            <input type="hidden" name="category[]" value="2" />

			{if $enable_group && $output neq ''}
				<div class="control-group">
					<label for="input01" class="control-label">{#PLIGG_Visual_Group_Submit_story#}</label>
					<div class="controls">
						{$output}
					</div>
				</div>
			{/if}
			{checkActionsTpl location="tpl_header_admin_main_comment_subscription"}
			{*{checkActionsTpl location="tpl_timestamp_stories"}*}
			{if $enable_tags}
				<div class="control-group">
					<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Tags#}</label>
					<div class="controls">
						<select tabindex="10" id="tags" name="tags" value="{$tags_words}" class="form-control col-md-4" multiple="multiple" autocomplete="off"></select>
						<p class="help-inline">{#PLIGG_Visual_Submit2_Tags_Example#} {#PLIGG_Visual_Submit2_Tags_Inst2#}</p>
					</div>
				</div>
			{/if}
			{checkActionsTpl location="tpl_pligg_submit_step2_middle"}
			<div class="control-group">
				<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Description#}</label>
				<div class="controls">
					<textarea name="bodytext" id="bodytext" data-provide="markdown" tabindex="15" rows="25"   
                    maxlength="{$maxStoryLength}" WRAP="SOFT">{if $submit_url_description}{$submit_url_description}{/if}{$submit_content}</textarea>
					<br />
					<p class="help-inline">{#PLIGG_Visual_Submit2_DescInstruct#}</p>
				</div>
			</div>
			{if $SubmitSummary_Allow_Edit eq 1}
				<div class="control-group">
					<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Summary#}</label>
					<div class="controls">
						{* if $Story_Content_Tags_To_Allow eq ""}
							<p class="help-inline"><strong>{#PLIGG_Visual_Submit2_No_HTMLTagsAllowed#} </strong>{#PLIGG_Visual_Submit2_HTMLTagsAllowed#}</p>
						{else}
							<p class="help-inline"><strong>{#PLIGG_Visual_Submit2_HTMLTagsAllowed#}:</strong> {$Story_Content_Tags_To_Allow}</p>
						{/if *}
						<textarea name="summarytext" rows="5" maxlength="{$maxSummaryLength}" id="summarytext" class="col-md-4" WRAP="SOFT">{$submit_summary}</textarea>
						<br />
						<p class="help-inline">
							{#PLIGG_Visual_Submit2_SummaryInstruct#}
							{#PLIGG_Visual_Submit2_SummaryLimit#}
							{$StorySummary_ContentTruncate}
							{#PLIGG_Visual_Submit2_SummaryLimitCharacters#}
						</p>
					</div>
				</div>
			{/if}
			{*
				{if $Submit_Show_URL_Input eq 1}
					<div class="control-group">
						<label for="input01" class="control-label">{#PLIGG_Visual_Submit2_Trackback#}</label>
						<div class="controls">
							<input type="text" name="trackback" tabindex="17" id="trackback" class="form-control col-md-5" value="{$submit_trackback}" size="54" />
						</div>
					</div>
				{/if}
			*}
			{checkActionsTpl location="submit_step_2_pre_extrafields"}
			{include file=$tpl_extra_fields.".tpl"}
			{if isset($register_step_1_extra)}
				{$register_step_1_extra}
			{/if}
			<div class="form-actions">            
				<input type="hidden" name="url" id="url" value="{$submit_url}" />
				<input type="hidden" name="phase" value="2" />
				<input type="hidden" name="randkey" value="{$randkey}" />
				<input type="hidden" name="id" value="{$submit_id}" />
				<button class="btn btn-default" tabindex="30" ONCLICK="history.go(-1)">Cancel</button>
				{checkActionsTpl location="tpl_pligg_submit_step2_end"}
				<input class="btn btn-primary" tabindex="31" type="submit" value="{#PLIGG_Visual_Submit2_Continue#}" />
			</div>
		</div>
		{* START STORY PREVIEW *}
		<div class="col-md-6 submit_step_2_right" id="dockcontent">
            <div style="width: 365px; padding: 15px 15px 10px 15px;background-color: #FFF8DC;border: 1px solid #E0DCBF;font-size: 14px;">
            <h3 style="margin-bottom: 18px;">Comment poser une question ?</h1>

<strong>Est-ce bien une question à propos de l'autonomie, la transition ou la permaculture ?</strong><br />
<br />
Est-il possible de répondre à la question et pas seulement d'en débattre ?<br />
<br />
Soyez précis. Donnez des détails. Partagez vos recherches.<br />
            </div>
        
			{checkActionsTpl location="tpl_pligg_submit_preview_start"}			
			<div class="stories" id="xnews-{$link_shakebox_index}">
				{checkActionsTpl location="tpl_pligg_story_start"}
				<div class="headline">
					{if $Voting_Method eq 2}
						<h4 id="ls_title-{$link_shakebox_index}">
							<ul class='star-rating{$star_class}' id="xvotes-{$link_shakebox_index}">
								<li class="current-rating" style="width: {$link_rating_width}px;" id="xvote-{$link_shakebox_index}"></li>
								<span id="mnmc-{$link_shakebox_index}" {if $link_shakebox_currentuser_votes ne 0}style="display: none;"{/if}>
									<li><a href="javascript:{$link_shakebox_javascript_vote_1star}" class='one-star'>1</a></li>
									<li><a href="javascript:{$link_shakebox_javascript_vote_2star}" class='two-stars'>2</a></li>
									<li><a href="javascript:{$link_shakebox_javascript_vote_3star}" class='three-stars'>3</a></li>
									<li><a href="javascript:{$link_shakebox_javascript_vote_4star}" class='four-stars'>4</a></li>
									<li><a href="javascript:{$link_shakebox_javascript_vote_5star}" class='five-stars'>5</a></li>
								</span>
								<span id="mnmd-{$link_shakebox_index}" {if $link_shakebox_currentuser_votes eq 0}style="display: none;"{/if}>
									<li class='one-star-noh'>1</li>
									<li class='two-stars-noh'>2</li>
									<li class='three-stars-noh'>3</li>
									<li class='four-stars-noh'>4</li>
									<li class='five-stars-noh'>5</li>
								</span>
							</ul>
						</h4>
					{else}
						<div class="votebox votebox-published">
							<div class="vote">
								{checkActionsTpl location="tpl_pligg_story_votebox_start"}
								<div class="votenumber">1</div>
								<div id="xvote-{$link_shakebox_index}" class="votebutton">
									<!-- Already Voted -->
									<a class="btn btn-success"><i class="fa fa-white fa-thumbs-up"></i></a>
									<!-- Bury It -->
									<a class="btn btn-default linkVote_{$link_id}"><i class="fa fa-thumbs-down"></i></a>
								</div><!-- /.votebutton -->
								{checkActionsTpl location="tpl_pligg_story_votebox_end"}
							</div><!-- /.vote -->
						</div><!-- /.votebox -->
					{/if}
					<div class="title" id="title-{$link_shakebox_index}">
						<h2>
							{checkActionsTpl location="tpl_pligg_story_title_start"}
							<span class="story_title">&nbsp;</span>
							{checkActionsTpl location="tpl_pligg_story_title_end"}
						</h2>
						<span class="subtext">
							{php}
								global $main_smarty, $current_user;
								if ($current_user->user_id > 0 && $current_user->authenticated) {
									$login=$current_user->user_login;
								}
								// Read the users information from the database
								$user=new User();
								$user->username = $login;
								// Assign smarty variables to use in the template.
								$main_smarty->assign('link_submitter', $user->username);
								$main_smarty->assign('submitter_profile_url', getmyurl('user2', $login, 'profile'));
								$main_smarty->assign('Avatar_ImgSrc', get_avatar('small', $user->avatar_source, $user->username));
							{/php}
							
							{if $UseAvatars neq "0"}<span id="ls_avatar-{$link_shakebox_index}"><img src="{$Avatar_ImgSrc}" width="16px" height="16px" alt="" title="Avatar" /></span>{else}<i class="fa fa-user"></i>{/if}
							<a href="{$submitter_profile_url}">{$link_submitter}</a> 
							<i class="fa fa-time"></i>
							{#PLIGG_Visual_Submit2_InProgress#}
							{if $url_short neq "http://" && $url_short neq "://"}
								<i class="fa fa-globe"></i>
								<a href="{$url}" {if $open_in_new_window eq true} target="_blank"{/if}  {if $story_status neq "published"}rel="nofollow"{/if}>{$url_short}</a>
							{/if}
						</span>
					</div><!-- /.title -->
				</div> <!-- /.headline -->
				<div class="storycontent">
					{checkActionsTpl location="tpl_link_summary_pre_story_content"}
					{if $pagename eq "story"}{checkActionsTpl location="tpl_pligg_story_body_start_full"}{else}{checkActionsTpl location="tpl_pligg_story_body_start"}{/if}
					{if $viewtype neq "short"}
						<span class="news-body-text" id="ls_contents-{$link_shakebox_index}">
							<span class="bodytext">&nbsp;</span>
							<div class="clearboth"></div> 
						</span>
						{checkActionsTpl location="tpl_pligg_story_body_end"}
					{/if}
				</div><!-- /.storycontent -->
				<div class="storyfooter">
					<div class="">
						{checkActionsTpl location="tpl_pligg_story_tools_start"}
						<span id="ls_comments_url-{$link_shakebox_index}">
							<i class="fa fa-comment"></i> <span id="linksummaryDiscuss"><a class="comments">{#PLIGG_MiscWords_Discuss#}</a>&nbsp;</span>
						</span> 
						<i class="fa fa-star"></i> <span id="linksummarySaveLink"><a id="add" class="favorite" >{#PLIGG_MiscWords_Save_Links_Save#}</a></span>&nbsp;
						<span id="stories-{$link_shakebox_index}" class="label label-success" style="display:none;line-height:1em;">{#PLIGG_MiscWords_Save_Links_Success#}</span>
						{if $enable_group eq "true" && $user_logged_in}
							<i class="fa fa-group"></i> <span class="group_sharing"><a>{#PLIGG_Visual_Group_Share#}</a></span>
						{/if}
						{checkActionsTpl location="tpl_pligg_story_tools_end"}
					</div>
					<div class="">
						<!-- <i class="fa fa-folder"></i> <a><span class="category">&nbsp;</span></a> -->
						{if $enable_tags}
							<i class="fa fa-tag"></i> <a><span class="tags"></span></a>
						{/if}	
					 </div><!-- /.story-tools-right -->
					 <div style="clear:both;"></div>
				</div><!-- /.storyfooter -->
				{checkActionsTpl location="tpl_link_summary_end"}
			</div><!-- /.stories -->
			{checkActionsTpl location="tpl_pligg_story_end"}
		</div>
		{* END STORY PREVIEW *}
	</form>
	{checkActionsTpl location="tpl_pligg_submit_step2_after_form"}
</div>
{literal}
<script type="text/javascript">
$(document).ready(function(){
$("#tags").select2({
  ajax: {
    url: "gettags.php",
    dataType: 'json',
    delay: 250,
    data: function (params) {
      return {
        q: params.term
      };
    },
    cache: false
  },
  templateSelection: function (selection) {
        return selection.text;
  },
  templateResult: function (result) {
    return result.id;
  },
  minimumInputLength: 3
  });
});  
</script>
{/literal}
<!--/submit_step_2_center.tpl -->