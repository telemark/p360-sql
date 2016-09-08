-- Get users by AccessGroup
DECLARE @AccessGroup nvarchar(20);
DECLARE @LanguageCode nvarchar(20);

Set @AccessGroup = 'Elev-Skien';
Set @LanguageCode = 'NOR';

SELECT AccessGroup.uag_code as 'accessGroup',
Contact.ct_name2 + ' ' + Contact.ct_name3 as name,
REPLACE(Usr.us_id, 'login\', '') as 'userId' from us_user as Usr

LEFT JOIN ugm_groupmember on ugm_groupmember.ugm_ct_recno = Usr.us_ct_recno
LEFT JOIN uag_accessgroup as AccessGroup on AccessGroup.uag_recno = ugm_groupmember.ugm_uag_recno
LEFT JOIN ct_contact as Contact on Contact.ct_recno = Usr.us_ct_recno

WHERE AccessGroup.uag_code = @AccessGroup
GROUP BY AccessGroup.uag_code,Usr.us_id,Contact.ct_name2,Contact.ct_name3
