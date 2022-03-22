CREATE DATABASE[MXTARGET]

-- STUDENT TABLE
CREATE TABLE [Student]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  --GUID
  [Name] NVARCHAR(120) NOT NULL,
  [Email] NVARCHAR(100) NOT NULL,
  [Document] NVARCHAR(20) NOT NULL,
  [Phone] NVARCHAR(20) NOT NULL,
  [Birthdate] DATETIME NULL,
  [CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()),
  CONSTRAINT [PK_Student] PRIMARY KEY ([Id])
);
GO

-- AUTHOR TABLE
CREATE TABLE [Author]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  --GUID
  [Name] NVARCHAR(80) NOT NULL,
  [Title] NVARCHAR(80) NOT NULL,
  [Image] NVARCHAR(1024) NOT NULL,
  [Bio] NVARCHAR(2000) NOT NULL,
  [Url] NVARCHAR(450) NOT NULL,
  [Email] NVARCHAR(160) NOT NULL,
  [Type] TINYINT NOT NULL,
  CONSTRAINT [PK_Author] PRIMARY KEY ([Id])
);
GO

-- CAREER TABLE
CREATE TABLE [Career]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  --GUID
  [Title] NVARCHAR(160) NOT NULL,
  [Summary] NVARCHAR(2000) NOT NULL,
  [Url] NVARCHAR(1024) NOT NULL,
  [DurationInMinutes] INT NOT NULL,
  [Active] BIT NOT NULL,
  [Featured] BIT NOT NULL,
  [Tags] NVARCHAR(160) NOT NULL,
  CONSTRAINT [PK_Career] PRIMARY KEY ([Id])
);
GO

-- CATEGORY TABLE
CREATE TABLE [Category]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Title] NVARCHAR(160) NOT NULL,
  [Url] NVARCHAR(1024) NOT NULL,
  [Summary] NVARCHAR(2000) NOT NULL,
  [Order] INT NOT NULL,
  [Description] TEXT NOT NULL,
  [Featured] BIT NOT NULL,
  CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
);
GO

-- COURSE TABLE
CREATE TABLE [Course]
(
  [Id] UNIQUEIDENTIFIER NOT NULL,
  [Tags] NVARCHAR(20) NOT NULL,
  [Title] NVARCHAR(160) NOT NULL,
  [Summary] NVARCHAR(2000) NOT NULL,
  [Url] NVARCHAR(1024) NOT NULL,
  [Level] TINYINT NOT NULL,
  [DurationInMinutes] INT NOT NULL,
  [CreateDate] DATETIME NOT NULL,
  [LastUpdateDate] DATETIME NOT NULL,
  [Active] BIT NOT NULL,
  [Free] BIT NOT NULL,
  [Featured] BIT NOT NULL,
  [AuthorId] UNIQUEIDENTIFIER NOT NULL,
  [CategoryId] UNIQUEIDENTIFIER NOT NULL,
  [Tag] NVARCHAR(160) NOT NULL,

  CONSTRAINT [PK_Course] PRIMARY KEY ([Id]),

  CONSTRAINT [FK_Course_AuthorId] 
  FOREIGN KEY ([AuthorId])
  REFERENCES [Author] ([Id]),

  CONSTRAINT [FK_Course_Category_CategoryId] 
  FOREIGN KEY ([CategoryId])
  REFERENCES [Category] ([Id]),
);
GO

-- CAREERITEM TABLE
CREATE TABLE [CareerItem]
(
  [CareerId] UNIQUEIDENTIFIER NOT NULL,
  [CourseId] UNIQUEIDENTIFIER NOT NULL,
  [Title] NVARCHAR(160) NOT NULL,
  [Description] TEXT NOT NULL,
  [Order] TINYINT NOT NULL,

  CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId], [CareerId]),

  CONSTRAINT [FK_CareerItem_Career_CareerId] 
  FOREIGN KEY ([CareerId])
  REFERENCES [Career] ([Id]),

  CONSTRAINT [FK_CareerItem_Course_CourseId] 
  FOREIGN KEY ([CourseId])
  REFERENCES [Course] ([Id]),
);
GO