TRUNCATE TABLE DUMMY_SUPERUSER_LOG_REVIEW
INSERT INTO DUMMY_SUPERUSER_LOG_REVIEW SELECT DISTINCT TOP (100) PERCENT CASE WHEN L.LOGDATE = '00000000' THEN CONVERT(DATE, '99991230') ELSE CONVERT(DATE, L.LOGDATE) END AS LOGDATE, L.TCODE AS ACTION, T.TTEXT AS DESCRIPTION, L.USERNAME, U.NAME_TEXT AS FULLNAME, U.PLSTX AS HR_POSITION, CASE WHEN L.OPTYPE = 'I' THEN 'INSERT' WHEN L.OPTYPE = 'U' THEN 'UPDATE' WHEN L.OPTYPE = 'D' THEN 'DELETE' END AS OPERATION FROM dbo.SAP_DBTABLOG AS L INNER JOIN dbo.SAP_TSTCT AS T ON L.TCODE = T.TCODE INNER JOIN dbo.VM_INGRC_USER_MASTER AS U ON L.USERNAME = U.BNAME WHERE (L.TCODE IN (SELECT TCODE FROM  dbo.VW_SENSITIVE_ACCESS)) ORDER BY LOGDATE DESC
TRUNCATE TABLE DUMMY_SAPTU_HRPOSITION
INSERT INTO DUMMY_SAPTU_HRPOSITION SELECT TOP (40) PLSTX AS HR_POSITION, AGR_NAME AS SAP_ROLE, TEXT AS SAP_ROLE_DESCRIPTION, COUNT(TCODE) AS TOTAL FROM dbo.VW_HRPOSITION_01 AS HR GROUP BY PLSTX, AGR_NAME, TEXT ORDER BY TOTAL DESC
TRUNCATE TABLE DUMMY_SAPTU_USERFORTCODEASSIGN
INSERT INTO DUMMY_SAPTU_USERFORTCODEASSIGN SELECT TOP (40) BNAME AS USERNAME, NAME_TEXT AS FULLNAME, CASE WHEN GLTGB = '00000000' THEN CONVERT(DATE, '99991230') ELSE CONVERT(DATE, GLTGB) END AS VALID_THROUGH, USTYP AS USER_TYPE, CLASS AS USER_GROUP, UFLAG AS USER_LOCK, ANAME AS CREATOR, CASE WHEN ERDAT = '00000000' THEN CONVERT(DATE, '99991230') ELSE CONVERT(DATE, ERDAT) END AS CREATION_DATE, COUNT(TCODE) AS TOTAL FROM dbo.VW_HRPOSITION_01 AS HR GROUP BY BNAME, NAME_TEXT, GLTGB, USTYP, CLASS, UFLAG, ANAME, ERDAT ORDER BY TOTAL DESC
TRUNCATE TABLE DUMMY_SAPTU_UNUSEDROLE
INSERT INTO DUMMY_SAPTU_UNUSEDROLE SELECT AGR_NAME AS SINGLE_ROLE, PARENT_AGR AS COMPOSITE_ROLE, CREATE_USR AS CREATED_BY, CASE WHEN RO.CREATE_DAT = '00000000' THEN CONVERT(DATE, '99991230') ELSE CONVERT(DATE, RO.CREATE_DAT) END AS CREATED_DATE, CASE WHEN RO.CREATE_TIM = '000000' THEN CONVERT(TIME, '00:00:00') ELSE CONVERT(TIME, LEFT(RO.CREATE_TIM, 2) + ':' + SUBSTRING(RO.CREATE_TIM, 3, 2) + ':' + RIGHT(RO.CREATE_TIM, 2)) END AS CREATED_TIME, CHANGE_USR AS CHANGE_BY, CASE WHEN RO.CHANGE_DAT = '00000000' THEN CONVERT(DATE, '99991230') ELSE CONVERT(DATE, RO.CHANGE_DAT) END AS CHANGE_DATE, CASE WHEN RO.CHANGE_TIM = '000000' THEN CONVERT(TIME, '00:00:00') ELSE CONVERT(TIME, LEFT(RO.CHANGE_TIM, 2) + ':' + SUBSTRING(RO.CHANGE_TIM, 3, 2) + ':' + RIGHT(RO.CHANGE_TIM, 2)) END AS CHANGE_TIME FROM dbo.SAP_AGR_DEFINE AS RO WHERE (AGR_NAME NOT IN (SELECT DISTINCT AGR_NAME FROM dbo.SAP_AGR_USERS))


