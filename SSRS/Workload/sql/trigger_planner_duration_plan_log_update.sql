USE [WSS_Content]
GO

/****** Object:  Trigger [dbo].[PlannerDurationPlanLog_Update]    Script Date: 06.02.2025 16:02:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[PlannerDurationPlanLog_Update]
ON [dbo].[TSK_EXT] AFTER UPDATE
AS 
set NOCOUNT ON

	declare @taskId uniqueidentifier

	declare @startPlanNew Date
	declare @endPlanNew Date
	declare @durationPlanNew decimal(10,4)
	declare @durationPlanMaxNew decimal(10,4)

	declare @startPlanOld Date
	declare @endPlanOld Date
	declare @durationPlanOld decimal(10,4)
	declare @durationPlanMaxOld decimal(10,4)

	select @taskId = i.TASK_ID, @startPlanNew = i.TASK_START_DATE_PLAN, @endPlanNew = i.TASK_END_DATE_PLAN, @durationPlanNew = i.DURATION_PLAN, @durationPlanMaxNew = i.DURATION_PLAN_MAX from inserted i
	select @startPlanOld = d.TASK_START_DATE_PLAN, @endPlanOld = d.TASK_END_DATE_PLAN, @durationPlanOld = d.DURATION_PLAN, @durationPlanMaxOld = d.DURATION_PLAN_MAX from deleted d

   if(@startPlanNew != @startPlanOld or @endPlanNew != @endPlanOld or @durationPlanNew != @durationPlanOld)
   begin
		exec [dbo].[TSK_UpdateDurationPlanLog] @taskId, @startPlanNew, @endPlanNew, @durationPlanNew, 0
   end

   if(@startPlanNew != @startPlanOld or @endPlanNew != @endPlanOld or @durationPlanMaxNew != @durationPlanMaxOld)
   begin
		exec [dbo].[TSK_UpdateDurationPlanMaxLog] @taskId, @startPlanNew, @endPlanNew, @durationPlanMaxNew, 0
   end


GO

