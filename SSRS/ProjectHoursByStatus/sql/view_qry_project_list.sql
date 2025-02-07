USE [WSS_Content]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
CREATE VIEW [dbo].[QRY_PROJECT_LIST] as  
SELECT p.[tp_ID] as ProjectId
      ,p.[tp_DocId] as ProjectDocId
	  ,p.int18 as ProjectStatusId 
	  , s.nvarchar1 as ProjectStatusName
	  , s.nvarchar3 as ProjectStatusBaseCode
  FROM [WSS_Content].[dbo].[AllUserData] as p
  LEFT JOIN [WSS_Content].[dbo].[AllUserData] as s ON (s.[tp_ListId] = '3DD4E3CF-38DF-4863-9324-E618D7261E4D' and s.tp_siteid = '796A71C1-355A-4FDD-9DD4-FD456661311D' and s.tp_DeleteTransactionId = 0x and s.tp_IsCurrentVersion = 1 and s.tp_id = p.int18)
  where p.[tp_ListId] = '2894DFC6-D9AE-4666-98AF-A5C45DF940C8' and p.tp_siteid = '796A71C1-355A-4FDD-9DD4-FD456661311D' and p.tp_DeleteTransactionId = 0x and p.tp_IsCurrentVersion = 1
  
GO

