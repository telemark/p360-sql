-- Get ElevMapper
DECLARE @ClassificationCode varchar(MAX);
DECLARE @CaseAccessGroupRecno int;
DECLARE @PartialCaseTitle varchar(MAX);
DECLARE @Cases TABLE (Case_recno INT);

--// Change these to tune
SET @ClassificationCode = 'B31';
SET @CaseAccessGroupRecno = 200094;
SET @PartialCaseTitle = 'Elevmappe';

INSERT INTO @Cases
SELECT ca_recno FROM ca_case
WHERE ca_recno in (SELECT ca2_key FROM ca2_singlevalues WHERE ca2_uag_recno = @CaseAccessGroupRecno)
and ca_recno in (SELECT nkl_ca_recno FROM nkl_caseclass WHERE nkl_value = @ClassificationCode)
and ca_desc like '%'+@PartialCaseTitle+'%'

SELECT ca_name as caseNumber,
  ca_desc as caseTitle,
  doc_docno as documentNumber,
  ac_desc as officialTitle,
  uag_code as accessGroup,
  nkl_caseclass.nkl_value as 'personalIdNumber'
  FROM acca_connection

LEFT JOIN ac_activity on ac_activity.ac_recno = acca_connection.acca_ac_recno
LEFT JOIN ca_case on ca_recno = acca_ca_recno
LEFT JOIN doc_document on doc_key = acca_ac_recno
LEFT JOIN do3_singlevalues on do3_singlevalues.do3_key = acca_ac_recno
LEFT JOIN uag_accessgroup on uag_accessgroup.uag_recno = do3_singlevalues.do3_uag_recno
LEFT JOIN nkl_caseclass on ca_recno = nkl_ca_recno

WHERE acca_ca_recno in (SELECT Case_recno FROM @Cases)
AND LEN(nkl_caseclass.nkl_value) = 11




