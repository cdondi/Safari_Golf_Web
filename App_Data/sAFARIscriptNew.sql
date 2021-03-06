USE [master]
GO
/****** Object:  Database [SafariGolf]    Script Date: 03/02/2014 00:15:29 ******/
CREATE DATABASE [SafariGolf] ON  PRIMARY 
( NAME = N'tempname', FILENAME = N'C:\SafariGolfOfTexas\App_Data\SafariGolfClubTx1.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'clubsite_log', FILENAME = N'C:\SafariGolfOfTexas\App_Data\SafariGolfClubTx1_log.LDF' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SafariGolf] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SafariGolf] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SafariGolf] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SafariGolf] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SafariGolf] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SafariGolf] SET ARITHABORT OFF
GO
ALTER DATABASE [SafariGolf] SET AUTO_CLOSE ON
GO
ALTER DATABASE [SafariGolf] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SafariGolf] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SafariGolf] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SafariGolf] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SafariGolf] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SafariGolf] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SafariGolf] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SafariGolf] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SafariGolf] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SafariGolf] SET  DISABLE_BROKER
GO
ALTER DATABASE [SafariGolf] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SafariGolf] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SafariGolf] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SafariGolf] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SafariGolf] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SafariGolf] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SafariGolf] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SafariGolf] SET  READ_WRITE
GO
ALTER DATABASE [SafariGolf] SET RECOVERY SIMPLE
GO
ALTER DATABASE [SafariGolf] SET  MULTI_USER
GO
ALTER DATABASE [SafariGolf] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SafariGolf] SET DB_CHAINING OFF
GO
USE [SafariGolf]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__18EBB532]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__18EBB532]
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__19DFD96B]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__19DFD96B]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__1AD3FDA4]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__1AD3FDA4]
GO
/****** Object:  ForeignKey [FK_SiteSettings_SiteThemes]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[SiteSettings] DROP CONSTRAINT [FK_SiteSettings_SiteThemes]
GO
/****** Object:  ForeignKey [FK_Score_Hole]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[tb_Score] DROP CONSTRAINT [FK_Score_Hole]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__1DB06A4F]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__1DB06A4F]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__1EA48E88]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__1EA48E88]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__1F98B2C1]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__1F98B2C1]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__208CD6FA]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__208CD6FA]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__2180FB33]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__2180FB33]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__22751F6C]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__22751F6C]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__236943A5]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__236943A5]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__245D67DE]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__245D67DE]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 03/02/2014 00:15:37 ******/
DROP VIEW [dbo].[vw_aspnet_MembershipUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 03/02/2014 00:15:37 ******/
DROP VIEW [dbo].[vw_aspnet_Profiles]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 03/02/2014 00:15:37 ******/
DROP VIEW [dbo].[vw_aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 03/02/2014 00:15:37 ******/
DROP VIEW [dbo].[vw_aspnet_WebPartState_Shared]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 03/02/2014 00:15:37 ******/
DROP VIEW [dbo].[vw_aspnet_WebPartState_User]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Users_DeleteUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_GetProperties]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Profile_SetProperties]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_AnyDataInTables]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_SetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 03/02/2014 00:15:37 ******/
DROP PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__236943A5]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__245D67DE]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [DF__aspnet_Perso__Id__17F790F9]
GO
DROP TABLE [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__22751F6C]
GO
DROP TABLE [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__208CD6FA]
GO
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__2180FB33]
GO
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [DF__aspnet_Me__Passw__17036CC0]
GO
DROP TABLE [dbo].[aspnet_Membership]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_Paths_CreatePath]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__1EA48E88]
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__1F98B2C1]
GO
DROP TABLE [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_Users_CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_Roles_GetAllRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_Roles_RoleExists]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__1DB06A4F]
GO
DROP TABLE [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 03/02/2014 00:15:36 ******/
DROP VIEW [dbo].[vw_aspnet_WebPartState_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 03/02/2014 00:15:36 ******/
DROP VIEW [dbo].[vw_aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 03/02/2014 00:15:36 ******/
DROP VIEW [dbo].[vw_aspnet_Users]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_Roles_CreateRole]
GO
/****** Object:  Table [dbo].[tb_Score]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[tb_Score] DROP CONSTRAINT [FK_Score_Hole]
GO
DROP TABLE [dbo].[tb_Score]
GO
/****** Object:  StoredProcedure [dbo].[MemberCountByLetter]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[MemberCountByLetter]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 03/02/2014 00:15:36 ******/
DROP VIEW [dbo].[vw_aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[GameList]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[GameList]
GO
/****** Object:  StoredProcedure [dbo].[NextAnnouncement]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[NextAnnouncement]
GO
/****** Object:  StoredProcedure [dbo].[NextPrevAnnouncement]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[NextPrevAnnouncement]
GO
/****** Object:  StoredProcedure [dbo].[NextPrevEvent]    Script Date: 03/02/2014 00:15:36 ******/
DROP PROCEDURE [dbo].[NextPrevEvent]
GO
/****** Object:  StoredProcedure [dbo].[NextPrevLocation]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[NextPrevLocation]
GO
/****** Object:  StoredProcedure [dbo].[PagedAlbumList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PagedAlbumList]
GO
/****** Object:  StoredProcedure [dbo].[PagedAnnouncementList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PagedAnnouncementList]
GO
/****** Object:  StoredProcedure [dbo].[PagedLocationsList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PagedLocationsList]
GO
/****** Object:  StoredProcedure [dbo].[PagedRecentEventList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PagedRecentEventList]
GO
/****** Object:  StoredProcedure [dbo].[PagedUpcommingEventList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PagedUpcommingEventList]
GO
/****** Object:  StoredProcedure [dbo].[PlayerList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PlayerList]
GO
/****** Object:  StoredProcedure [dbo].[PrevAnnouncement]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[PrevAnnouncement]
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[SiteSettings] DROP CONSTRAINT [FK_SiteSettings_SiteThemes]
GO
DROP TABLE [dbo].[SiteSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__1AD3FDA4]
GO
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__UserI__14270015]
GO
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__Mobil__151B244E]
GO
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__IsAno__160F4887]
GO
DROP TABLE [dbo].[aspnet_Users]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId]
GO
/****** Object:  StoredProcedure [dbo].[AlbumList]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[AlbumList]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
DROP PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__19DFD96B]
GO
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [DF__aspnet_Ro__RoleI__1332DBDC]
GO
DROP TABLE [dbo].[aspnet_Roles]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__18EBB532]
GO
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [DF__aspnet_Pa__PathI__123EB7A3]
GO
DROP TABLE [dbo].[aspnet_Paths]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Applications] DROP CONSTRAINT [DF__aspnet_Ap__Appli__114A936A]
GO
DROP TABLE [dbo].[aspnet_Applications]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 03/02/2014 00:15:35 ******/
DROP TABLE [dbo].[Albums]
GO
/****** Object:  Table [dbo].[Announcements]    Script Date: 03/02/2014 00:15:34 ******/
DROP TABLE [dbo].[Announcements]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 03/02/2014 00:15:34 ******/
DROP TABLE [dbo].[aspnet_SchemaVersions]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 03/02/2014 00:15:34 ******/
DROP PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 03/02/2014 00:15:34 ******/
DROP PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
GO
/****** Object:  Table [dbo].[SiteThemes]    Script Date: 03/02/2014 00:15:33 ******/
DROP TABLE [dbo].[SiteThemes]
GO
/****** Object:  Table [dbo].[tb_County]    Script Date: 03/02/2014 00:15:33 ******/
DROP TABLE [dbo].[tb_County]
GO
/****** Object:  Table [dbo].[tb_CourseRating]    Script Date: 03/02/2014 00:15:33 ******/
DROP TABLE [dbo].[tb_CourseRating]
GO
/****** Object:  Table [dbo].[tb_Hole]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[tb_Hole]
GO
/****** Object:  Table [dbo].[tb_Pairing]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[tb_Pairing]
GO
/****** Object:  Table [dbo].[images]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[images]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[aspnet_WebEvent_Events]
GO
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[MemberInfo]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[Events]
GO
/****** Object:  Table [dbo].[tb_Scorecard]    Script Date: 03/02/2014 00:15:32 ******/
DROP TABLE [dbo].[tb_Scorecard]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DROP SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_WebEvent_FullAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_ReportingAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_FullAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_BasicAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_ReportingAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_FullAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_BasicAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_ReportingAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_FullAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_BasicAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_ReportingAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_FullAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_BasicAccess'

Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
DROP ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 03/02/2014 00:15:29 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Table [dbo].[tb_Scorecard]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tb_Scorecard](
	[ScorecardId] [int] IDENTITY(1,1) NOT NULL,
	[GhinID] [varchar](10) NULL,
	[LocationID] [int] NULL,
	[PairingID] [int] NULL,
	[Date] [smalldatetime] NULL,
	[memberid] [uniqueidentifier] NULL,
	[Score1] [int] NULL,
	[Score2] [int] NULL,
	[Score3] [int] NULL,
	[Score4] [int] NULL,
	[Score5] [int] NULL,
	[Score6] [int] NULL,
	[Score7] [int] NULL,
	[Score8] [int] NULL,
	[Score9] [int] NULL,
	[ScoreTotalout] [int] NULL,
	[Score10] [int] NULL,
	[Score11] [int] NULL,
	[Score12] [int] NULL,
	[Score13] [int] NULL,
	[Score14] [int] NULL,
	[Score15] [int] NULL,
	[Score16] [int] NULL,
	[Score17] [int] NULL,
	[Score18] [int] NULL,
	[ScoreTotalin] [int] NULL,
	[GrandTotal] [int] NULL,
	[TournamentHandicap] [int] NULL,
	[GhinHandicap] [int] NULL,
	[NetScore] [int] NULL,
	[Rating] [decimal](18, 1) NULL,
	[Slope] [int] NULL,
	[Differential] [decimal](18, 1) NULL,
	[ScorecardClosed] [bit] NULL,
 CONSTRAINT [PK_MemberInfo_Scorecard] PRIMARY KEY CLUSTERED 
(
	[ScorecardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Scorecard] ON
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (274, N'0217923', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(21.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (275, N'0217923', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(28.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (276, N'0217923', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(16.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (278, N'0217923', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(23.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (279, N'0217923', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(23.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (280, N'0217923', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(17.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (281, N'0217923', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(14.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (282, N'0298902', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'2811cdd3-0330-4df6-9e51-c8573c2d101f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 134, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(57.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (283, N'0388608', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(23.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (284, N'0388608', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(30.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (285, N'0388608', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(25.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (286, N'0388608', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(45.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (287, N'0388608', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(41.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (288, N'0388608', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(38.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (289, N'0388608', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(49.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (291, N'0388608', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(39.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (292, N'0388608', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(36.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (293, N'0388608', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(37.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (294, N'0394355', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(23.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (295, N'0394355', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(21.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (296, N'0394355', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(23.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (297, N'0394355', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(23.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (298, N'0394355', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(32.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (299, N'0394355', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(25.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (300, N'0394355', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(21.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (301, N'0394355', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(26.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (302, N'0394355', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(20.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (303, N'0394355', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(24.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (304, N'0394355', 16, NULL, CAST(0xA0E90000 AS SmallDateTime), N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(71.0 AS Decimal(18, 1)), 122, CAST(23.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (305, N'0489217', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(22.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (306, N'0489217', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(27.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (307, N'0507423', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(23.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (308, N'0507423', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(30.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (309, N'0507423', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(32.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (310, N'0507423', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(28.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (311, N'0507423', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(48.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (312, N'0507423', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(18.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (313, N'0507423', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(29.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (315, N'0507423', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(34.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (316, N'0507423', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(36.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (317, N'0507423', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(37.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (318, N'0507423', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(38.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (319, N'0507423', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(47.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (320, N'1124710', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(28.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (321, N'1124710', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(44.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (322, N'1124710', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(42.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (323, N'1124710', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(31.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (324, N'1124710', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(30.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (325, N'1124710', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(32.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (326, N'1124710', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(40.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (328, N'1124710', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(49.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (329, N'1124710', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(40.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (330, N'1177449', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(28.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (331, N'1177449', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(29.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (332, N'1177449', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(27.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (333, N'1177449', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(26.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (334, N'1177449', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(53.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (335, N'1177449', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(33.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (336, N'1177449', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(51.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (338, N'1177449', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 128, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(57.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (339, N'1177454', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'63519db3-06a9-4237-9a14-facc9f72748b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 130, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(59.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (340, N'1227341', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(14.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (341, N'1227341', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(14.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (342, N'1227341', 4, NULL, CAST(0xA2230000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(18.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (343, N'1227341', 4, NULL, CAST(0xA2210000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(11.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (344, N'1227341', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(18.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (345, N'1227341', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(32.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (346, N'1227341', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(14.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (348, N'1227341', 10, NULL, CAST(0xA16E0000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(74.3 AS Decimal(18, 1)), 140, CAST(16.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (349, N'1227355', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(32.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (350, N'1227355', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(30.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (352, N'1313404', 2, NULL, CAST(0xA2010000 AS SmallDateTime), N'ae64e0a4-8852-46ce-8ae3-4b74daef7659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL, NULL, CAST(69.4 AS Decimal(18, 1)), 115, CAST(39.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (353, N'1414647', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(31.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (354, N'1414647', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(32.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (355, N'1414647', 8, NULL, CAST(0xA2470000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(41.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (356, N'1414647', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(41.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (357, N'1414647', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(43.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (358, N'1414647', 2, NULL, CAST(0xA2010000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(40.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (359, N'1414647', 5, NULL, CAST(0xA1E50000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 124, CAST(39.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (360, N'1414647', 11, NULL, CAST(0xA1D70000 AS SmallDateTime), N'bd162676-7d3c-400e-9cdc-c35507426414', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL, NULL, CAST(73.1 AS Decimal(18, 1)), 136, CAST(39.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (361, N'7958190', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(8.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (362, N'7958190', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(8.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (363, N'7958190', 9, NULL, CAST(0xA25C0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 129, CAST(16.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (364, N'7958190', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(12.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (365, N'7958190', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(12.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (366, N'7958190', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(15.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (367, N'7958190', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(8.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (368, N'7958190', 11, NULL, CAST(0xA1D70000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 131, CAST(12.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (369, N'7958190', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(16.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (371, N'7958190', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(13.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (372, N'7958190', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(13.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (373, N'7958190', 13, NULL, CAST(0xA15F0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 115, CAST(19.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (374, N'7958190', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(15.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (375, N'7958190', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(19.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (376, N'7958190', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(18.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (377, N'7958191', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(18.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (378, N'7958191', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(26.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (379, N'7958191', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(27.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (380, N'7958191', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(31.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (381, N'7958191', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(24.9 AS Decimal(18, 1)), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (382, N'7958192', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(12.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (383, N'7958192', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(13.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (384, N'7958192', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(14.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (385, N'7958192', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(8.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (386, N'7958192', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(22.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (387, N'7958192', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(13.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (388, N'7958192', 3, NULL, CAST(0xA1C90000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 134, CAST(9.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (389, N'7958192', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(18.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (391, N'7958192', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(24.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (392, N'7958192', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(11.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (393, N'7958192', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(22.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (394, N'7958192', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(10.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (395, N'7958192', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(6.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (396, N'7958193', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(30.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (397, N'7958193', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(28.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (398, N'7958193', 9, NULL, CAST(0xA25C0000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 129, CAST(32.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (399, N'7958193', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(22.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (400, N'7958193', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(22.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (401, N'7958193', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(32.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (402, N'7958193', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(25.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (403, N'7958193', 3, NULL, CAST(0xA1C90000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 134, CAST(37.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (404, N'7958193', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(29.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (406, N'7958193', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(31.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (407, N'7958193', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(26.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (408, N'7958193', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(31.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (409, N'7958193', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(24.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (410, N'7958193', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(23.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (411, N'8722404', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(22.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (412, N'8722404', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(30.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (413, N'8722404', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(25.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (414, N'8722404', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(24.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (415, N'8722404', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(25.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (416, N'8722408', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(33.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (417, N'8722408', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(31.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (418, N'8722408', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(34.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (419, N'8722408', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(19.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (420, N'8722408', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(29.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (422, N'8722408', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(33.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (423, N'8722408', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(24.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (424, N'8722408', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(31.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (425, N'8722408', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(30.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (426, N'8722409', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(20.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (427, N'8722409', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(18.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (428, N'8722409', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(27.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (429, N'8722409', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(31.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (430, N'8722409', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(34.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (431, N'8722409', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(23.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (432, N'8722409', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(23.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (433, N'8722409', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(28.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (434, N'8722409', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'f36b7d97-fd40-46af-aa58-16f97a64d022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(17.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (435, N'8722410', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(35.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (436, N'8722410', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(32.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (437, N'8722410', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(40.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (438, N'8722410', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(29.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (439, N'8722410', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(26.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (440, N'8722410', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(40.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (442, N'8722410', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(44.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (443, N'8722410', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(28.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (444, N'8722410', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(25.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (445, N'8722410', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(33.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (446, N'8722411', 10, NULL, CAST(0xA2C50000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(15.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (447, N'8722411', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(11.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (448, N'8722411', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(12.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (449, N'8722411', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(14.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (450, N'8722411', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(12.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (451, N'8722411', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(21.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (452, N'8722411', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(19.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (454, N'8722411', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(18.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (455, N'8722411', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(14.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (456, N'8722411', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(27.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (457, N'8722411', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(26.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (458, N'8722411', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(9.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (459, N'8722412', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(19.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (460, N'8722412', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(17.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (461, N'8722412', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(14.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (462, N'8722412', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(12.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (463, N'8722412', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(27.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (464, N'8722412', 5, NULL, CAST(0xA1E40000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(71.3 AS Decimal(18, 1)), 129, CAST(19.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (465, N'8722412', 11, NULL, CAST(0xA1D70000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 131, CAST(20.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (466, N'8722412', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(20.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (468, N'8722412', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(25.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (469, N'8722412', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(19.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (470, N'8722412', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(22.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (471, N'8722412', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(21.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (472, N'8722413', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(9.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (473, N'8722413', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(9.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (474, N'8722413', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(6.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (475, N'8722413', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(9.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (476, N'8722413', 11, NULL, CAST(0xA1D80000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 131, CAST(8.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (477, N'8722413', 7, NULL, CAST(0xA1B80000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 135, CAST(10.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (479, N'8722413', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(10.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (480, N'8722413', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(13.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (481, N'8722414', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(13.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (482, N'8722414', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(22.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (483, N'8722414', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(12.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (484, N'8722414', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(17.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (486, N'8722414', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(22.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (487, N'8722414', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(20.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (488, N'8722414', 15, NULL, CAST(0xA11A0000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(72.0 AS Decimal(18, 1)), 138, CAST(16.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (489, N'8722414', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(20.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (490, N'8722414', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(14.4 AS Decimal(18, 1)), 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (491, N'8722415', 11, NULL, CAST(0xA2770000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 135, CAST(16.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (492, N'8722415', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(12.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (493, N'8722415', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(23.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (494, N'8722415', 4, NULL, CAST(0xA21F0000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(15.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (495, N'8722415', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(26.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (496, N'8722415', 14, NULL, CAST(0xA1C20000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.6 AS Decimal(18, 1)), 118, CAST(24.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (498, N'8722415', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(23.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (499, N'8722415', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(17.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (500, N'8722416', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'e708a783-754d-4594-8060-e1ca678df9f7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(30.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (501, N'8722424', 6, NULL, CAST(0xA2630000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, CAST(70.3 AS Decimal(18, 1)), 120, CAST(17.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (502, N'8722424', 8, NULL, CAST(0xA2460000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL, NULL, CAST(70.9 AS Decimal(18, 1)), 121, CAST(33.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (503, N'8722424', 2, NULL, CAST(0xA2000000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(67.1 AS Decimal(18, 1)), 119, CAST(34.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (505, N'8722424', 12, NULL, CAST(0xA1890000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(68.2 AS Decimal(18, 1)), 117, CAST(31.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (506, N'8722424', 10, NULL, CAST(0xA16D0000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL, NULL, CAST(72.5 AS Decimal(18, 1)), 136, CAST(27.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (507, N'8722424', 2, NULL, CAST(0xA10C0000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.5 AS Decimal(18, 1)), 125, CAST(29.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (508, N'8722424', 4, NULL, CAST(0xA0F00000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL, NULL, CAST(70.0 AS Decimal(18, 1)), 118, CAST(23.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (543, N'8722410', 1, 2, CAST(0xA2E10000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (544, N'8722414', 1, 2, CAST(0xA2E10000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 14, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (545, N'8722416', 1, 2, CAST(0xA2E10000 AS SmallDateTime), N'e708a783-754d-4594-8060-e1ca678df9f7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (546, N'8722404', 1, 3, CAST(0xA2E10000 AS SmallDateTime), N'66be8dc2-3383-4c69-8182-dd18d95347b9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 20, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (547, N'7958190', 1, 3, CAST(0xA2E10000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 9, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (548, N'0489217', 1, 3, CAST(0xA2E10000 AS SmallDateTime), N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 21, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (549, N'9999993', 1, 4, CAST(0xA2E10000 AS SmallDateTime), N'fec35412-6662-4293-9d65-e37831a7c36e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (550, N'8722411', 1, 4, CAST(0xA2E10000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 11, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (552, N'7958193', 1, 4, CAST(0xA2E10000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 22, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (553, N'7958192', 1, 5, CAST(0xA2E10000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 9, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (554, N'7958191', 1, 5, CAST(0xA2E10000 AS SmallDateTime), N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 20, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (555, N'1234567', 1, 5, CAST(0xA2E10000 AS SmallDateTime), N'da199de7-2742-46c1-bf0b-1390e620a075', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (556, N'0507423', 1, 5, CAST(0xA2E10000 AS SmallDateTime), N'a4cb03f8-83da-480c-b6b4-96be23d232f4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 23, 0, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (593, N'0217923', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(20.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (594, N'0388608', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'fb976048-5f42-4171-a782-4a2f967cd869', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(41.0 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (595, N'0507423', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'dabcd833-1693-409d-8866-76058b7c3a86', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(39.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (596, N'1124710', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'249e142c-924e-4d21-8df1-8ddde418c485', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(38.1 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (597, N'1177449', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'2f114887-13ad-4292-b300-2974ae7a295a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(48.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (598, N'1227341', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'514c791f-b804-42da-8209-3bfccf6e75cb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(29.5 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (599, N'1227355', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(47.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (600, N'7958190', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'69e649ae-62ac-4886-a29f-cbf2c82192c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(13.2 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (601, N'7958192', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(21.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (602, N'7958193', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(31.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (603, N'8722408', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(26.6 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (604, N'8722410', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'93355450-c6ed-48c5-b46e-d036070ed9d9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(45.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (605, N'8722411', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'45196d8b-39d8-4ac6-9c44-3212da21f665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(20.9 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (606, N'8722412', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(24.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (607, N'8722413', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(11.3 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (608, N'8722414', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'fea60381-052f-4f68-809c-ab550830a60a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(21.8 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (609, N'8722415', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'ed97104a-5c1a-4ea7-886c-244e5031fec8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(24.7 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (610, N'8722424', 1, NULL, CAST(0xA1A50000 AS SmallDateTime), N'6495b881-fd0d-4080-9a4c-910a05e27994', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL, NULL, CAST(70.2 AS Decimal(18, 1)), 118, CAST(32.4 AS Decimal(18, 1)), 1)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (679, N'8722408', 1, 1, CAST(0xA2E10000 AS SmallDateTime), N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', 4, 5, 6, 7, 7, 4, 4, 4, 4, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45, 26, 24, 21, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (683, N'8722412', 1, 1, CAST(0xA2E10000 AS SmallDateTime), N'38f7257d-4f09-46d7-bb81-7328498c3940', 4, 6, 6, 7, 8, 9, 4, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 17, 14, 30, CAST(70.0 AS Decimal(18, 1)), 118, CAST(0.0 AS Decimal(18, 1)), 0)
INSERT [dbo].[tb_Scorecard] ([ScorecardId], [GhinID], [LocationID], [PairingID], [Date], [memberid], [Score1], [Score2], [Score3], [Score4], [Score5], [Score6], [Score7], [Score8], [Score9], [ScoreTotalout], [Score10], [Score11], [Score12], [Score13], [Score14], [Score15], [Score16], [Score17], [Score18], [ScoreTotalin], [GrandTotal], [TournamentHandicap], [GhinHandicap], [NetScore], [Rating], [Slope], [Differential], [ScorecardClosed]) VALUES (684, N'1313404', 1, 1, CAST(0xA2E10000 AS SmallDateTime), N'ae64e0a4-8852-46ce-8ae3-4b74daef7659', 5, 4, 5, 5, 7, 6, 7, 0, 0, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 36, 36, 3, CAST(70.0 AS Decimal(18, 1)), 122, CAST(0.0 AS Decimal(18, 1)), 0)
SET IDENTITY_INSERT [dbo].[tb_Scorecard] OFF
/****** Object:  Table [dbo].[Events]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[starttime] [datetime] NOT NULL,
	[endtime] [datetime] NULL,
	[title] [varchar](500) NOT NULL,
	[description] [varchar](800) NULL,
	[staticURL] [varchar](500) NULL,
	[location] [int] NULL,
	[photo] [int] NOT NULL,
	[album] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON
INSERT [dbo].[Events] ([id], [starttime], [endtime], [title], [description], [staticURL], [location], [photo], [album]) VALUES (1, CAST(0x0000A2C50107AC00 AS DateTime), CAST(0x0000A2C5015A11C0 AS DateTime), N'AGM ', N'We will have a great time', NULL, 1, 0, NULL)
INSERT [dbo].[Events] ([id], [starttime], [endtime], [title], [description], [staticURL], [location], [photo], [album]) VALUES (2, CAST(0x0000A2DA00A4CB80 AS DateTime), CAST(0x0000A2DA0140CD00 AS DateTime), N'SAFARI GOLF CLUB CHAMPIONS CUP', N'Stanley Adagi invited you to:

SAFARI GOLF CLUB CHAMPIONS CUP

Sat, Feb 22, 2014 at 10:00 AM

WHERE:
River Point Golf Club
11207 FM 2759 Rd
Richmond TX 77469

Be on Time', NULL, 2, 0, NULL)
SET IDENTITY_INSERT [dbo].[Events] OFF
/****** Object:  Table [dbo].[MemberInfo]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberInfo](
	[address] [varchar](500) NULL,
	[phone] [varchar](50) NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[Tournamenthandicap] [decimal](18, 1) NULL,
	[Ghinhandicap] [decimal](18, 1) NULL,
	[avatar] [image] NULL,
	[memberid] [uniqueidentifier] NOT NULL,
	[GhinID] [varchar](10) NULL,
	[Gender] [varchar](6) NULL,
 CONSTRAINT [PK_MemberInfo] PRIMARY KEY CLUSTERED 
(
	[memberid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'John', N'Dame', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'da199de7-2742-46c1-bf0b-1390e620a075', N'1234567', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Kevin', N'Njuguna', CAST(22.8 AS Decimal(18, 1)), CAST(18.0 AS Decimal(18, 1)), NULL, N'f36b7d97-fd40-46af-aa58-16f97a64d022', N'8722409', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Tom', N'Kagiri', CAST(16.7 AS Decimal(18, 1)), CAST(16.9 AS Decimal(18, 1)), NULL, N'ed97104a-5c1a-4ea7-886c-244e5031fec8', N'8722415', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'John', N'Njeru', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'2f114887-13ad-4292-b300-2974ae7a295a', N'1177449', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'John', N'Kihara', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', N'1227355', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Michael', N'Mburu', CAST(13.0 AS Decimal(18, 1)), CAST(11.1 AS Decimal(18, 1)), NULL, N'45196d8b-39d8-4ac6-9c44-3212da21f665', N'8722411', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Robert', N'Ananda', CAST(15.4 AS Decimal(18, 1)), CAST(11.6 AS Decimal(18, 1)), NULL, N'514c791f-b804-42da-8209-3bfccf6e75cb', N'1227341', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'345 Home', N'1234566598', N'admin', N'admin', CAST(1.0 AS Decimal(18, 1)), CAST(1.0 AS Decimal(18, 1)), NULL, N'aa4d759d-bd38-49d1-a3d3-45f1ec43bcfd', N'0343545', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'John', N'Ngunjiri', CAST(22.0 AS Decimal(18, 1)), CAST(20.4 AS Decimal(18, 1)), NULL, N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', N'0394355', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'John', N'Karenju', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'8c95995a-c186-4f02-ab66-49e1c9d13196', N'9999995', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Geoffrey', N'Kiiru', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'fb976048-5f42-4171-a782-4a2f967cd869', N'0388608', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Liz', N'Waweru', CAST(36.0 AS Decimal(18, 1)), CAST(36.0 AS Decimal(18, 1)), NULL, N'ae64e0a4-8852-46ce-8ae3-4b74daef7659', N'1313404', N'Female')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Patrick', N'Gesora', CAST(24.5 AS Decimal(18, 1)), CAST(20.9 AS Decimal(18, 1)), NULL, N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', N'0489217', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Patrick', N'Mahinda', CAST(8.7 AS Decimal(18, 1)), CAST(5.8 AS Decimal(18, 1)), NULL, N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', N'8722413', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Francis', N'Mathenge', CAST(25.8 AS Decimal(18, 1)), CAST(19.7 AS Decimal(18, 1)), NULL, N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', N'7958191', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Nick', N'Karume', CAST(16.6 AS Decimal(18, 1)), CAST(13.8 AS Decimal(18, 1)), NULL, N'38f7257d-4f09-46d7-bb81-7328498c3940', N'8722412', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Joel', N'Maina', CAST(18.0 AS Decimal(18, 1)), CAST(15.9 AS Decimal(18, 1)), NULL, N'dabcd833-1693-409d-8866-76058b7c3a86', N'0217923', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Guest', N'Z1', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'024622a4-9fc4-4a0f-a41c-8161fff19b25', N'9999992', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Walter', N'Kinyua', CAST(25.5 AS Decimal(18, 1)), CAST(22.3 AS Decimal(18, 1)), NULL, N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', N'7958193', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Mark', N'Adagi', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'249e142c-924e-4d21-8df1-8ddde418c485', N'1124710', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Joe', N'Mahinda', CAST(25.7 AS Decimal(18, 1)), CAST(19.7 AS Decimal(18, 1)), NULL, N'6495b881-fd0d-4080-9a4c-910a05e27994', N'8722424', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Stanley', N'Adagi', CAST(25.9 AS Decimal(18, 1)), CAST(22.6 AS Decimal(18, 1)), NULL, N'a4cb03f8-83da-480c-b6b4-96be23d232f4', N'0507423', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Guest', N'Z4', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'27926e7a-67d8-4c3c-a0a7-9b630a59ea3a', N'9999994', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Simon', N'Gaitho', CAST(18.1 AS Decimal(18, 1)), CAST(14.1 AS Decimal(18, 1)), NULL, N'fea60381-052f-4f68-809c-ab550830a60a', N'8722414', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Clive', N'Dondi', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'bd162676-7d3c-400e-9cdc-c35507426414', N'1414647', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Kevin', N'Yabann', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'2811cdd3-0330-4df6-9e51-c8573c2d101f', N'0298902', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Fred', N'Ndungu', CAST(9.9 AS Decimal(18, 1)), CAST(8.9 AS Decimal(18, 1)), NULL, N'69e649ae-62ac-4886-a29f-cbf2c82192c5', N'7958190', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Mark', N'Gachunga', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'93355450-c6ed-48c5-b46e-d036070ed9d9', N'8722410', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Guest', N'Z2', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'6daff76c-f947-4999-ada0-dabbff293eec', N'9999991', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Bernard', N'Kitur', CAST(25.7 AS Decimal(18, 1)), CAST(20.1 AS Decimal(18, 1)), NULL, N'66be8dc2-3383-4c69-8182-dd18d95347b9', N'8722404', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Wilfred', N'Rurangirwa', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'e708a783-754d-4594-8060-e1ca678df9f7', N'8722416', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Guest', N'Z3', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'fec35412-6662-4293-9d65-e37831a7c36e', N'9999993', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Moses', N'Jejelowo', CAST(28.0 AS Decimal(18, 1)), CAST(28.0 AS Decimal(18, 1)), NULL, N'63519db3-06a9-4237-9a14-facc9f72748b', N'1177454', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Gideon', N'Seroney', CAST(25.9 AS Decimal(18, 1)), CAST(23.7 AS Decimal(18, 1)), NULL, N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', N'8722408', N'Male')
INSERT [dbo].[MemberInfo] ([address], [phone], [firstname], [lastname], [Tournamenthandicap], [Ghinhandicap], [avatar], [memberid], [GhinID], [Gender]) VALUES (N'1234 Main Street', N'8321112222', N'Emmanual', N'Gichanga', CAST(16.0 AS Decimal(18, 1)), CAST(8.7 AS Decimal(18, 1)), NULL, N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', N'7958192', N'Male')
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](500) NOT NULL,
	[description] [varchar](800) NULL,
	[linkURL] [varchar](500) NULL,
	[photo] [int] NOT NULL,
	[directions] [varchar](800) NULL,
	[address] [varchar](300) NULL,
	[Rating] [int] NULL,
	[Slope] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (1, N'River Point Golf Club', N'Please be on time!', N'http://www.riverpointegolf.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (2, N'Quail Valley Golf Course - La', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.golfquailvalley.com/', 3, N'http://www.riverpointegolf.com/', N'11207 FM 2759 Rd, Richmond, TX 77469
(281) 343-9995', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (2, N'Battleground at Deer Park', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (3, N'Cypress Lakes Golf Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (4, N'River Plantation Country Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (5, N'Quail Valley Golf Course - El', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (6, N'The Village Golf Club Winged', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (7, N'Clear Creek Golf Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (8, N'Cypresswood Golf Club - Cypres', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (9, N'Eagle Pointe Golf Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (10, N'Southwyck Golf Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (11, N'The Wilderness Golf Club', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (12, N'Battleground at Deer Park', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (13, N'Grapevine Golf Course Pecan/Mo', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (14, N'Angel Park Golf Club Palm', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (15, N'Bear Creek Golf Club West', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
INSERT [dbo].[Locations] ([id], [title], [description], [linkURL], [photo], [directions], [address], [Rating], [Slope]) VALUES (16, N'Cypresswood Golf Club Traditional', N'Be aware of snakes and allegators but mostly mosquitos.', N'http://www.safarigolftx.com/', 3, N'http://www.safarigolftx.com/', N'123 main', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[images]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[largeimage] [image] NOT NULL,
	[thumbimage] [image] NULL,
	[origimage] [image] NULL,
	[album] [int] NOT NULL,
	[notes] [varchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Pairing]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Pairing](
	[PairingId] [int] IDENTITY(1,1) NOT NULL,
	[SequenceId] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[memberid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MemberInfo_Pairing] PRIMARY KEY CLUSTERED 
(
	[PairingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Pairing] ON
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (393, 1, 2, N'da199de7-2742-46c1-bf0b-1390e620a075')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (394, 1, 2, N'249e142c-924e-4d21-8df1-8ddde418c485')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (395, 1, 2, N'514c791f-b804-42da-8209-3bfccf6e75cb')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (396, 1, 2, N'a4cb03f8-83da-480c-b6b4-96be23d232f4')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (397, 2, 2, N'bd162676-7d3c-400e-9cdc-c35507426414')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (398, 2, 2, N'93355450-c6ed-48c5-b46e-d036070ed9d9')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (399, 2, 2, N'c382200a-a7dd-475e-9ec9-5342b1cd8c96')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (400, 2, 2, N'fea60381-052f-4f68-809c-ab550830a60a')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (401, 3, 2, N'66be8dc2-3383-4c69-8182-dd18d95347b9')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (402, 3, 2, N'6495b881-fd0d-4080-9a4c-910a05e27994')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (403, 3, 2, N'dabcd833-1693-409d-8866-76058b7c3a86')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (404, 3, 2, N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (405, 4, 2, N'ae64e0a4-8852-46ce-8ae3-4b74daef7659')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (406, 4, 2, N'2811cdd3-0330-4df6-9e51-c8573c2d101f')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (407, 4, 2, N'024622a4-9fc4-4a0f-a41c-8161fff19b25')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (408, 4, 2, N'6daff76c-f947-4999-ada0-dabbff293eec')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (477, 1, 1, N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (478, 1, 1, N'ae64e0a4-8852-46ce-8ae3-4b74daef7659')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (479, 1, 1, N'38f7257d-4f09-46d7-bb81-7328498c3940')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (480, 2, 1, N'93355450-c6ed-48c5-b46e-d036070ed9d9')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (481, 2, 1, N'fea60381-052f-4f68-809c-ab550830a60a')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (482, 2, 1, N'e708a783-754d-4594-8060-e1ca678df9f7')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (483, 3, 1, N'66be8dc2-3383-4c69-8182-dd18d95347b9')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (484, 3, 1, N'69e649ae-62ac-4886-a29f-cbf2c82192c5')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (485, 3, 1, N'c382200a-a7dd-475e-9ec9-5342b1cd8c96')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (486, 4, 1, N'fec35412-6662-4293-9d65-e37831a7c36e')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (487, 4, 1, N'45196d8b-39d8-4ac6-9c44-3212da21f665')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (488, 4, 1, N'a4cb03f8-83da-480c-b6b4-96be23d232f4')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (489, 4, 1, N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (490, 5, 1, N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (491, 5, 1, N'a26d7e37-eb13-4b06-b6b8-6319ab52b739')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (492, 5, 1, N'da199de7-2742-46c1-bf0b-1390e620a075')
INSERT [dbo].[tb_Pairing] ([PairingId], [SequenceId], [LocationID], [memberid]) VALUES (493, 5, 1, N'a4cb03f8-83da-480c-b6b4-96be23d232f4')
SET IDENTITY_INSERT [dbo].[tb_Pairing] OFF
/****** Object:  Table [dbo].[tb_Hole]    Script Date: 03/02/2014 00:15:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Hole](
	[HoleId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[Ordinal] [int] NOT NULL,
	[Yardage] [int] NOT NULL,
	[Par] [int] NOT NULL,
	[Handicap] [int] NULL,
 CONSTRAINT [PK_Hole] PRIMARY KEY CLUSTERED 
(
	[HoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Hole_Locations_Ordinal] UNIQUE NONCLUSTERED 
(
	[LocationId] ASC,
	[Ordinal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Hole] ON
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (1, 1, 1, 350, 4, 18)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (4, 1, 2, 403, 4, 10)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (5, 1, 3, 361, 4, 16)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (6, 1, 4, 166, 3, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (7, 1, 5, 507, 5, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (8, 1, 6, 144, 3, 17)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (9, 1, 7, 388, 4, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (10, 1, 8, 159, 3, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (11, 1, 9, 512, 5, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (13, 1, 10, 503, 5, 9)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (15, 1, 11, 428, 4, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (16, 1, 12, 166, 3, 15)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (17, 1, 13, 390, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (18, 1, 14, 392, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (19, 1, 15, 400, 4, 14)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (20, 1, 16, 369, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (21, 1, 17, 170, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (22, 1, 18, 512, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (23, 2, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (24, 2, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (25, 2, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (26, 2, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (27, 2, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (28, 2, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (29, 2, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (30, 2, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (31, 2, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (32, 2, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (33, 2, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (34, 2, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (35, 2, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (36, 2, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (37, 2, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (38, 2, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (39, 2, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (40, 2, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (41, 18, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (42, 18, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (43, 18, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (44, 18, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (45, 18, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (46, 18, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (47, 18, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (48, 18, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (49, 18, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (50, 18, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (51, 18, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (52, 18, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (53, 18, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (54, 18, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (55, 18, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (56, 18, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (57, 18, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (58, 18, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (59, 19, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (60, 19, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (61, 19, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (62, 19, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (63, 19, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (64, 19, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (65, 19, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (66, 19, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (67, 19, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (68, 19, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (69, 19, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (70, 19, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (71, 19, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (72, 19, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (73, 19, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (74, 19, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (75, 19, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (76, 19, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (77, 20, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (78, 20, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (79, 20, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (80, 20, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (81, 20, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (82, 20, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (83, 20, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (84, 20, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (85, 20, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (86, 20, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (87, 20, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (88, 20, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (89, 20, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (90, 20, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (91, 20, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (92, 20, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (93, 20, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (94, 20, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (95, 21, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (96, 21, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (97, 21, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (98, 21, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (99, 21, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (100, 21, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (101, 21, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (102, 21, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (103, 21, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (104, 21, 10, 230, 3, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (105, 21, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (106, 21, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (107, 21, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (108, 21, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (109, 21, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (110, 21, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (111, 21, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (112, 21, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (113, 22, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (114, 22, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (115, 22, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (116, 22, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (117, 22, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (118, 22, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (119, 22, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (120, 22, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (121, 22, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (122, 22, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (123, 22, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (124, 22, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (125, 22, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (126, 22, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (127, 22, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (128, 22, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (129, 22, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (130, 22, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (131, 23, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (132, 23, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (133, 23, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (134, 23, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (135, 23, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (136, 23, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (137, 23, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (138, 23, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (139, 23, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (140, 23, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (141, 23, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (142, 23, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (143, 23, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (144, 23, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (145, 23, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (146, 23, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (147, 23, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (148, 23, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (149, 24, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (150, 24, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (151, 24, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (152, 24, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (153, 24, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (154, 24, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (155, 24, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (156, 24, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (157, 24, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (158, 24, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (159, 24, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (160, 24, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (161, 24, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (162, 24, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (163, 24, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (164, 24, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (165, 24, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (166, 24, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (167, 25, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (168, 25, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (169, 25, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (170, 25, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (171, 25, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (172, 25, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (173, 25, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (174, 25, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (175, 25, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (176, 25, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (177, 25, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (178, 25, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (179, 25, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (180, 25, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (181, 25, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (182, 25, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (183, 25, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (184, 25, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (185, 26, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (186, 26, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (187, 26, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (188, 26, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (189, 26, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (190, 26, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (191, 26, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (192, 26, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (193, 26, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (194, 26, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (195, 26, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (196, 26, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (197, 26, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (198, 26, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (199, 26, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (200, 26, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (201, 26, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (202, 26, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (203, 27, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (204, 27, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (205, 27, 3, 345, 4, 8)
GO
print 'Processed 200 total records'
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (206, 27, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (207, 27, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (208, 27, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (209, 27, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (210, 27, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (211, 27, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (212, 27, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (213, 27, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (214, 27, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (215, 27, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (216, 27, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (217, 27, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (218, 27, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (219, 27, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (220, 27, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (221, 28, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (222, 28, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (223, 28, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (224, 28, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (225, 28, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (226, 28, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (227, 28, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (228, 28, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (229, 28, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (230, 28, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (231, 28, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (232, 28, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (233, 28, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (234, 28, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (235, 28, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (236, 28, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (237, 28, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (238, 28, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (239, 29, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (240, 29, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (241, 29, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (242, 29, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (243, 29, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (244, 29, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (245, 29, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (246, 29, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (247, 29, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (248, 29, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (249, 29, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (250, 29, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (251, 29, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (252, 29, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (253, 29, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (254, 29, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (255, 29, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (256, 29, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (257, 30, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (258, 30, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (259, 30, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (260, 30, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (261, 30, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (262, 30, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (263, 30, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (264, 30, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (265, 30, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (266, 30, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (267, 30, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (268, 30, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (269, 30, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (270, 30, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (271, 30, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (272, 30, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (273, 30, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (274, 30, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (275, 31, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (276, 31, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (277, 31, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (278, 31, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (279, 31, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (280, 31, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (281, 31, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (282, 31, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (283, 31, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (284, 31, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (285, 31, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (286, 31, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (287, 31, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (288, 31, 14, 342, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (289, 31, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (290, 31, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (291, 31, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (292, 31, 18, 566, 5, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (293, 32, 1, 456, 4, 3)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (294, 32, 2, 200, 3, 5)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (295, 32, 3, 345, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (296, 32, 4, 500, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (297, 32, 5, 145, 3, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (298, 32, 6, 434, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (299, 32, 7, 567, 5, 2)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (300, 32, 8, 200, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (301, 32, 9, 450, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (302, 32, 10, 230, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (303, 32, 11, 340, 4, 8)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (304, 32, 12, 444, 4, 4)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (305, 32, 13, 666, 5, 7)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (306, 32, 14, 342, 4, 3)
GO
print 'Processed 300 total records'
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (307, 32, 15, 122, 3, 1)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (308, 32, 16, 433, 4, 12)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (309, 32, 17, 455, 4, 11)
INSERT [dbo].[tb_Hole] ([HoleId], [LocationId], [Ordinal], [Yardage], [Par], [Handicap]) VALUES (310, 32, 18, 566, 5, 1)
SET IDENTITY_INSERT [dbo].[tb_Hole] OFF
/****** Object:  Table [dbo].[tb_CourseRating]    Script Date: 03/02/2014 00:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CourseRating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[LocationId] [int] NOT NULL,
	[MaleRating] [decimal](18, 1) NULL,
	[MaleSlope] [int] NOT NULL,
	[FemaleRating] [decimal](18, 1) NULL,
	[FemaleSlope] [int] NOT NULL,
 CONSTRAINT [PK_CourseRating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Locations_CourseRating] UNIQUE NONCLUSTERED 
(
	[LocationId] ASC,
	[MaleRating] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_CourseRating] ON
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (1, 1, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (2, 2, CAST(71.3 AS Decimal(18, 1)), 128, CAST(68.5 AS Decimal(18, 1)), 132)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (4, 18, CAST(72.3 AS Decimal(18, 1)), 108, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (5, 19, CAST(74.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (6, 20, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (7, 21, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (8, 22, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (9, 23, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (10, 24, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (11, 25, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (12, 26, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (13, 27, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (14, 28, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (15, 29, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (16, 30, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (17, 31, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
INSERT [dbo].[tb_CourseRating] ([RatingId], [LocationId], [MaleRating], [MaleSlope], [FemaleRating], [FemaleSlope]) VALUES (18, 32, CAST(70.3 AS Decimal(18, 1)), 118, CAST(69.5 AS Decimal(18, 1)), 122)
SET IDENTITY_INSERT [dbo].[tb_CourseRating] OFF
/****** Object:  Table [dbo].[tb_County]    Script Date: 03/02/2014 00:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_County](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Abbreviation] [varchar](20) NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteThemes]    Script Date: 03/02/2014 00:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteThemes](
	[Theme] [nvarchar](50) NOT NULL,
	[ThemeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SiteThemes] PRIMARY KEY CLUSTERED 
(
	[ThemeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SiteThemes] ON
INSERT [dbo].[SiteThemes] ([Theme], [ThemeID]) VALUES (N'Club', 1)
INSERT [dbo].[SiteThemes] ([Theme], [ThemeID]) VALUES (N'DevCow', 2)
INSERT [dbo].[SiteThemes] ([Theme], [ThemeID]) VALUES (N'CodeCamp', 3)
SET IDENTITY_INSERT [dbo].[SiteThemes] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 03/02/2014 00:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(20)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 03/02/2014 00:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 03/02/2014 00:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Announcements]    Script Date: 03/02/2014 00:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Announcements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemdate] [datetime] NOT NULL,
	[title] [varchar](500) NOT NULL,
	[description] [varchar](500) NULL,
	[staticURL] [varchar](500) NULL,
	[photo] [int] NOT NULL,
	[albumid] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Announcements] ON
INSERT [dbo].[Announcements] ([id], [itemdate], [title], [description], [staticURL], [photo], [albumid]) VALUES (1, CAST(0x0000981D017FB290 AS DateTime), N'Just finished AGM Meeting.', N'Great Meeting', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Announcements] OFF
/****** Object:  Table [dbo].[Albums]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Albums](
	[albumid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[parentid] [int] NOT NULL,
	[private] [bit] NULL,
	[description] [varchar](500) NULL,
	[ownerid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[albumid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Albums] ON
INSERT [dbo].[Albums] ([albumid], [title], [parentid], [private], [description], [ownerid]) VALUES (1, N'Qual Valley Jan 2014', 0, 0, NULL, N'aa4d759d-bd38-49d1-a3d3-45f1ec43bcfd')
SET IDENTITY_INSERT [dbo].[Albums] OFF
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'049b8025-67c0-4e5c-88e6-3aefd721e1af', NULL)
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/ClubSite', N'/clubsite', N'f6f215fc-dea5-42cb-9e50-f43fbdfe398f', NULL)
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Paths] ([ApplicationId], [PathId], [Path], [LoweredPath]) VALUES (N'f6f215fc-dea5-42cb-9e50-f43fbdfe398f', N'eb45a230-4501-4bf8-b4a4-19e4fa001f0d', N'~/Default.aspx', N'~/default.aspx')
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'cdef3984-9561-4160-a1ab-19ff2201ca7a', N'Administrators', N'administrators', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'd6025875-2cf7-4f5e-9f91-87a4eb50da65', N'Users', N'users', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[AlbumList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlbumList]
(
	@userid UNIQUEIDENTIFIER
)
AS

SELECT     Albums.albumid, Albums.title, Albums.private, MIN(images.id) AS DisplayImage, COUNT(images.id) AS ImageCount, Albums.description
FROM         Albums LEFT OUTER JOIN
                      images ON Albums.albumid = images.album
WHERE     (Albums.private = 0) OR
                     (Albums.ownerid = @userid)
GROUP BY Albums.albumid, Albums.title, Albums.private, Albums.description

RETURN
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (NULL),
	[IsAnonymous] [bit] NOT NULL DEFAULT ((0)),
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'aa4d759d-bd38-49d1-a3d3-45f1ec43bcfd', N'admin', N'admin', NULL, 0, CAST(0x0000A2CD001D9622 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'66be8dc2-3383-4c69-8182-dd18d95347b9', N'BKitur', N'bkitur', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'bd162676-7d3c-400e-9cdc-c35507426414', N'CDondi', N'cdondi', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', N'EGichanga', N'egichanga', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', N'FMathenge', N'fmathenge', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'69e649ae-62ac-4886-a29f-cbf2c82192c5', N'FNdungu', N'fndungu', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'bb283597-87dc-4c0b-b98f-f1b5bc15843c', N'gideon seroney', N'gideon seroney', NULL, 0, CAST(0x0000A2CC016CD9F4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fb976048-5f42-4171-a782-4a2f967cd869', N'GKiiru', N'gkiiru', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', N'GSeroney', N'gseroney', NULL, 0, CAST(0x0000A2E101554A45 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6daff76c-f947-4999-ada0-dabbff293eec', N'Guest1', N'guest1', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'024622a4-9fc4-4a0f-a41c-8161fff19b25', N'Guest2', N'guest2', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fec35412-6662-4293-9d65-e37831a7c36e', N'Guest3', N'guest3', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'27926e7a-67d8-4c3c-a0a7-9b630a59ea3a', N'Guest4', N'guest4', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'da199de7-2742-46c1-bf0b-1390e620a075', N'JDame', N'jdame', NULL, 0, CAST(0x0000A2D900828CB4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'8c95995a-c186-4f02-ab66-49e1c9d13196', N'JKarenju', N'jkarenju', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', N'JKihara', N'jkihara', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6495b881-fd0d-4080-9a4c-910a05e27994', N'JMahinda', N'jmahinda', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'dabcd833-1693-409d-8866-76058b7c3a86', N'JMaina', N'jmaina', NULL, 0, CAST(0x0000A2D301309188 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', N'JNgunjiri', N'jngunjiri', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'2f114887-13ad-4292-b300-2974ae7a295a', N'JNjeru', N'jnjeru', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'f36b7d97-fd40-46af-aa58-16f97a64d022', N'KNjuguna', N'knjuguna', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'2811cdd3-0330-4df6-9e51-c8573c2d101f', N'KYabann', N'kyabann', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'ae64e0a4-8852-46ce-8ae3-4b74daef7659', N'LWaweru', N'lwaweru', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'249e142c-924e-4d21-8df1-8ddde418c485', N'MAdagi', N'madagi', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'93355450-c6ed-48c5-b46e-d036070ed9d9', N'MGachunga', N'mgachunga', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'63519db3-06a9-4237-9a14-facc9f72748b', N'MJejelowo', N'mjejelowo', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'45196d8b-39d8-4ac6-9c44-3212da21f665', N'MMburu', N'mmburu', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'38f7257d-4f09-46d7-bb81-7328498c3940', N'NKarume', N'nkarume', NULL, 0, CAST(0x0000A2E101314F81 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'd1e652c5-51a1-4718-a059-7cf54591fa91', N'OMacakiage', N'omacakiage', NULL, 0, CAST(0x0000A2D900758334 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', N'PGesora', N'pgesora', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', N'PMahinda', N'pmahinda', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'514c791f-b804-42da-8209-3bfccf6e75cb', N'RAnanda', N'rananda', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'a4cb03f8-83da-480c-b6b4-96be23d232f4', N'SAdagi', N'sadagi', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6077adff-8c6d-459a-999b-153c7de5d81a', N'Sam', N'sam', NULL, 0, CAST(0x000097FE00315678 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'c6363926-4006-4e05-9532-130482b1bbd5', N'seroney', N'seroney', NULL, 0, CAST(0x0000A2CD0034BCC3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'b5c3dc49-276f-4041-9650-85d9eb78af04', N'seroney1', N'seroney1', NULL, 0, CAST(0x0000A2D80032F333 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fea60381-052f-4f68-809c-ab550830a60a', N'SGaitho', N'sgaitho', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'ed97104a-5c1a-4ea7-886c-244e5031fec8', N'TKagiri', N'tkagiri', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', N'WKinyua', N'wkinyua', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'e708a783-754d-4594-8060-e1ca678df9f7', N'WRurangirwa', N'wrurangirwa', NULL, 0, CAST(0x0000A2D301309C14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'f6f215fc-dea5-42cb-9e50-f43fbdfe398f', N'dad08d44-0d42-4902-b57d-26768753f070', N'admin', N'admin', NULL, 0, CAST(0x00009B4C002F4636 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteSettings](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](50) NOT NULL,
	[Theme] [int] NULL,
 CONSTRAINT [PK_SiteSettings] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SiteSettings] ON
INSERT [dbo].[SiteSettings] ([SiteID], [SiteName], [Theme]) VALUES (1, N'safarigolftx.com', 1)
SET IDENTITY_INSERT [dbo].[SiteSettings] OFF
/****** Object:  StoredProcedure [dbo].[PrevAnnouncement]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PrevAnnouncement]
(
		@id int
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)

	SELECT	 top 1 previd=id
	FROM	Announcements
	WHERE	(itemdate < @curr OR
			(itemdate = @curr) AND (id < @id)) order by itemdate desc, id desc
GO
/****** Object:  StoredProcedure [dbo].[PlayerList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PlayerList]
(
	@pageNum INT = 1,
	@pageSize INT = 100
)
	
AS
	DECLARE @rows INT
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keyid=Ghinid FROM memberinfo ORDER BY Ghinid ASC  
		END

SELECT @rowCount=COUNT(*) FROM memberinfo

SET  ROWCOUNT @pageSize
	SELECT Ghinid, Firstname, lastname FROM memberinfo
		WHERE Ghinid > @keyid
	ORDER BY lastname ASC 
RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[PagedUpcommingEventList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagedUpcommingEventList]
(
	@pageNum int = 1,
	@pageSize int = 10
)
	
AS
	declare @rows int
	declare @keydate datetime
	declare @keyid int
	declare @rowCount float /* yes we need a float for the math */
	
	if @pageNum = 1
		begin
			set @keydate= GETDATE()
			set @keyid=0
		end
	else
		BEGIN
			/* get the values for the date and row */
			select @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			select @keydate=starttime, @keyid=id from Events
				WHERE Events.starttime > GetDATE()
				ORDER BY starttime asc, id asc  
		END

select @rowCount=count(*) from Events WHERE Events.starttime > GetDATE()

SET  ROWCOUNT @pageSize
	SELECT Events.id, Events.starttime, Events.title, Events.description, Events.photo, 
		Locations.title AS locationname 
	FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id 
	WHERE (Events.starttime > @keydate OR
			(Events.starttime = @keydate) AND (events.id > @keyid))
	ORDER BY Events.starttime asc, Events.id asc 
RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[PagedRecentEventList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagedRecentEventList]
(
	@pageNum int = 1,
	@pageSize int = 10
)
	
AS
	declare @rows int
	declare @keydate datetime
	declare @keyid int
	declare @rowCount float /* yes we need a float for the math */
	
	if @pageNum = 1
		begin
			set @keydate= GETDATE()
			set @keyid=0
		end
	else
		BEGIN
			/* get the values for the date and row */
			select @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			select @keydate=starttime, @keyid=id from Events
				WHERE starttime < GETDATE()
				ORDER BY starttime desc, id desc  
		END

select @rowCount=count(*) from Events WHERE starttime < GETDATE()

SET  ROWCOUNT @pageSize
	SELECT Events.id, Events.starttime, Events.title, Events.description, Events.photo, 
		Locations.title AS locationname 
	FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id 
	WHERE (Events.starttime < @keydate OR
			(Events.starttime = @keydate) AND (events.id < @keyid))
	ORDER BY Events.starttime desc, Events.id desc 
RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[PagedLocationsList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagedLocationsList]
(
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keyid=id FROM locations ORDER BY id ASC  
		END

SELECT @rowCount=COUNT(*) FROM locations

SET  ROWCOUNT @pageSize
	SELECT id, title, description, linkURL, address, photo, directions
		FROM Locations
		WHERE id > @keyid
	ORDER BY id ASC 
RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[PagedAnnouncementList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagedAnnouncementList] 
(
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keydate DATETIME
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keydate= 0
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keydate=itemdate, @keyid=id FROM announcements ORDER BY itemdate ASC, id ASC  
		END

SELECT @rowCount=COUNT(*) FROM announcements

SET  ROWCOUNT @pageSize
	SELECT id, itemdate, title, description, photo FROM Announcements 
	WHERE (itemdate > @keydate OR
			(itemdate = @keydate) AND (id > @keyid))
	ORDER BY itemdate ASC, id ASC 
	RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[PagedAlbumList]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagedAlbumList]
(
	@ownerID UNIQUEIDENTIFIER,
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keyid=albumid FROM albums 
				WHERE(Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid)
				ORDER BY albumid ASC  
		END

SELECT @rowCount=COUNT(*) FROM albums WHERE (Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid) 

SET  ROWCOUNT @pageSize
	SELECT Albums.albumid, Albums.title, Albums.private, MIN(images.id) AS DisplayImage, count(images.id) as ImageCount 
	FROM Albums LEFT OUTER JOIN images ON Albums.albumid = images.album 
	WHERE ((Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid))
	  AND (albums.albumid > @keyid)
	GROUP BY  albumid, albums.title, albums.private  
	RETURN CEILING(@rowCount/@pageSize)
GO
/****** Object:  StoredProcedure [dbo].[NextPrevLocation]    Script Date: 03/02/2014 00:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NextPrevLocation]
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	

	SELECT	@previd=  max(id)
	FROM	locations
	WHERE	id < @id


SELECT	@nextid=  min(id)
	FROM	locations
	WHERE	id > @id
GO
/****** Object:  StoredProcedure [dbo].[NextPrevEvent]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NextPrevEvent] 
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = starttime
	FROM Events AS Events_1
	WHERE (id = @id)

	SELECT	@previd=  id
	FROM	Events
	WHERE	(starttime < @curr OR
			(starttime = @curr) AND (id < @id)) order by starttime asc, id asc


SELECT	 @nextid= id
	FROM	Events
	WHERE	(starttime > @curr OR
			(starttime = @curr) AND (id > @id)) order by starttime desc, id  desc
GO
/****** Object:  StoredProcedure [dbo].[NextPrevAnnouncement]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NextPrevAnnouncement] 
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)

	SELECT	@previd=  id
	FROM	Announcements
	WHERE	(itemdate < @curr OR
			(itemdate = @curr) AND (id < @id)) order by itemdate asc, id asc


SELECT	 @nextid= id
	FROM	Announcements
	WHERE	(itemdate > @curr OR
			(itemdate = @curr) AND (id > @id)) order by itemdate desc, id  desc
GO
/****** Object:  StoredProcedure [dbo].[NextAnnouncement]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NextAnnouncement] 
(
	@id int
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)


SELECT	  top 1 nextid= id
	FROM	Announcements
	WHERE	(itemdate > @curr OR
			(itemdate = @curr) AND (id > @id)) order by itemdate asc, id  asc
GO
/****** Object:  StoredProcedure [dbo].[GameList]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GameList]
	
AS

SELECT  [tb_Scorecard].[LocationID],[Locations].[title] as locationname  ,
 (select CONVERT(VARCHAR(8), [Date], 1) AS [MM/DD/YY]) as Dateid FROM [tb_Scorecard] ,[Locations]
 where  [tb_Scorecard].[LocationID] =  [Locations].[ID] and [tb_Scorecard].[ScorecardClosed] = 'True'
 group by  locationid , [Locations].[title] , [Date]  order by  locationid, [Date]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[MemberCountByLetter]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MemberCountByLetter]
AS
	DECLARE @letter char(1), @index int, @max int
	CREATE TABLE #results ( letter CHAR(1), num INT)
	SET @index=ASCII('A')
	SET @max=ASCII('Z')

	WHILE @index <= @max
	BEGIN
		SET @letter = CHAR(@index)
		INSERT INTO #results Select letter=@letter, num=count(*) from MemberInfo where SUBSTRING(lastname,1,1)=@letter  
		SET @index = @index + 1
	END
	Select * FROM #results
RETURN
GO
/****** Object:  Table [dbo].[tb_Score]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Score](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[ScorecardId] [int] NOT NULL,
	[HoleId] [int] NOT NULL,
	[Strokes] [int] NOT NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Score] ON
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (1, 1, 1, 5)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (2, 4, 4, 4)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (4, 1, 5, 3)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (5, 1, 6, 6)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (6, 1, 7, 3)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (7, 1, 8, 5)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (8, 2, 1, 3)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (9, 2, 4, 5)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (10, 2, 5, 7)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (11, 2, 6, 5)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (12, 2, 7, 2)
INSERT [dbo].[tb_Score] ([ScoreId], [ScorecardId], [HoleId], [Strokes]) VALUES (13, 2, 8, 9)
SET IDENTITY_INSERT [dbo].[tb_Score] OFF
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'aa4d759d-bd38-49d1-a3d3-45f1ec43bcfd', N'cdef3984-9561-4160-a1ab-19ff2201ca7a')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'38f7257d-4f09-46d7-bb81-7328498c3940', N'cdef3984-9561-4160-a1ab-19ff2201ca7a')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', N'cdef3984-9561-4160-a1ab-19ff2201ca7a')
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 03/02/2014 00:15:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT ((0)),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'aa4d759d-bd38-49d1-a3d3-45f1ec43bcfd', N'yPKUm4WzaFoGH8XwZ05mSD5jZkM=', 1, N'A0UFtqkkPQQ1udDooWb0OA==', NULL, N'admin@test.com', N'admin@test.com', N'color', N'Ky+h8Ne4vKLr8rnZMkDDcK97xno=', 1, 1, CAST(0x000097FE00306894 AS DateTime), CAST(0x0000A2CD001D9622 AS DateTime), CAST(0x000097FE00306894 AS DateTime), CAST(0x0000A2D80029AEC6 AS DateTime), 5, CAST(0x0000A2D80029AEC6 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'66be8dc2-3383-4c69-8182-dd18d95347b9', N'cp5apxC/TvQVIo5pmoqt3Ft2wIE=', 1, N'xRED/GWcoFQWWGD3EHvlyw==', NULL, N'BKitur@safarigolftx.com', N'bkitur@safarigolftx.com', N'Captains First Name?', N'F3qRg3iV2IQyacbfhFCYDx+NnSs=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'bd162676-7d3c-400e-9cdc-c35507426414', N'oJGuLvrvU8DFJlYH/XOs546g42g=', 1, N'fTBD0y69qsGGPz4bokoDsg==', NULL, N'CDondi@safarigolftx.com', N'cdondi@safarigolftx.com', N'Captains First Name?', N'/09lwPuOPDMpDINdaGD1eumtlgc=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'3a4a47e1-f4a2-417f-80df-ff48529a2e4a', N'zCusae1GIybMuTc2Ydd9cZcE5wE=', 1, N'bJF6w1k6qhlDFzmOz1xOEQ==', NULL, N'EGichanga@safarigolftx.com', N'egichanga@safarigolftx.com', N'Captains First Name?', N'AsqoJPi+bPT9C2Q6LbSJDUu7uE4=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'a26d7e37-eb13-4b06-b6b8-6319ab52b739', N'lO4efSZkoDN1QlkQGw+ikS/jK5k=', 1, N'5xcqJzIyMu9P2OsaqI033Q==', NULL, N'FMathenge@safarigolftx.com', N'fmathenge@safarigolftx.com', N'Captains First Name?', N'cqjJkO08ezokF426V94Fts8mEjo=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'69e649ae-62ac-4886-a29f-cbf2c82192c5', N'HmjfhX/hzIU7t4BMXBZMvpWZU2k=', 1, N'ffrOrftZG4jdFe4Aoin9Lw==', NULL, N'FNdungu@safarigolftx.com', N'fndungu@safarigolftx.com', N'Captains First Name?', N'4lX9zU3k8UI+xe7FSfYe1Aw9shY=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'c6363926-4006-4e05-9532-130482b1bbd5', N'C5zuUsTFg1TEIKSC/TJoe0gTugQ=', 1, N'ZE4X5zbt3psByspjDSaxgA==', NULL, N'gid@gid.com', N'gid@gid.com', N'admin123!', N'C5zuUsTFg1TEIKSC/TJoe0gTugQ=', 1, 0, CAST(0x0000A2CD002B8E64 AS DateTime), CAST(0x0000A2CD0034BCC3 AS DateTime), CAST(0x0000A2CD002B8E64 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 4, CAST(0x0000A2D80029CDA7 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'bb283597-87dc-4c0b-b98f-f1b5bc15843c', N'8/oHr1ZvjjPwqvWlfAjGT0Q0MuU=', 1, N'FjefE6x6j6VxhD4gz6tAag==', NULL, N'gideonseroney@gmail.com', N'gideonseroney@gmail.com', N'test', N'nDPbRhHIyKNCka6lHPguQigZUdE=', 1, 0, CAST(0x0000A2CC016CD9F4 AS DateTime), CAST(0x0000A2CC016CD9F4 AS DateTime), CAST(0x0000A2CC016CD9F4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fb976048-5f42-4171-a782-4a2f967cd869', N'Jqv6iDJE94CuBxRmhmTbp54uSJ4=', 1, N'IBM+41HnhqQItTY0kk8OeA==', NULL, N'GKiiru@safarigolftx.com', N'gkiiru@safarigolftx.com', N'Captains First Name?', N'mo2DGVlDj8rMDuU9YxBfUK5BwTk=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'0ae48eb7-9b5b-4369-9bf0-ff463ec277a6', N'UEjg8Fh+IlBNJ1YdzEleTk+TbZg=', 1, N'A0RIX1KD32jLQEkuvWOCEA==', NULL, N'GSeroney@safarigolftx.com', N'gseroney@safarigolftx.com', N'Captains First Name?', N'PlpmYQ8WrNfv6KMolBhRGWEx8Os=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2E101554A45 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6daff76c-f947-4999-ada0-dabbff293eec', N'RvZUWF4aFoNjQ+y7vYcoRMmkDAo=', 1, N'vJJ4XdY+WAuqNFfoMffOUQ==', NULL, N'Guest1@safarigolftx.com', N'guest1@safarigolftx.com', N'Captains First Name?', N'zPXBdsmP53vF1CSbMhuzFneamsY=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'024622a4-9fc4-4a0f-a41c-8161fff19b25', N'cn71YscMk0WDWfYovhE7yBlrFR8=', 1, N'CL6kLNsgJTi2u4WZx9j0zw==', NULL, N'Guest2@safarigolftx.com', N'guest2@safarigolftx.com', N'Captains First Name?', N'xmmdaH/Sw9NkQAhLpRxfEVsnxaM=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fec35412-6662-4293-9d65-e37831a7c36e', N'47/BFWuyC4KWRPOh9Ry0Wfuejzg=', 1, N'ViGQ+XlNe2XKZxmnhadf6A==', NULL, N'Guest3@safarigolftx.com', N'guest3@safarigolftx.com', N'Captains First Name?', N'dwCH8Lj8HDWEsX/JLYFvuTgyxTM=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'27926e7a-67d8-4c3c-a0a7-9b630a59ea3a', N'BGIX1DE+bg3P8EHbNu18MovQMgI=', 1, N'7m4DFdiYd4tya1ExSbb3WQ==', NULL, N'Guest4@safarigolftx.com', N'guest4@safarigolftx.com', N'Captains First Name?', N'CczUQvzyX7fCRgjoaa4r5fRpyr0=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'da199de7-2742-46c1-bf0b-1390e620a075', N'qQ29gXRAcdAeLAWnqIWkOEn9Cpc=', 1, N'2HB9/Ckxi7LtAaDAXFrBYw==', NULL, N'JDame@safarigolftx.com', N'jdame@safarigolftx.com', N'Captains First Name?', N'mqs9UV42/dun/uIg1HD5Jbkmxu4=', 1, 0, CAST(0x0000A2D900828CB4 AS DateTime), CAST(0x0000A2D900828CB4 AS DateTime), CAST(0x0000A2D900828CB4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'8c95995a-c186-4f02-ab66-49e1c9d13196', N'qtSOunrIin45Ih17SIQ/fX4aelg=', 1, N'VP7XIpwqdYguIqt+yvtEFg==', NULL, N'JKarenju@safarigolftx.com', N'jkarenju@safarigolftx.com', N'Captains First Name?', N'yAVMAY4oez+3t+OmJd1ZiMJfyq0=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'1f6c510b-d74a-4e90-a239-2e8f18ebefc5', N'RZ1Yx0Jj2lgxQJ+jNy+x1f0uJnw=', 1, N'RcCXBBjrd+yXhHby39zGNw==', NULL, N'JKihara@safarigolftx.com', N'jkihara@safarigolftx.com', N'Captains First Name?', N't19quq1rbEorHjFZ7N0gULyVS7E=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6077adff-8c6d-459a-999b-153c7de5d81a', N'3ZMQpP1YeT8f6NqkkmZ8wl3V96c=', 1, N'4DkjvP1fb3nI66HEyLmAag==', NULL, N'sam@test.com', N'sam@test.com', N'color', N'E2S1/l6n+xT4fQJz2OLHKB6uM0M=', 1, 0, CAST(0x000097FE00315678 AS DateTime), CAST(0x000097FE00315678 AS DateTime), CAST(0x000097FE00315678 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'b5c3dc49-276f-4041-9650-85d9eb78af04', N'CyfH5ir3CA0NxRMN6ou7vZRtTvo=', 1, N'Bx5T0Klg+2kuwTWJpvs9pw==', NULL, N'seroney1@home.com', N'seroney1@home.com', N'tyest', N'yUYw1N6MmFk+hCDY7RTV/9pHXk4=', 1, 0, CAST(0x0000A2D8002ABDCC AS DateTime), CAST(0x0000A2D80032F333 AS DateTime), CAST(0x0000A2D8002ABDCC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'6495b881-fd0d-4080-9a4c-910a05e27994', N'2uQj2Dhbn3Z6MytebEn7+zekQnA=', 1, N'fsoapk0yEN91Ahz/ce4TQw==', NULL, N'JMahinda@safarigolftx.com', N'jmahinda@safarigolftx.com', N'Captains First Name?', N'w2Go0PIaDKb6elGZE/JNc3od0As=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'dabcd833-1693-409d-8866-76058b7c3a86', N'4YJmIUdtrPsR2loe70jAnvAL1UM=', 1, N'kHe8rB+2nEiuMj6xZ99Y4Q==', NULL, N'JMaina@safarigolftx.com', N'jmaina@safarigolftx.com', N'Captains First Name?', N'/ijgeqzs4sIOiJlKXrbiAKbDLfU=', 1, 0, CAST(0x0000A2D301309188 AS DateTime), CAST(0x0000A2D301309188 AS DateTime), CAST(0x0000A2D301309188 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'9d2e8ff6-a42f-4469-a659-47dbdb0b1b87', N'8tIGSIXPUB7XlGMqF///acwgZbg=', 1, N'X5GVSbArv2Ujfp/CC79XuQ==', NULL, N'JNgunjiri@safarigolftx.com', N'jngunjiri@safarigolftx.com', N'Captains First Name?', N'euGnZQPry3rkAyKc+E2U2t7OF44=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'2f114887-13ad-4292-b300-2974ae7a295a', N'lXE8sbBSq3fBTGbxTiAEXaD0bu0=', 1, N'OfLK/zEmvRUidLDk8qFa8A==', NULL, N'JNjeru@safarigolftx.com', N'jnjeru@safarigolftx.com', N'Captains First Name?', N'tTgHDI0K8jumHTGR08IPBGC093I=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'f36b7d97-fd40-46af-aa58-16f97a64d022', N'QptEh7EZzy+MHpAEsRfu5Q5BqbU=', 1, N'5J0v9THf03QWNmJAkTNZ1A==', NULL, N'KNjuguna@safarigolftx.com', N'knjuguna@safarigolftx.com', N'Captains First Name?', N'8S+0gcyjd1nqKMRtOGu1jdXYNio=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'2811cdd3-0330-4df6-9e51-c8573c2d101f', N'XzCASNFVWHbHNiKHH1X7a2aEJ5g=', 1, N'3k+uAkGTGC/XYMlXkU93KQ==', NULL, N'KYabann@safarigolftx.com', N'kyabann@safarigolftx.com', N'Captains First Name?', N'BC4HESWNa3wqoc3ksTPRVm4vaYY=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'ae64e0a4-8852-46ce-8ae3-4b74daef7659', N'ozPla/SzM2dDAaWfl1zAdAA/Kcw=', 1, N'QXuGdkZ8wCckgZCvRCwLrg==', NULL, N'LWaweru@safarigolftx.com', N'lwaweru@safarigolftx.com', N'Captains First Name?', N'ODFmrg3j3KGqVlYZ9Bsj7kEZFBA=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'249e142c-924e-4d21-8df1-8ddde418c485', N'VgYyAR17RwXn6RZ+LwTs08lXYwI=', 1, N'hEpzSmpfoncwnD4tjHW7Ug==', NULL, N'MAdagi@safarigolftx.com', N'madagi@safarigolftx.com', N'Captains First Name?', N'GaUJ11m+qQS54BZNAj0m0qCtnjs=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'93355450-c6ed-48c5-b46e-d036070ed9d9', N'FCh09/rUFj0EBxrFZ0CkY26Wo3I=', 1, N'FerH55Lrzy2GMuVJkteuuQ==', NULL, N'MGachunga@safarigolftx.com', N'mgachunga@safarigolftx.com', N'Captains First Name?', N'9C7+ZNl9SvImfRdRBHoL6S573EM=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'63519db3-06a9-4237-9a14-facc9f72748b', N'cOn9C4zICOWHu/55TkZAoNJmNLk=', 1, N'koVacQ5TIVSayDMUf8AGlg==', NULL, N'MJejelowo@safarigolftx.com', N'mjejelowo@safarigolftx.com', N'Captains First Name?', N'TqJnTNXWoiTYpTML6ug9Ariyo+M=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'45196d8b-39d8-4ac6-9c44-3212da21f665', N'v3iNfPFrSkxNosFHNxf2zeGtNYI=', 1, N'+nVlWn7IZHB5hRl0QsO6Kw==', NULL, N'MMburu@safarigolftx.com', N'mmburu@safarigolftx.com', N'Captains First Name?', N'udxHa0jHdgHYtt/V511+3ySQPNM=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'38f7257d-4f09-46d7-bb81-7328498c3940', N'TDtexVu7KVQt08Sc5Gk8ypnLpIc=', 1, N'JxBucyVHai/2fd2bcNwu4A==', NULL, N'NKarume@safarigolftx.com', N'nkarume@safarigolftx.com', N'Captains First Name?', N'C4RAnUEhipa2ZPoOpqiELaI6/Hw=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2E101314F81 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'd1e652c5-51a1-4718-a059-7cf54591fa91', N'Fi6VOuyiWFCmgWhHsT5Kbh+SlZU=', 1, N'U/QKEUo20ccQJyYDdpm9GQ==', NULL, N'OMacakiage@safarigolftx.com', N'omacakiage@safarigolftx.com', N'Captains First Name?', N'ywgEW/xhBnjyplzUUCR8pMxzFG8=', 1, 0, CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0x0000A2D900758334 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'c382200a-a7dd-475e-9ec9-5342b1cd8c96', N'B0F+4mPbFMIq1FsJEAElquqMQow=', 1, N'ZEySvD0yRZgHRCfMMiPEyA==', NULL, N'PGesora@safarigolftx.com', N'pgesora@safarigolftx.com', N'Captains First Name?', N'4pp+4yKeHtp3AYjYXrfmu+NOyxU=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'1f31cf1b-dae5-491c-8fea-5740dbd08f5c', N'LDYQt3mp5uxKgGCAYVGlX/0EC0E=', 1, N'g+OKyIOtiO04XRI4jkMMTw==', NULL, N'PMahinda@safarigolftx.com', N'pmahinda@safarigolftx.com', N'Captains First Name?', N'nHqqTJoPvi1SrDaXoke0dnUI1uE=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'514c791f-b804-42da-8209-3bfccf6e75cb', N'VXJL5b+EOY82x9Ssps0IT8qXQEY=', 1, N'Jgj1X8Sfvm+XqEq/vM5a3g==', NULL, N'RAnanda@safarigolftx.com', N'rananda@safarigolftx.com', N'Captains First Name?', N'5lZDjVuvRP/tn3T5KtdriP7VztI=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'a4cb03f8-83da-480c-b6b4-96be23d232f4', N'pFtKB5pAfgjh3XR/9ZwIL7hGFe8=', 1, N'jKeu4FZKeFrxa5VwV2dkZQ==', NULL, N'SAdagi@safarigolftx.com', N'sadagi@safarigolftx.com', N'Captains First Name?', N'TKW2VXjJ8Jzp5HxPrSfw+2B46bI=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'fea60381-052f-4f68-809c-ab550830a60a', N'PVIP66md8YaudEwWmxlSsPHhAak=', 1, N'OA1yHXVnPtXjD6naEehszA==', NULL, N'SGaitho@safarigolftx.com', N'sgaitho@safarigolftx.com', N'Captains First Name?', N'VCmco2/5YdsM9A8J2s8oiJ0XjrI=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'ed97104a-5c1a-4ea7-886c-244e5031fec8', N'N87pvrfCrn24JXJH8fOwzQfmrrI=', 1, N'Ys35Kx3+dd27dI+iZhXHiw==', NULL, N'TKagiri@safarigolftx.com', N'tkagiri@safarigolftx.com', N'Captains First Name?', N'wnP6FUL+05NVYJCNfs5EWawVVog=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'4d4b0a8b-c70f-4807-8b0a-875e1cdec870', N'puUURoA1DQz2vxXi9wyc0yo/+00=', 1, N'T/fIj57cL+DgRzc++UZXVg==', NULL, N'WKinyua@safarigolftx.com', N'wkinyua@safarigolftx.com', N'Captains First Name?', N'ufckFJEPmqG48hodA0Od9A0yBa4=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'049b8025-67c0-4e5c-88e6-3aefd721e1af', N'e708a783-754d-4594-8060-e1ca678df9f7', N'PAD4plz+XeRCasQVbTYwi9KHlkQ=', 1, N'SQ717HpcSV41XofmTN/VZg==', NULL, N'WRurangirwa@safarigolftx.com', N'wrurangirwa@safarigolftx.com', N'Captains First Name?', N'jsEX0aP8neBm16YEOLdOLHKCkZk=', 1, 0, CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0x0000A2D301309C14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_PersonalizationPerUser] ([Id], [PathId], [UserId], [PageSettings], [LastUpdatedDate]) VALUES (N'70fc0e72-06d8-4c1a-a02f-5db9ee5af439', N'eb45a230-4501-4bf8-b4a4-19e4fa001f0d', N'dad08d44-0d42-4902-b57d-26768753f070', 0xFF01142B001602020203192A3153797374656D2E5765622E55492E576562436F6E74726F6C732E57656250617274732E576562506172744D616E6167657205055F5F77706D6602011E1057656250617274537461746555736572142B0010050F6777704D656D6265724C6F67696E3105044C6566746668050B67777057656C636F6D653105055269676874020168050E677770526563656E744E6577733105055269676874666805126777705570636F6D696E674576656E74733105044C6566740201686868192A3153797374656D2E5765622E55492E576562436F6E74726F6C732E57656250617274732E47656E6572696357656250617274050B67777057656C636F6D653102011E0B4368726F6D6553746174650B2A3253797374656D2E5765622E55492E576562436F6E74726F6C732E57656250617274732E506172744368726F6D6553746174650066192B05050F6777704D656D6265724C6F67696E3102011F010B2B060066, CAST(0x00009B4C002EC100 AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, @CurrentTimeUtc, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser] @UserName nvarchar(256) , @ClearTextPassword nvarchar(128) , @Email nvarchar(256) , @pUserId uniqueidentifier

AS

BEGIN

DECLARE @ApplicationName nvarchar(256) DECLARE @PasswordFormat int DECLARE @UnencodedSalt uniqueidentifier DECLARE @Password nvarchar(128) DECLARE @PasswordSalt nvarchar(128) DECLARE @Now DATETIME DECLARE @UniqueEmail int DECLARE @UserId uniqueidentifier

SET @ApplicationName = 'ApplicationName' --Find in aspnet_Applications.ApplicationName SET @PasswordFormat = 1 SET @UnencodedSalt = NEWID() SET @PasswordSalt = dbo.base64_encode(@UnencodedSalt) SET @Password = dbo.base64_encode(HASHBYTES('SHA1', CAST(@UnencodedSalt as varbinary(MAX)) + CAST(@ClearTextPassword AS varbinary(MAX)) )) SET @Now = getutcdate() SET @UniqueEmail = 1 SET @UserId=@pUserId

BEGIN TRANSACTION

--DECLARE @UserId uniqueidentifier

EXECUTE [dbo].[aspnet_Membership_CreateUser] @ApplicationName ,@UserName ,@Password ,@PasswordSalt ,@Email ,NULL ,NULL ,1 -- IsApproved == true ,@Now ,@Now ,@UniqueEmail ,@PasswordFormat ,@UserId OUTPUT

COMMIT

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 03/02/2014 00:15:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__18EBB532]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__19DFD96B]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__1AD3FDA4]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK_SiteSettings_SiteThemes]    Script Date: 03/02/2014 00:15:35 ******/
ALTER TABLE [dbo].[SiteSettings]  WITH CHECK ADD  CONSTRAINT [FK_SiteSettings_SiteThemes] FOREIGN KEY([Theme])
REFERENCES [dbo].[SiteThemes] ([ThemeID])
GO
ALTER TABLE [dbo].[SiteSettings] CHECK CONSTRAINT [FK_SiteSettings_SiteThemes]
GO
/****** Object:  ForeignKey [FK_Score_Hole]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[tb_Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Hole] FOREIGN KEY([HoleId])
REFERENCES [dbo].[tb_Hole] ([HoleId])
GO
ALTER TABLE [dbo].[tb_Score] CHECK CONSTRAINT [FK_Score_Hole]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__1DB06A4F]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__1EA48E88]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__1F98B2C1]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__208CD6FA]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__2180FB33]    Script Date: 03/02/2014 00:15:36 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__22751F6C]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__236943A5]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__245D67DE]    Script Date: 03/02/2014 00:15:37 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
