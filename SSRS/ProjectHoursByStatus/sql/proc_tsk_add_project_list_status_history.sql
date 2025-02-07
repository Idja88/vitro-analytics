USE [WSS_Content]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[TSK_AddProjectListStatusHistory]
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @CURRENT_DATE AS DATE
	SET @CURRENT_DATE = CURRENT_TIMESTAMP

	DELETE FROM TSK_PROJECT_LIST_STATUS_HISTORY WHERE [DATE] = @CURRENT_DATE

	INSERT INTO TSK_PROJECT_LIST_STATUS_HISTORY (PROJECT_ID, PROJECT_UNIQUE_ID, STATUS_ID, DATE, CREATE_TIME)
	SELECT  QRY_PROJECT_LIST.[ProjectId], QRY_PROJECT_LIST.[ProjectDocId], QRY_PROJECT_LIST.[ProjectStatusId], @CURRENT_DATE, CURRENT_TIMESTAMP  FROM 
	QRY_PROJECT_LIST where QRY_PROJECT_LIST.[ProjectStatusId] is not null


END




GO

