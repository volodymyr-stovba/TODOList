/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task1', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task2', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task3', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task4', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task5', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task6', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task7', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO

INSERT INTO [dbo].[TodoItem]
           ([Description]
           ,[AddedAt]
           ,[AddedBy]
           ,[WasDone]
           ,[WasDoneAt]
           ,[DueDate])
     VALUES
           ('Task8', GETDATE(), '0d1d1b9b-2b1b-464e-9b61-774c00f05955', 0, GETDATE(), NULL)
GO