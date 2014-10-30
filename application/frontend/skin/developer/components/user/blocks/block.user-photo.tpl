{**
 * Блок с фотографией пользователя в профиле
 *
 * @styles css/blocks.css
 * @scripts <framework>/js/livestreet/user.js
 *}

{extends 'components/block/block.tpl'}

{block 'block_options' append}
	{$mods = "{$mods} user-photo"}
	{$classes = "{$classes} js-ajax-photo-upload"}
{/block}

{block 'block_content'}
	<div class="profile-photo-wrapper">
		{* Статус онлайн\оффлайн *}
		{if $oSession}
			{if $oUserProfile->isOnline() &&  $smarty.now - strtotime($oSession->getDateLast()) < 60*5}
				<div class="status status-online">{$aLang.user.status.online}</div>
			{else}
				<div class="status status-offline">
					{$date = {date_format date=$oSession->getDateLast() hours_back="12" minutes_back="60" day_back="8" now="60*5" day="day H:i" format="j F в G:i"}}

					{if $oUserProfile->getProfileSex() != 'woman'}
						{lang name='user.status.was_online_male' date=$date}
					{else}
						{lang name='user.status.was_online_female' date=$date}
					{/if}
				</div>
			{/if}
		{/if}

		{* Фото *}
		<a href="{$oUserProfile->getUserWebPath()}">
			<img src="{$oUserProfile->getProfileFotoPath()}" alt="{$oUserProfile->getDisplayName()} photo" class="profile-photo js-ajax-user-photo-image" />
		</a>
	</div>

	{if $oUserProfile->isAllowEdit()}
		<p class="upload-photo">
			<label for="photo" class="form-input-file">
                <span class="js-ajax-user-photo-upload-choose link-dotted">{if $oUserProfile->getProfileFoto()}{lang 'user.blocks.photo.change_photo'}{else}{lang 'user.blocks.photo.upload_photo'}{/if}</span>
                <input type="file" name="photo" id="photo" class="js-ajax-user-photo-upload" data-user-id="{$oUserProfile->getId()}">
            </label>
			<a href="#" data-user-id="{$oUserProfile->getId()}" class="js-ajax-user-avatar-change link-dotted" style="{if !$oUserProfile->getProfileFoto()}display:none;{/if}">{lang 'user.blocks.photo.change_avatar'}</a>
			<a href="#" data-user-id="{$oUserProfile->getId()}" class="js-ajax-user-photo-upload-remove link-dotted" style="{if !$oUserProfile->getProfileFoto()}display:none;{/if}">{lang 'user.blocks.photo.remove'}</a>
		</p>
	{/if}
{/block}