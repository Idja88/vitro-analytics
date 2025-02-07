USE [WSS_Content]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[QRY_USER_ID_POSITION_ID]
AS
	SELECT DISTINCT f.int1 as UserId, u.tp_ID as OrgId,u.tp_DocId as OrgDocId, u.nvarchar1 as Title, pos.tp_id as PositionId , pos.nvarchar1 as PositionTitle, parent.tp_ID as ParentOrgId, parent.nvarchar1 as ParentTitle, u.int8 as DesignCenterId, dc.nvarchar3 DesignCenterCode FROM AllUserData as u with(NOLOCK)
			INNER JOIN AllUserData  as f with(NOLOCK) ON 
			(
				f.tp_ID = u.int1
				AND f.tp_SiteId = u.tp_SiteId
				AND f.tp_IsCurrentVersion = 1
				AND f.tp_DeleteTransactionId = 0x
				AND f.tp_ListId = 'b4c516db-a26d-48fa-a322-4780a5d4be91'
				AND f.tp_ParentId='9842d9d3-132b-4269-bec8-0bb618cbaa27'
			)
			LEFT JOIN AllUserData  as parent with(NOLOCK) ON 
			(
				parent.tp_ID = u.int3
			AND	parent.tp_SiteId = '796a71c1-355a-4fdd-9dd4-fd456661311d'
			AND parent.tp_IsCurrentVersion = 1
			AND parent.tp_DeleteTransactionId = 0x
			AND parent.tp_ListId = 'd944262c-298c-493e-85ed-d7664ef7deae'
			AND parent.tp_ParentId = 'c3df00bc-8562-42cc-a4f0-598fe7f849f4'
			)
			LEFT JOIN AllUserData  as pos with(NOLOCK) ON 
			(
				pos.tp_ID = u.int2
				AND pos.tp_SiteId = u.tp_SiteId
				AND pos.tp_IsCurrentVersion = 1
				AND pos.tp_DeleteTransactionId = 0x
				AND pos.tp_ListId = 'CEFF7864-BF8B-4EFD-AD76-9351A229DF5B'
				AND pos.tp_ParentId='BDDD510B-07CB-4C93-AA0A-BC7136964B5F'
			)
			LEFT JOIN AllUserData  as dc with(NOLOCK) ON 
			(
				dc.tp_ID = u.int8
				AND dc.tp_SiteId = u.tp_SiteId
				AND dc.tp_IsCurrentVersion = 1
				AND dc.tp_DeleteTransactionId = 0x
				AND dc.tp_ListId = '6ACD7F25-92F9-4D68-B013-FA81930C852A'
				AND dc.tp_ParentId='E3D978D1-607A-4CBF-A53A-C4B493B5F42C'
			)
			WHERE
			u.tp_SiteId = '796a71c1-355a-4fdd-9dd4-fd456661311d'
			AND u.tp_IsCurrentVersion = 1
			AND u.tp_DeleteTransactionId = 0x
			AND u.tp_ListId = 'd944262c-298c-493e-85ed-d7664ef7deae'
			AND u.tp_ParentId = 'c3df00bc-8562-42cc-a4f0-598fe7f849f4'





;








GO

