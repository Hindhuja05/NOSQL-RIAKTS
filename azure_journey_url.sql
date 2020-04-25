/* =============================================
FileName: UPDATE_NotificationTemplates_ADD_VARIABLE
Author: Manteo, Michael (Buffalo)
Create date: 20190917094443
Description: Alter the HTML of MFA notification tempaltes to include a variable to replace. 
Ticket: 161202
Schema: True
Environ: ALL
============================================= */

IF EXISTS
	(SELECT 
		ID 
	FROM 
		NotificationTemplates
    WHERE 
		NotificationTemplateTypeId = 37)
	BEGIN
		UPDATE 
			NotificationTemplates
		SET 
			TemplateHtmlBody = REPLACE(TemplateHtmlBody, 'password_recovery_url', 'azure_journey_url')
		WHERE 
			NotificationTemplateTypeId = 37 
			AND Subject = 'Benefits Marketplace Forgot Password Request'
			AND OrganizationId = 1
	END