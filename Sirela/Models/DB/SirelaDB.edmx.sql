
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/30/2017 15:20:06
-- Generated from EDMX file: C:\Projects\Sirela\Sirela\Sirela\Models\DB\SirelaDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SirelaDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__SYSUserRo__LOOKU__34C8D9D1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SYSUserRole] DROP CONSTRAINT [FK__SYSUserRo__LOOKU__34C8D9D1];
GO
IF OBJECT_ID(N'[dbo].[FK__SYSUserPr__SYSUs__2F10007B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SYSUserProfile] DROP CONSTRAINT [FK__SYSUserPr__SYSUs__2F10007B];
GO
IF OBJECT_ID(N'[dbo].[FK__SYSUserRo__SYSUs__35BCFE0A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SYSUserRole] DROP CONSTRAINT [FK__SYSUserRo__SYSUs__35BCFE0A];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[LOOKUPRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LOOKUPRole];
GO
IF OBJECT_ID(N'[dbo].[SYSUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SYSUser];
GO
IF OBJECT_ID(N'[dbo].[SYSUserProfile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SYSUserProfile];
GO
IF OBJECT_ID(N'[dbo].[SYSUserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SYSUserRole];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'LOOKUPRole'
CREATE TABLE [dbo].[LOOKUPRole] (
    [LOOKUPRoleID] int IDENTITY(1,1) NOT NULL,
    [RoleName] varchar(100)  NULL,
    [RoleDescription] varchar(500)  NULL,
    [RowCreatedSYSUserID] int  NOT NULL,
    [RowCreatedDateTime] datetime  NULL,
    [RowModifiedSYSUserID] int  NOT NULL,
    [RowModifiedDateTime] datetime  NULL
);
GO

-- Creating table 'SYSUser'
CREATE TABLE [dbo].[SYSUser] (
    [SYSUserID] int IDENTITY(1,1) NOT NULL,
    [LoginName] varchar(50)  NOT NULL,
    [PasswordEncryptedText] varchar(200)  NOT NULL,
    [RowCreatedSYSUserID] int  NOT NULL,
    [RowCreatedDateTime] datetime  NULL,
    [RowModifiedSYSUserID] int  NOT NULL,
    [RowMOdifiedDateTime] datetime  NULL
);
GO

-- Creating table 'SYSUserProfile'
CREATE TABLE [dbo].[SYSUserProfile] (
    [SYSUserProfileID] int IDENTITY(1,1) NOT NULL,
    [SYSUserID] int  NOT NULL,
    [FirstName] varchar(50)  NOT NULL,
    [LastName] varchar(50)  NOT NULL,
    [Gender] char(1)  NOT NULL,
    [RowCreatedSYSUserID] int  NOT NULL,
    [RowCreatedDateTime] datetime  NULL,
    [RowModifiedSYSUserID] int  NOT NULL,
    [RowModifiedDateTime] datetime  NULL,
    [CampanyName] nvarchar(max)  NOT NULL,
    [Cuit] nvarchar(max)  NOT NULL,
    [Rubro] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SYSUserRole'
CREATE TABLE [dbo].[SYSUserRole] (
    [SYSUserRoleID] int IDENTITY(1,1) NOT NULL,
    [SYSUserID] int  NOT NULL,
    [LOOKUPRoleID] int  NOT NULL,
    [IsActive] bit  NULL,
    [RowCreatedSYSUserID] int  NOT NULL,
    [RowCreatedDateTime] datetime  NULL,
    [RowModifiedSYSUserID] int  NOT NULL,
    [RowModifiedDateTime] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [LOOKUPRoleID] in table 'LOOKUPRole'
ALTER TABLE [dbo].[LOOKUPRole]
ADD CONSTRAINT [PK_LOOKUPRole]
    PRIMARY KEY CLUSTERED ([LOOKUPRoleID] ASC);
GO

-- Creating primary key on [SYSUserID] in table 'SYSUser'
ALTER TABLE [dbo].[SYSUser]
ADD CONSTRAINT [PK_SYSUser]
    PRIMARY KEY CLUSTERED ([SYSUserID] ASC);
GO

-- Creating primary key on [SYSUserProfileID] in table 'SYSUserProfile'
ALTER TABLE [dbo].[SYSUserProfile]
ADD CONSTRAINT [PK_SYSUserProfile]
    PRIMARY KEY CLUSTERED ([SYSUserProfileID] ASC);
GO

-- Creating primary key on [SYSUserRoleID] in table 'SYSUserRole'
ALTER TABLE [dbo].[SYSUserRole]
ADD CONSTRAINT [PK_SYSUserRole]
    PRIMARY KEY CLUSTERED ([SYSUserRoleID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LOOKUPRoleID] in table 'SYSUserRole'
ALTER TABLE [dbo].[SYSUserRole]
ADD CONSTRAINT [FK__SYSUserRo__LOOKU__34C8D9D1]
    FOREIGN KEY ([LOOKUPRoleID])
    REFERENCES [dbo].[LOOKUPRole]
        ([LOOKUPRoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SYSUserRo__LOOKU__34C8D9D1'
CREATE INDEX [IX_FK__SYSUserRo__LOOKU__34C8D9D1]
ON [dbo].[SYSUserRole]
    ([LOOKUPRoleID]);
GO

-- Creating foreign key on [SYSUserID] in table 'SYSUserProfile'
ALTER TABLE [dbo].[SYSUserProfile]
ADD CONSTRAINT [FK__SYSUserPr__SYSUs__2F10007B]
    FOREIGN KEY ([SYSUserID])
    REFERENCES [dbo].[SYSUser]
        ([SYSUserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SYSUserPr__SYSUs__2F10007B'
CREATE INDEX [IX_FK__SYSUserPr__SYSUs__2F10007B]
ON [dbo].[SYSUserProfile]
    ([SYSUserID]);
GO

-- Creating foreign key on [SYSUserID] in table 'SYSUserRole'
ALTER TABLE [dbo].[SYSUserRole]
ADD CONSTRAINT [FK__SYSUserRo__SYSUs__35BCFE0A]
    FOREIGN KEY ([SYSUserID])
    REFERENCES [dbo].[SYSUser]
        ([SYSUserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SYSUserRo__SYSUs__35BCFE0A'
CREATE INDEX [IX_FK__SYSUserRo__SYSUs__35BCFE0A]
ON [dbo].[SYSUserRole]
    ([SYSUserID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------