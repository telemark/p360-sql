 -- Get users by role
DECLARE @Role nvarchar(30);
DECLARE @LanguageCode nvarchar(20);

Set @Role = 'Lærer'; -- This can be replaced with the teacher role
Set @LanguageCode = 'NOR';

SELECT
Role.uro_code as 'role',
Contact.ct_name2 + ' ' + Contact.ct_name3 as name,
REPLACE(Usr.us_id, 'login\', '') as 'userId',
Enterprise.ct_referencenumber as "enterpriseNumber1",
EnterpriseRef.cte_id as "enterpriseNumber2"

FROM us_user as Usr

LEFT JOIN uup_userprofile as Profile on Profile.uup_us_recno = Usr.us_recno
LEFT JOIN uro_role as Role on Role.uro_recno = Profile.uup_uro_recno
LEFT JOIN ugm_groupmember on ugm_groupmember.ugm_ct_recno = Usr.us_ct_recno
LEFT JOIN ct_contact as Contact on Contact.ct_recno = Usr.us_ct_recno
LEFT JOIN ct_contact as Enterprise on Enterprise.ct_recno = Contact.ct_company_recno
LEFT JOIN cte_external as EnterpriseRef on Enterprise.ct_recno = EnterpriseRef.cte_ct_recno

WHERE Role.uro_code = @Role
AND Role.uro_lan_code = @LanguageCode
GROUP BY Usr.us_id,Role.uro_code,Contact.ct_name2,Contact.ct_name3,Enterprise.ct_referencenumber,EnterpriseRef.cte_id
 -- Finish
