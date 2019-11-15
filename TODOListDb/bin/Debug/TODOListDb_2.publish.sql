﻿/*
Deployment script for aspnet-TODO List-20191113043314

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "aspnet-TODO List-20191113043314"
:setvar DefaultFilePrefix "aspnet-TODO List-20191113043314"
:setvar DefaultDataPath "C:\Users\netpanik\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\netpanik\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping [dbo].[FK_dbo.TodoItem_dbo.AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[TodoItem] DROP CONSTRAINT [FK_dbo.TodoItem_dbo.AspNetUsers_UserId];


GO
PRINT N'Starting rebuilding table [dbo].[TodoItem]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_TodoItem] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (MAX) NOT NULL,
    [AddedAt]     DATETIME       NOT NULL,
    [AddedBy]     NVARCHAR (128) NOT NULL,
    [WasDone]     INT            NOT NULL,
    [WasDoneAt]   DATETIME       NOT NULL,
    [DueDate]     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[TodoItem])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TodoItem] ON;
        INSERT INTO [dbo].[tmp_ms_xx_TodoItem] ([Id], [Description], [AddedAt], [AddedBy], [WasDone], [WasDoneAt], [DueDate])
        SELECT   [Id],
                 [Description],
                 [AddedAt],
                 [AddedBy],
                 [WasDone],
                 [WasDoneAt],
                 [DueDate]
        FROM     [dbo].[TodoItem]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TodoItem] OFF;
    END

DROP TABLE [dbo].[TodoItem];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_TodoItem]', N'TodoItem';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[FK_dbo.TodoItem_dbo.AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[TodoItem] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TodoItem_dbo.AspNetUsers_UserId] FOREIGN KEY ([AddedBy]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
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
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[TodoItem] WITH CHECK CHECK CONSTRAINT [FK_dbo.TodoItem_dbo.AspNetUsers_UserId];


GO
PRINT N'Update complete.';


GO
