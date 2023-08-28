; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "TestAppInno"
#define MyAppVersion "2.2.0.0"
#define MyAppPublisher "My Company, Inc."
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "TestApp.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C00E327D-F613-430E-84C0-846CBB619E1A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL} 
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
;OutputDir=Installer
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "windowsdesktop-runtime-6.0.20-win-x64.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\Microsoft.Web.WebView2.WinForms.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\Microsoft.Web.WebView2.Wpf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\setup.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.application"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\TestApp.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\AutoUpdater.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\Debug\net6.0-windows\Microsoft.Web.WebView2.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Code]
function NeedsDotNetFramework: Boolean;
var
  DotNetKey: string;
begin
  { Replace with your own check for the .NET Framework, if required }
  DotNetKey := 'SOFTWARE\Microsoft\NET Core\Setup\InstalledVersions\x64\6.0.20';
  Result := not RegKeyExists(HKEY_LOCAL_MACHINE, DotNetKey);
end;

[Run]
Filename: "{tmp}\windowsdesktop-runtime-6.0.20-win-x64.exe"; Parameters: "/q /norestart"; StatusMsg: "Installing .NET Framework..."; Flags: runhidden; Check: NeedsDotNetFramework
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
