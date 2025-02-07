USE [WSS_Content]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[QRY_PROJECT_FIN_STATUS_DATES]
AS
select 
PROJECT_ID, 
STATUS_ID, 
min(DATE) as FinStatusDate
from TSK_PROJECT_LIST_STATUS_HISTORY with (nolock) 
group by
PROJECT_ID, 
STATUS_ID                         
;



GO

