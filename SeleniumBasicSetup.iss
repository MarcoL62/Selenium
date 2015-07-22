
#define ASSEMBLY_PATH ".\Selenium\bin\Release\Selenium.dll"
#define ASSEMBLY_VERSION GetFileVersion(ASSEMBLY_PATH) 

#define AppName "Selenium"
#define AppID "{{0277FC34-FD1B-4616-BB19-1FDB7381B291}"
#define AppLongName "Selenium Basic"
#define AppPublisher "Florent BREHERET"
#define AppURL "https://github.com/florentbr/SeleniumBasic"
#define AppFolder "SeleniumBasic"
#define AppSetupFilename "SeleniumBasic-" + ASSEMBLY_VERSION

[Setup]

AppId={#AppID}
PrivilegesRequired=lowest 
AppName={#AppLongName}
AppVersion={#ASSEMBLY_VERSION}
AppVerName={#AppLongName}
VersionInfoVersion={#ASSEMBLY_VERSION}
VersionInfoTextVersion={#ASSEMBLY_VERSION}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DisableDirPage=yes
DefaultDirName={localappdata}\{#AppFolder}
UsePreviousAppDir=yes
DefaultGroupName={#AppLongName}
DisableProgramGroupPage=yes
LicenseFile=.\LICENSE.txt
OutputDir="."
OutputBaseFilename={#AppSetupFilename}
;Compression=zip
Compression=lzma2
SolidCompression=yes
DirExistsWarning=no
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
MsgNETFrameworkNotInstalled=Microsoft .NET Framework 3.5 installation was Not detected. 
MsgRegistryWriteFailure=Failed to register the library due to insufficient privileges. 
MsgFileNotFound=File Not found: %1. 
MsgCOMInvokeFailed=Installation failed. The installer was unable to call the registered library. 

[Components]
Name: "pkg_core"; Description: ".Net core libraries"; Types: full compact custom; Flags: fixed;
Name: "pkg_doc"; Description: "Templates and examples"; Types: full compact custom;
Name: "pkg_cons"; Description: "Enhanced console runner for VBScript files"; Types: full compact custom;
Name: "pkg_ff"; Description: "WebDriver for Firefox"; Types: full custom;
Name: "pkg_cr"; Description: "WebDriver for Chrome"; Types: full custom;
Name: "pkg_op"; Description: "WebDriver for Opera"; Types: full custom;
Name: "pkg_ie"; Description: "WebDriver for Internet Explorer"; Types: full custom;
Name: "pkg_pjs"; Description: "WebDriver for PhantomJS (headless browser)"; Types: full custom;
Name: "pkg_ide"; Description: "SeleniumIDE plugin for Firefox"; Types: full custom;

[Files]                                                                                             
Source: "Selenium\bin\Release\Selenium.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_core;
Source: "Selenium\bin\Release\Selenium.pdb"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_core;
Source: "Selenium\bin\Release\Selenium32.tlb"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_core;
Source: "Selenium\bin\Release\Selenium64.tlb"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_core;

Source: "Selenium\bin\Help\Selenium.chm"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_core;                                                                                                    

Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion overwritereadonly ; Attribs:readonly;
Source: "CHANGELOG.txt"; DestDir: "{app}"; Flags: ignoreversion overwritereadonly ; Attribs:readonly;

Source: "VbsConsole\bin\Release\vbsc.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_cons;

Source: "References\firefoxdriver.xpi"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_ff;
Source: "References\chromedriver.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_cr
Source: "References\iedriver.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_ie;
Source: "References\operadriver.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_op;
Source: "References\phantomjs.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_pjs;

Source: "FirefoxAddons\bin\selenium-ide.xpi"; DestDir: "{app}"; Flags: ignoreversion; Components: pkg_ide;
                                                                                                                                                      
Source: "Scripts\*.*" ; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist overwritereadonly ; Attribs:readonly; Components: pkg_core;
Source: "Examples\*.*"; DestDir: "{app}\Examples"; Flags: ignoreversion skipifsourcedoesntexist overwritereadonly ; Attribs:readonly; Components: pkg_doc;
Source: "Templates\*.*" ; DestDir: "{app}\Templates"; Flags: ignoreversion skipifsourcedoesntexist overwritereadonly ; Attribs:readonly; Components: pkg_doc;

;copy config file
Source: "References\exe.config" ; DestDir: "{sys}"; DestName: "wscript.exe.config"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges;
Source: "References\exe.config" ; DestDir: "{sys}"; DestName: "cscript.exe.config"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges;
Source: "References\exe.config" ; DestDir: "{syswow64}"; DestName: "wscript.exe.config"; Flags: ignoreversion uninsneveruninstall; Check: IsWin64 And HasPrivileges;
Source: "References\exe.config" ; DestDir: "{syswow64}"; DestName: "cscript.exe.config"; Flags: ignoreversion uninsneveruninstall; Check: IsWin64 And HasPrivileges;
Source: "References\exe.config" ; DestDir: "{code:GetAppFolder|excel.exe}"; DestName: "EXCEL.EXE.CONFIG"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges And HasApp('excel.exe');
Source: "References\exe.config" ; DestDir: "{code:GetAppFolder|winword.exe}"; DestName: "WINWORD.EXE.CONFIG"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges And HasApp('winword.exe');
Source: "References\exe.config" ; DestDir: "{code:GetAppFolder|msaccess.exe}"; DestName: "MSACCESS.EXE.CONFIG"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges And HasApp('msaccess.exe');
Source: "References\exe.config" ; DestDir: "{code:GetAppFolder|outlook.exe}"; DestName: "OUTLOOK.EXE.CONFIG"; Flags: ignoreversion uninsneveruninstall; Check: HasPrivileges And HasApp('outlook.exe');

[Icons]
Name: "{group}\Project Home Page"; Filename: {#AppURL}; WorkingDir: "{app}";
Name: "{group}\Vbs Console"; Filename: "{app}\vbsc.exe"; WorkingDir: "{app}"; Components: pkg_cons;
Name: "{group}\Examples"; Filename: "{app}\Examples"; WorkingDir: "{app}";
Name: "{group}\Templates"; Filename: "{app}\Templates"; WorkingDir: "{app}";
Name: "{group}\QuickTest"; Filename: "{app}\QuickTest.vbs"; WorkingDir: "{app}";
Name: "{group}\RunCleaner"; Filename: "{app}\RunCleaner.vbs"; WorkingDir: "{app}";
Name: "{group}\API documentation"; Filename: "{app}\Selenium.chm"; WorkingDir: "{app}";
Name: "{group}\ChangeLog"; Filename: "{app}\CHANGELOG.txt"; WorkingDir: "{app}";
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"

[Registry]

;Fix for KB948461 https://support.microsoft.com/en-us/kb/948461                            
Root: HKCR; Subkey: "Interface\{{000C0601-0000-0000-C000-000000000046}"; ValueType: string; ValueName: "";  ValueData: "Office .NET Framework Lockback Bypass Key"; Check: HasPrivileges And HasExcel2003orInf;

;Fix for KB907417 > delete key or add exe.config
Root: HKLM; Subkey: "SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\excel.exe"; Flags: deletekey noerror; Check: HasPrivileges And HasExcel2003orInf;
Root: HKLM32; Subkey: "SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\excel.exe"; Flags: deletekey noerror; Check: HasPrivileges And HasExcel2003orInf;

;IE tweaks: Maintain a connection to the instance (for IE11)
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE"; ValueName: "iexplore.exe"; ValueType: dword; ValueData: 0; Components: pkg_ie;

;IE tweaks: Restore default zoom level
Root: HKCU; Subkey: "Software\Microsoft\Internet Explorer\Zoom"; ValueName: "ZoomFactor"; Flags: dontcreatekey deletevalue; Components: pkg_ie;

;IE tweaks: Disable enhanced protected mode
Root: HKCU; Subkey: "Software\Microsoft\Internet Explorer\Main"; ValueName: "Isolation"; Flags: dontcreatekey deletevalue; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Internet Explorer\Main"; ValueName: "Isolation64Bit";  Flags: dontcreatekey deletevalue; Check: IsWin64; Components: pkg_ie;

;IE tweaks: Disable protected mode for all zones  Disable=3 Enable=0
Root: HKCU; Subkey: "Software\Microsoft\Internet Explorer\Main"; ValueName: "NoProtectedModeBanner"; ValueType: dword; ValueData: 1; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"; ValueName: "2500"; ValueType: dword; ValueData: 3; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1"; ValueName: "2500"; ValueType: dword; ValueData: 3; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2"; ValueName: "2500"; ValueType: dword; ValueData: 3; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"; ValueName: "2500"; ValueType: dword; ValueData: 3; Components: pkg_ie;
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\4"; ValueName: "2500"; ValueType: dword; ValueData: 3; Components: pkg_ie;

;IE tweak: Allow HTTP Basic Authentication in url
Root: HKCU; Subkey: "Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_HTTP_USERNAME_PASSWORD_DISABLE"; ValueName: "iexplore.exe"; ValueType: dword; ValueData: 0; Components: pkg_ie;

;File association for the console
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\vbsc.exe"; ValueType: string; ValueData: "{app}\vbsc.exe"; Flags: deletekey uninsdeletekey; Components: pkg_cons;

Root: HKCU; Subkey: "Software\Classes\VBSFile\Shell\Debug"; ValueType: string; ValueData: "Debug"; Flags: deletekey uninsdeletekey;
Root: HKCU; Subkey: "Software\Classes\VBSFile\Shell\Debug\Command"; ValueType: expandsz; ValueData: """%SystemRoot%\System32\wscript.exe"" //D //X ""%1"" %*"; Components: pkg_cons;

Root: HKCU; Subkey: "Software\Classes\VBSFile\shell\runas"; ValueType: string; ValueName: "HasLUAShield"; ValueData: ""; Flags: deletekey uninsdeletekey;
Root: HKCU; Subkey: "Software\Classes\VBSFile\shell\runas\Command"; ValueType: expandsz; ValueData: """%SystemRoot%\System32\wscript.exe"" ""%1"" %*";

Root: HKCU; Subkey: "Software\Classes\VBSFile\Shell\RunExt"; ValueType: string; ValueData: "Run VBScript"; Flags: deletekey uninsdeletekey; Components: pkg_cons;
Root: HKCU; Subkey: "Software\Classes\VBSFile\Shell\RunExt\Command"; ValueType: string; ValueData: """{app}\vbsc.exe"" -i ""%1"" %*"; Components: pkg_cons;

Root: HKCU; Subkey: "Software\Classes\Directory\shell\RunExt"; ValueType: string; ValueData: "Run VBScripts"; Flags: deletekey uninsdeletekey; Components: pkg_cons;
Root: HKCU; Subkey: "Software\Classes\Directory\shell\RunExt\Command"; ValueType: string; ValueData: """{app}\vbsc.exe"" -i ""%1\*.vbs"""; Components: pkg_cons;

;Add excel trusted location for templates and examples
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:GetOfficeVersion|Excel}.0\Excel\Security\Trusted Locations\Selenium1"; ValueName: "Path"; ValueType: String; ValueData: "{app}\Templates"; Flags: uninsdeletekey; Check: HasExcel;
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:GetOfficeVersion|Excel}.0\Excel\Security\Trusted Locations\Selenium2"; ValueName: "Path"; ValueType: String; ValueData: "{app}\Examples"; Flags: uninsdeletekey; Check: HasExcel;
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:GetOfficeVersion|Word}.0\Word\Security\Trusted Locations\Selenium1"; ValueName: "Path"; ValueType: String; ValueData: "{app}\Templates"; Flags: uninsdeletekey; Check: HasWord;
Root: HKCU; Subkey: "Software\Microsoft\Office\{code:GetOfficeVersion|Word}.0\Word\Security\Trusted Locations\Selenium2"; ValueName: "Path"; ValueType: String; ValueData: "{app}\Examples"; Flags: uninsdeletekey; Check: HasWord;

;Enable WScript host in case it's been disabled
Root: HKCU; Subkey: "Software\Microsoft\Windows Script Host\Settings"; ValueName: "Enabled"; ValueType: dword; ValueData: 1; 

[Run]
;Filename: "{app}\RegNet.exe"; Parameters: "-r"; WorkingDir: {app}; Flags: waituntilterminated runascurrentuser runhidden; StatusMsg: "Register for COM interoperability";
Filename: "{code:GetAppPath|firefox.exe}"; Parameters: "selenium-ide.xpi"; WorkingDir: {app}; Flags: shellexec postinstall skipifsilent runascurrentuser; Components: pkg_ide; Check: HasFirefox; Description: "Install the Selenium IDE Addon for Firefox";

[UninstallRun]
;Filename: "{app}\RegNet.exe"; Parameters: "-u"; WorkingDir: {app}; Flags: waituntilterminated runascurrentuser runhidden; StatusMsg: "Unregister for COM interoperability"; 

[InstallDelete]
Type: filesandordirs; Name: "{localappdata}\Temp\Selenium"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"                         
Type: filesandordirs; Name: "{localappdata}\Temp\Selenium"

[Code]

Function HasPrivileges(): Boolean;
  Begin
    Result := IsAdminLoggedOn Or IsPowerUserLoggedOn
  End;

Function GetAppPath(app: String): string;
  Begin
    RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\' + app, '', Result);
  End;

Function HasFirefox(): Boolean;
  Begin
    Result := FileExists(GetAppPath('firefox.exe'));
  End;

Function GetAppFolder(app: String): string;
  Begin
    Result := ExtractFileDir(GetAppPath(app));
  End;

Function HasApp(app: String): Boolean;
  Begin
    Result := GetAppPath(app) <> '';
  End;

Function GetOfficeVersion(app: String): String;
  Var ver: String; i: Integer;
  Begin
    If RegQueryStringValue(HKCR, app + '.Application\CurVer', '', ver) Then Begin
      For i := 1 To Length(ver) Do Begin
        If (ver[i] >= '0') And (ver[i] <= '9') Then
          Result := Result + ver[i];
      End;
    End;
  End;

Function HasExcel(): Boolean;
  Begin
    Result := RegKeyExists(HKCR, 'Excel.Application');
  End;

Function HasWord(): Boolean;
  Begin
    Result := RegKeyExists(HKCR, 'Word.Application');
  End;

Function HasExcel2003orInf(): Boolean;
  Begin
    Result := StrToIntDef(GetOfficeVersion('Excel'), 0) < 12;
  End;

Procedure AssertFrameworkPresent(Const version: String);
  Begin
    If Not RegKeyExists(HKLM,'SOFTWARE\Microsoft\NET Framework Setup\NDP\v' + version) Then
        RaiseException(ExpandConstant('{cm:MsgNETFrameworkNotInstalled}'));
  End;

Procedure AssertFilePresent(Const path: String);
  Begin
      If Not FileExists(path) Then
          RaiseException(ExpandConstant('{cm:MsgFileNotFound,' + path +'}'));
  End;

Function UninstallPrevious(const appid: String): Boolean;
  Var key, name, out_cmd: String; retcode: Integer;
  Begin
    key := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\' + ExpandConstant(appid) + '_is1';
    name := 'UninstallString';
    If Not RegQueryStringValue(HKCU, key, name, out_cmd) Then
      If Not RegQueryStringValue(HKLM, key, name, out_cmd) Then
         If Not RegQueryStringValue(HKCU32, key, name, out_cmd) Then
            RegQueryStringValue(HKLM32, key, name, out_cmd);
    If out_cmd <> '' Then
        Exec(RemoveQuotes(out_cmd), '/SILENT /NORESTART /SUPPRESSMSGBOXES', '', SW_SHOW, ewWaitUntilTerminated, retcode);
    Result := retcode = 0;
  End;

//---------------------------------------------------------------------------------------
// Registration
//---------------------------------------------------------------------------------------

type
  TNetLib = record
    Guid: String;
    FullName: String;
    Description: String;
    TypeVersion: String;
    Directory: String;
    PathDll: String;
    PathTlb32: String;
    PathTlb64: String;
    Runtime: String;
  end;

Procedure RegString(Const root: Integer; Const subkey, name, value: String);
  Begin
      Log('reg [' + subkey + '] "' + name + '"="' + value + '"');
      If Not RegWriteStringValue(root, subkey, name, value) Then
         RaiseException(ExpandConstant('{cm:MsgRegistryWriteFailure}')); 
  End;

// Interface registration (32/64bits Independent) :
// 
// HKCU\Software\Classes\Interface\{ interface guid }
//   ""=" interface name "
//   \ProxyStubClsid32
//     ""=" interface short name "
//   \TypeLib
//     ""="{ assembly guid }"
//   \Version
//     ""=" assembly type version "
//
Procedure RegInterface_(Const lib : TNetLib; Const root: Integer; Const guid, typename, proxyStub: String);
  Var key: String;
  Begin
    key := 'Software\Classes\Interface\' + guid;
    RegDeleteKeyIncludingSubkeys(root, key);
    If Not IsUninstaller Then Begin        
      RegString(root, key                        , ''         , typename         );
      RegString(root, key + '\ProxyStubClsid32'  , ''         , proxyStub        );
      RegString(root, key + '\TypeLib'           , ''         , lib.Guid         ); 
      RegString(root, key + '\TypeLib'           , 'Version'  , lib.TypeVersion  ); 
    End
  End;

Procedure RegInterface(Const lib : TNetLib; Const guid, name, proxystub: String);
  Begin        
    RegInterface_(lib, HKCU, guid, name, proxystub);
    If IsWin64 Then
      RegInterface_(lib, HKCU32, guid, name, proxystub);
  End;

// Enumeration registration (32/64bits Shared) :
// 
// HKCU\Software\Classes\Record\{ record guid }]
//   ""="mscoree.dll"
//   "Class"="Selenium.Structures.Point"
//   "Assembly"="Selenium, Version=2.0.1.2, Culture=neutral, PublicKeyToken=null"
//   "RuntimeVersion"="v2.0.50727"
//   "CodeBase"="C:\...\SeleniumBasic\Selenium.dll"
//
Procedure RegRecord(Const lib : TNetLib; Const guid, typename: String);
  Var key: String;
  Begin
    key := 'Software\Classes\Record\' + guid;
    RegDeleteKeyIncludingSubkeys(HKCU, key);
    If Not IsUninstaller Then Begin
      RegString(HKCU, key, 'Class'           , typename     );
      RegString(HKCU, key, 'Assembly'        , lib.FullName );
      RegString(HKCU, key, 'RuntimeVersion'  , lib.Runtime  ); 
      RegString(HKCU, key, 'CodeBase'        , lib.PathDll  );
    End
  End;

// CLSID registration (32/64bits Independent) :
// 
// Root\Software\Classes\CLSID\{ class guid }
//   ""="Selenium.WebDriver"
//   \InprocServer32
//     ""="C:\Windows\System32\mscoree.dll"
//     "Class"="Selenium.WebDriver"
//     "Assembly"="Selenium, Version=2.0.1.2, Culture=neutral, PublicKeyToken=null"
//     "RuntimeVersion"="v2.0.50727"
//     "CodeBase"="C:\...\SeleniumBasic\Selenium.dll"
//     "ThreadingModel"="Both"
//   \Implemented Categories\{62C8FE65-4EBB-45e7-B440-6E39B2CDBF29}
//     ""=""
//   \ProgId
//     ""="Selenium.WebDriver"
//   \VersionIndependentProgID
//     ""="Selenium.WebDriver"
// 
Procedure RegClsid(Const lib : TNetLib; Const root: Integer; Const guid, progid, typename, sysdir: String);
  Var key, skey : String;
  Begin
    key := 'Software\Classes\CLSID\' + guid;
    RegDeleteKeyIncludingSubkeys(root, key);
    If Not IsUninstaller Then Begin
      RegString(root, key, '', typename);
      
      skey := key + '\InprocServer32';
      RegString(root, skey, ''               , ExpandConstant(sysdir) + '\mscoree.dll' ); 
      RegString(root, skey, 'Class'          , typename     );
      RegString(root, skey, 'Assembly'       , lib.FullName );
      RegString(root, skey, 'RuntimeVersion' , lib.Runtime  ); 
      RegString(root, skey, 'CodeBase'       , lib.PathDll  );
      RegString(root, skey, 'ThreadingModel' , 'Both'       );

      skey := key + '\Implemented Categories\{62C8FE65-4EBB-45e7-B440-6E39B2CDBF29}';
      RegString(root, skey, '', '');

      skey := key + '\ProgId';
      RegString(root, skey, '', progid);

      skey := key + '\VersionIndependentProgID';
      RegString(root, skey, '', progid);
    End
  End;

// Class registration (32/64bits Shared) :
// 
// HKCU\Software\Classes\[progid]
//   ""=[progid]
//   \CLSID
//     ""=[class guid]
//
Procedure RegClass(Const lib : TNetLib; Const guid, progid, typename: String);
  Var key, sysdir: String;
  Begin
    key := 'Software\Classes\' + progid;
    RegDeleteKeyIncludingSubkeys(HKCU, key);
    If Not IsUninstaller Then Begin
      RegString(HKCU, key, '', progid);
      RegString(HKCU, key + '\CLSID', '', guid);
    End

    RegClsid(lib, HKCU, guid, progid, typename, '{sys}');
    If IsWin64 Then
      RegClsid(lib, HKCU32, guid, progid, typename, '{syswow64}');
  End;

// TypeLib registration (32/64bits Shared) :
// 
// HKCU\Software\Classes\TypeLib\[assembly guid]
//   \2.0
//     ""="App Type Library"
//     \0\win32
//       ""="C:\...\App32.tlb"
//     \0\win64
//       ""="C:\...\App64.tlb"
//     \FLAGS
//       ""="0"
//     \HELPDIR
//       ""="C:\..."
//
Procedure RegTypeLib(Const lib : TNetLib);
  Var key, skey : String;
  Begin
    key := 'Software\Classes\TypeLib\' + lib.Guid;
    RegDeleteKeyIncludingSubkeys(HKCU, key);
    If Not IsUninstaller Then Begin
      skey := key + '\' + lib.TypeVersion;
      RegString(HKCU, skey, '', lib.Description); 
      RegString(HKCU, skey + '\FLAGS'   , ''  , '0'           ); 
      RegString(HKCU, skey + '\HELPDIR' , ''  , lib.Directory );
      RegString(HKCU, skey + '\0\win32' , ''  , lib.PathTlb32 );
      If IsWin64 Then
        RegString(HKCU, skey + '\0\win64', '' , lib.PathTlb64 );
    End
  End;

Procedure RegisterAssembly();
  Var lib : TNetLib;
  Begin
    { Includes the file generated by gen-registration.ipy }
    #include 'SeleniumBasicSetup.pas'
  End;

//---------------------------------------------------------------------------------------
// Workflow
//---------------------------------------------------------------------------------------
                   
Function InitializeSetup() : Boolean;
  Begin
      AssertFrameworkPresent('3.5');
      Result := True;
  End;

Procedure CurStepChanged(CurStep: TSetupStep);
  Begin
    If CurStep = ssInstall Then Begin
      UninstallPrevious('SeleniumWrapper');
      UninstallPrevious('{#AppId}');
    End Else If CurStep = ssPostInstall Then Begin
      RegisterAssembly();
    End;
  End;

Procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep); 
  Begin
    If CurUninstallStep = usUninstall  Then Begin
      RegisterAssembly(); //Only deletes the main keys
    End;
  End;