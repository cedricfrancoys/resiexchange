{************************************
***** Published Pages Template ******
*************************************}
<!-- index_center.tpl -->

{if !$link_summary_output && $pagename == 'index' && count($templatelite.get) == 0}
	{* Welcome message for new installations *}
	<div class="well blank_index">
		<h2>Bienvenue sur ResiExchange !</h2>
		<p style="font-size:1.0em;">
        <strong>ResiExchange</strong> est une plateforme collaborative d'échange d'informations pour les initiatives aspirant à la résilience. C'est un outil dont le développement et la participation est ouvert à tous et supporté par l'association <a href='http://www.resiway.org/'>ResiWay</a>. Avec l'aide de chacun, l'objectif est de constituer une bibliothèque de réponses détaillées aux questions relatives à l'autonomie, la transition et la permaculture.<br />
<br />
<br />
        <a href="#" class="btn btn-info">Découvrir les fonctionnalités</a>
        <a href="new.php" class="btn btn-info">Consulter les question-réponses</a>
		<a href="submit.php" class="btn btn-primary">Poser votre première question</a>
	</div>
{/if}

{$link_summary_output}

{checkActionsTpl location="tpl_pligg_pagination_start"}
{$link_pagination}
{checkActionsTpl location="tpl_pligg_pagination_end"}
<!--/index_center.tpl -->