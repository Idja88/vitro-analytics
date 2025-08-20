USE [WSS_Content]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[QRY_USER_SALARY]
AS

select
f.tp_ID as PersonId,
f.nvarchar11 as PersonNum,
f.int1 as LoginId,
o.tp_ID as OrgId,
f.float1 as Salary
from AllUserData f with (nolock)
left join AllUserData o with (nolock) on 
o.tp_ListId = '28E41BA2-1A23-4B2D-AA05-55A203388A61' 
and o.tp_DeleteTransactionId = 0x
and o.tp_IsCurrent = 1
and o.tp_IsCurrentVersion = 1
and o.int5 = f.tp_ID
where f.tp_ListId = '97EC0799-D293-4855-A83D-B8E052AC6B09'
and f.tp_DeleteTransactionId = 0x
and f.tp_IsCurrent = 1
and f.tp_IsCurrentVersion = 1
;

GO