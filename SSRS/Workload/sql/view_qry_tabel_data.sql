USE [Vitro]
GO

/****** Object:  View [dbo].[QRY_TABEL_DATA]    Script Date: 06.02.2025 15:52:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[QRY_TABEL_DATA]
AS

select 
t.Num,
t.Date,
t.Value,
f.tp_ID as FizListID,
f.int1 as LoginID,
o.tp_ID as OrgID,
o.nvarchar1 as FullName,
o2.tp_ID as DepartmentID,
o2.nvarchar1 as DepartmentName,
p.tp_ID as PositionID,
p.nvarchar1 as PositionName,
c.tp_ID as CenterID,
c.nvarchar3 as CenterCode
from Vitro.dbo.tabel t
left join WSS_Content.dbo.AllUserData f with (nolock) on CAST(f.float1 as int) = t.Num and f.tp_ListId = 'B4C516DB-A26D-48FA-A322-4780A5D4BE91' and f.tp_DeleteTransactionId = 0x and f.tp_IsCurrent = 1
left join WSS_Content.dbo.AllUserData o with (nolock) on o.int1 = f.tp_ID and o.tp_ListId = 'D944262C-298C-493E-85ED-D7664EF7DEAE' and o.tp_DeleteTransactionId = 0x and o.tp_IsCurrent = 1
left join WSS_Content.dbo.AllUserData o2 with (nolock) on o.int3 = o2.tp_ID and o2.tp_ListId = 'D944262C-298C-493E-85ED-D7664EF7DEAE' and o2.tp_DeleteTransactionId = 0x and o2.tp_IsCurrent = 1
left join WSS_Content.dbo.AllUserData p with (nolock) on o.int2 = p.tp_ID and p.tp_ListId = 'CEFF7864-BF8B-4EFD-AD76-9351A229DF5B' and p.tp_DeleteTransactionId = 0x and p.tp_IsCurrent = 1
left join WSS_Content.dbo.AllUserData c with (nolock) on o.int8 = c.tp_ID and c.tp_ListId = '6ACD7F25-92F9-4D68-B013-FA81930C852A' and c.tp_DeleteTransactionId = 0x and c.tp_IsCurrent = 1
 

;






GO

