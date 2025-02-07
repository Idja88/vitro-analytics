USE [WSS_Content]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[USER_SALARY_HISTORY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERSON_ID] [int] NOT NULL,
	[LOGIN_ID] [int] NULL,
	[ORG_ID] [int] NULL,
	[PERSON_NUM] [nvarchar](255) NULL,
	[SALARY] [float] NULL,
	[DATE] [date] NOT NULL,
	[CREATE_TIME] [datetime] NOT NULL,
 CONSTRAINT [USER_SALARY_HISTORY_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

