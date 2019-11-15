CREATE TABLE [dbo].[TodoItem]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [AddedAt] DATETIME NOT NULL, 
    [AddedBy] [nvarchar](128) NOT NULL, 
    [WasDone] INT NOT NULL, 
    [WasDoneAt] DATETIME NOT NULL, 
    [DueDate] DATETIME NULL
)
GO

ALTER TABLE [dbo].[TodoItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TodoItem_dbo.AspNetUsers_UserId] FOREIGN KEY([AddedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
