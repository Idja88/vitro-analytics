USE [WSS_Content]
GO

/****** Object:  View [dbo].[QRY_VITRO_PLANNER_CALENDAR_EXCLUDE_LIST]    Script Date: 06.02.2025 16:20:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[QRY_VITRO_PLANNER_CALENDAR_EXCLUDE_LIST]
AS


select  AllUserData.bit2 as VitroBaseIsWorkingDay, 
CONVERT(date, 
               SWITCHOFFSET(CONVERT(datetimeoffset, 
                                    [AllUserData].[datetime2]), 
                            DATENAME(TzOffset, SYSDATETIMEOFFSET()))) 
       AS VitroBaseCalendarDate

FROM WSS_Content.dbo.[AllUserData]  (nolock)
WHERE [AllUserData].tp_SiteId = '796a71c1-355a-4fdd-9dd4-fd456661311d' 
AND [AllUserData].tp_ParentId = '20901C28-AF17-46DA-9857-8660AC66CCAB'
AND AllUserData.tp_DeleteTransactionId=0x  
AND AllUserData.tp_IsCurrentVersion = 1
AND AllUserData.bit2 IS NOT NULL
AND AllUserData.datetime2 IS NOT NULL


GO

