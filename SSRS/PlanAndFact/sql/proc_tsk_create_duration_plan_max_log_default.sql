USE [WSS_Content]
GO

/****** Object:  StoredProcedure [dbo].[TSK_CreateDurationPlanMaxLogDefault]    Script Date: 06.02.2025 16:06:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[TSK_CreateDurationPlanMaxLogDefault]
@IS_NEED_ADD_FULL_TIME bit 
AS
BEGIN
	 
	 
	SET NOCOUNT ON;
	DECLARE @TASK_ID uniqueidentifier
	DECLARE @START_DATE Date
	DECLARE @END_DATE Date
	DECLARE @DURATION decimal(10,4)


	DECLARE @CALENDAR_DATE Date

	DECLARE taskCursor CURSOR local static read_only forward_only FOR SELECT TASK_ID, DURATION_PLAN_MAX, TASK_START_DATE_PLAN, TASK_END_DATE_PLAN
				FROM QRY_TSK_EXT

	OPEN taskCursor
    FETCH NEXT FROM taskCursor INTO @TASK_ID, @DURATION, @START_DATE, @END_DATE

	WHILE @@FETCH_STATUS = 0
				BEGIN
					exec [dbo].[TSK_UpdateDurationPlanMaxLog] @TASK_ID, @START_DATE, @END_DATE, @DURATION, @IS_NEED_ADD_FULL_TIME
				    FETCH NEXT FROM taskCursor INTO @TASK_ID, @DURATION, @START_DATE, @END_DATE
				END

	CLOSE taskCursor

	DEALLOCATE taskCursor
END

GO

