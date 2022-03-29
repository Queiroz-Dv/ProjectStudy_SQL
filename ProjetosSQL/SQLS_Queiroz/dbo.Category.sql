﻿CREATE TABLE [dbo].[Category]
(
	[Id] INT NOT NULL IDENTITY(1, 1),
	[Name] VARCHAR(80) NOT NULL,
	[Slug] VARCHAR(80) NOT NULL,

	CONSTRAINT [PK_Category] PRIMARY KEY ([Id]),
	CONSTRAINT [UQ_Category_Slug] UNIQUE ([Slug])
)
GO
CREATE NONCLUSTERED INDEX [IX_Category_Slug] ON [Category]([Slug])