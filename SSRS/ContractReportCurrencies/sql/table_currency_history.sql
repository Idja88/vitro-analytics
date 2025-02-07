USE [Vitro]
GO

/****** Object:  Table [dbo].[currency_history]    Script Date: 06.02.2025 15:48:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[currency_history](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CurrencyCode] [nvarchar](255) NOT NULL,
	[CurrencyValue] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

