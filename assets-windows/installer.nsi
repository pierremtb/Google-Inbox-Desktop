!include "MUI2.nsh"

Name "Inbox"
BrandingText "pierrejacquier.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\InboxSetup.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\Inbox for Desktop\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start Inbox"
!define MUI_FINISHPAGE_RUN $INSTDIR\Inbox.exe

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\Inbox\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall Inbox for Desktop.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\Inbox.lnk" "$INSTDIR\Inbox.exe"
  CreateShortCut "$SMPROGRAMS\Uninstall Inbox for Desktop.lnk" "$INSTDIR\Uninstall Inbox for Desktop.exe"
  CreateShortCut "$DESKTOP\Inbox.lnk" "$INSTDIR\Inbox.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\Inbox.lnk"
  Delete "$SMPROGRAMS\Uninstall Inbox for Desktop.lnk"
  Delete "$DESKTOP\Inbox.lnk"

SectionEnd
