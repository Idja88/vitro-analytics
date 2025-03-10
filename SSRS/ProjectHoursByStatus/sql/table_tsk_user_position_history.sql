USE [WSS_Content]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TSK_USER_POSITION_HISTORY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[USER_ORG_ID] [int] NOT NULL,
	[POSITION_ID] [int] NOT NULL,
	[DATE] [date] NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
	[PARENT_ORG_ID] [int] NULL,
	[DESIGN_CENTER_ID] [int] NULL,
 CONSTRAINT [TSK_USER_POSITION_HISTORY_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

