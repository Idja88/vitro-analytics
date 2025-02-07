USE [WSS_Content]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[QRY_CONTRACT_REP]
AS
select 
d1.tp_ID as ContractId,
d1.nvarchar1 as ContractTitle,
d1.nvarchar3 as ContractNumber,
d1.float2 as ContractCostWithoutTax,
d1.float3 as ContractCostWithTax,
d1.datetime1 as ContractStartDate,
d1.datetime2 as ContractEndDate,
d3.tp_ID as ContractStatusId,
d3.nvarchar1 as ContractStatus,
d4.tp_ID as ContractCounterAgentId,
d4.nvarchar3 as ContractCounterAgentBusinessId,
d4.nvarchar1 as ContractCounterAgent,
d5.tp_ID as ContractCounterAgentSignId,
d5.nvarchar1 as ContractCounterAgentSign,
d6.tp_ID as ContractProjectSignId,
d6.nvarchar1 as ContractProjectSign,
d7.tp_ID as ProjectId,
d7.nvarchar1 as ProjectTitle,
d7.nvarchar3 as ProjectNumber,
d8.tp_ID as ProjectTypeId,
d8.nvarchar1 as ProjectType,
d9.tp_ID as ProjectStatusId,
d9.nvarchar1 as ProjectStatus,
d10.tp_ID as ProjectStageId,
d10.nvarchar1 as ProjectStage,
dop.ContractFullCostWithoutTax,
dop.ContractFullCostWithTax,
act.ActPaymentSum,
mon.MoneyPaymentSum
from AllUserData d1 with (nolock)
--Статусы договоров
left join AllUserData d3 with (nolock) on d3.tp_ListId = '4E90981F-CED5-4D08-AFF9-D26429F8F0BC' and d3.tp_DeleteTransactionId = 0x and d3.tp_IsCurrent = 1 and d3.tp_ID = d1.int5
--Реестр компаний
left join AllUserData d4 with (nolock) on d4.tp_ListId = '2C7AA470-1CA9-459D-969C-0ACC868E0C4C' and d4.tp_DeleteTransactionId = 0x and d4.tp_IsCurrent = 1 and d4.tp_ID = d1.int1
--Признаки контрагентов
left join AllUserData d5 with (nolock) on d5.tp_ListId = '768EBA59-440E-400E-B6E8-A62B0236E74F' and d5.tp_DeleteTransactionId = 0x and d5.tp_IsCurrent = 1 and d5.tp_ID = d1.int9
--Признаки проектов
left join AllUserData d6 with (nolock) on d6.tp_ListId = 'A166F0EF-5901-47CC-9BC2-E23AA29DBB7D' and d6.tp_DeleteTransactionId = 0x and d6.tp_IsCurrent = 1 and d6.tp_ID = d1.int11
--Реестр проектов
left join AllUserData d7 with (nolock) on d7.tp_ListId = '989EA5EF-5B67-42EE-A6AE-F8F02E1CBA24' and d7.tp_DeleteTransactionId = 0x and d7.tp_IsCurrent = 1 and d7.tp_ID = d1.int10
--Типы проектов
left join AllUserData d8 with (nolock) on d8.tp_ListId = 'E74B32B3-CCA4-4F9A-AE11-D036524BA849' and d8.tp_DeleteTransactionId = 0x and d8.tp_IsCurrent = 1 and d8.tp_ID = d7.int2
--Статусы проектов
left join AllUserData d9 with (nolock) on d9.tp_ListId = 'F10B6D77-444B-492C-8441-9409E8098A15' and d9.tp_DeleteTransactionId = 0x and d9.tp_IsCurrent = 1 and d9.tp_ID = d7.int5
--Стадии проектов
left join AllUserData d10 with (nolock) on d10.tp_ListId = 'B7EDF3F8-B8F5-4AF0-9218-981200DB8B93' and d10.tp_DeleteTransactionId = 0x and d10.tp_IsCurrent = 1 and d10.tp_ID = d7.int6
--ДопСоглашения
left join 
(
select 
d1.tp_ID as ContractId,
(case when max(d2.tp_ID) is not null then (sum(d2.float2) + max(d1.float2)) else max(d1.float2) end) as ContractFullCostWithoutTax,
(case when max(d2.tp_ID) is not null then (sum(d2.float3) + max(d1.float3)) else max(d1.float3) end) as ContractFullCostWithTax
from AllUserData d1 with (nolock)
left join AllUserData d2 with (nolock) on d2.tp_ListId = 'D2211E3B-38E8-49D4-B08C-81F830B00C0F' 
and d2.tp_DeleteTransactionId = 0x
and d2.tp_IsCurrent = 1
and d2.tp_ContentTypeId = 0x0100AB8C20714DEEE54CAEA9034B73B6A5150065FE928D63F0F94CB848E161F884C6C8
--условие на наличие стоимости
and d2.float2 is not null
and d2.float3 is not null
--По лукапу верхнего договора
and d1.tp_ID = d2.int7
--Изменение стоимости
--and d2.int8 = 2
--Договора одной валюты
and d1.int4 = d2.int4
where d1.tp_ListId = 'D2211E3B-38E8-49D4-B08C-81F830B00C0F'
and d1.tp_DeleteTransactionId = 0x
and d1.tp_IsCurrent = 1
and (d1.tp_ContentTypeId = 0x012000F457BD828A2BAB4AA159E63DF041190A00F691A30BC51DE2499F296958C325837F or d1.tp_ContentTypeId = 0x0120000800E3AA2CCD84479887C87BEE1FDDAA00BDB86F9F57FE3645BF843A8DD71BED0D)
group by d1.tp_ID, d1.nvarchar3
) dop on dop.ContractId = d1.tp_ID

left join
(
select
BusinessId,
ContractNum,
SUM(case when PaymentType = N'Поступление' then (PaymentSum * -1) else PaymentSum end) as ActPaymentSum
from Vitro.dbo.acttable
where ContractNum is not null
group by 
ContractNum, BusinessId
) act on act.ContractNum = d1.nvarchar3 COLLATE Latin1_General_CI_AS_KS_WS and act.BusinessId = d4.nvarchar3 COLLATE Latin1_General_CI_AS_KS_WS

left join
(
select
BusinessId,
ContractNum,
SUM(case when PaymentType = N'Отправка' then (PaymentSum * -1) else PaymentSum end) as MoneyPaymentSum
from Vitro.dbo.moneytable
where ContractNum is not null
group by
ContractNum, BusinessId
) mon on mon.ContractNum = d1.nvarchar3 COLLATE Latin1_General_CI_AS_KS_WS and mon.BusinessId = d4.nvarchar3 COLLATE Latin1_General_CI_AS_KS_WS

where d1.tp_ListId = 'D2211E3B-38E8-49D4-B08C-81F830B00C0F'
and d1.tp_DeleteTransactionId = 0x
and d1.tp_IsCurrent = 1
and (d1.tp_ContentTypeId = 0x012000F457BD828A2BAB4AA159E63DF041190A00F691A30BC51DE2499F296958C325837F or d1.tp_ContentTypeId = 0x0120000800E3AA2CCD84479887C87BEE1FDDAA00BDB86F9F57FE3645BF843A8DD71BED0D)

GO