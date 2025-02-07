USE [WSS_Content]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
CREATE VIEW [dbo].[QRY_PROJECT_FIN_STATUS_LIST] as  
SELECT s.[tp_ID] as StatusId
      ,s.[tp_DocId] as StatusDocId
	  , s.nvarchar1 as StatusName
	  , s.nvarchar3 as StatusBaseCode
  FROM [WSS_Content].[dbo].[AllUserData] as s
  where s.[tp_ListId] = '3DD4E3CF-38DF-4863-9324-E618D7261E4D' and s.tp_siteid = '796A71C1-355A-4FDD-9DD4-FD456661311D' and s.tp_DeleteTransactionId = 0x and s.tp_IsCurrentVersion = 1
  
GO

