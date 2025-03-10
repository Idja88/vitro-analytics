USE [Vitro]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[acttable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessId] [nvarchar](255) NOT NULL,
	[ContractNum] [nvarchar](255) NULL,
	[ProjectNum] [nvarchar](255) NULL,
	[ActNum] [nvarchar](255) NULL,
	[ActDate] [date] NULL,
	[PaymentType] [nvarchar](255) NULL,
	[PaymentSum] [decimal](18, 2) NULL,
	[DocumentId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO

