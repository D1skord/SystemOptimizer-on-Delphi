                  unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, StdCtrls, Registry, jpeg, ExtCtrls, Buttons, ComCtrls, Masks,
  Vcl.Menus, GifImg, IOUtils, MATH, Vcl.CheckLst, Vcl.Imaging.pngimage;


type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TmpFilesCB: TCheckBox;
    RecycleBinCB: TCheckBox;
    DownloadsCB: TCheckBox;
    CacheCB: TCheckBox;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    MainScrollBox: TScrollBox;
    Label2: TLabel;
    Label3: TLabel;
    offVE_CB: TCheckBox;
    onVE_CB: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    CB1: TCheckBox;
    CB5: TCheckBox;
    CB3: TCheckBox;
    CB4: TCheckBox;
    CB2: TCheckBox;
    CB6: TCheckBox;
    CB7: TCheckBox;
    CB8: TCheckBox;
    CB9: TCheckBox;
    CB10: TCheckBox;
    CB11: TCheckBox;
    CB12: TCheckBox;
    CB13: TCheckBox;
    CB14: TCheckBox;
    CB15: TCheckBox;
    Apply: TSpeedButton;
    ServiceCB: TCheckBox;
    VE_CB: TCheckBox;
    ExitBtn: TSpeedButton;
    SpeedButton4: TSpeedButton;


    procedure SpeedButton1Click(Sender: TObject);
    procedure onVE_CBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ApplyClick(Sender: TObject);
    procedure ServiceCBClick(Sender: TObject);
    procedure VE_CBClick(Sender: TObject);
    procedure offVE_CBClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Service = class(TObject)

    const w = 'SYSTEM\CurrentControlSet\Services\';
  private
    procedure switch(way : string; val : integer);
  public

    procedure OfflineFiles(val : integer);overload;//���������� �����
    procedure OfflineFiles(cb : TCheckBox);overload;

    procedure BiomWinSvc(val : integer);overload;//�������������� ������ Windows
    procedure BiomWinSvc(cb : TCheckBox);overload;

    procedure Firewall(val : integer);overload;//����������
    procedure Firewall(cb : TCheckBox);overload;

    procedure IPHelperSvc(val : integer);overload;//��������������� ������ IP
    procedure IPHelperSvc(cb : TCheckBox);overload;

    procedure PrintManager(val : integer);overload;//��������� ������
    procedure PrintManager(cb : TCheckBox);overload;

    procedure SessionManager(val : integer);overload;//��������� ������� ���������� ���� �������� �����
    procedure SessionManager(cb : TCheckBox);overload;

    procedure DowMapManager(val : integer);overload;//��������� ��������� ����
    procedure DowMapManager(cb : TCheckBox);overload;

    procedure SecureStorage(val : integer);overload;//���������� ���������
    procedure SecureStorage(cb : TCheckBox);overload;

    procedure Server(val : integer);overload;//������
    procedure Server(cb : TCheckBox);overload;

    procedure XboxLiveNet(val : integer);overload;//������� ������ Xbox Live
    procedure XboxLiveNet(cb : TCheckBox);overload;

    procedure TabletInputSvc(val : integer);overload;//������ ����� ����������� ��
    procedure TabletInputSvc(cb : TCheckBox);overload;

    procedure DiagTrackSvc(val : integer);overload;//������ ���������������� ������������
    procedure DiagTrackSvc(cb : TCheckBox);overload;

    //procedure WinDefSvc(val : integer);overload;//������ ��������� Windows
   // procedure WinDefSvc(cb : TCheckBox);overload;

    //procedure DiagPolicySvc(val : integer);overload;//������ �������� �����������
   // procedure DiagPolicySvc(cb : TCheckBox);overload;

    procedure ProgCompatbltyAssistSvc(val : integer);overload;//������ ��������� �� ������������� ��������
    procedure ProgCompatbltyAssistSvc(cb : TCheckBox);overload;

    procedure WinErrLogSvc(val : integer);overload;//������ ����������� ������ �������
    procedure WinErrLogSvc(cb : TCheckBox);overload;

    procedure BitLockDrvEncryptSvc(val : integer);overload;//������ ���������� ������ BitLocker
    procedure BitLockDrvEncryptSvc(cb : TCheckBox);overload;

    procedure Themes(val : integer);overload;//����
    procedure Themes(cb : TCheckBox);overload;

    procedure RemoteReg(val : integer);overload;//��������� ������
    procedure RemoteReg(cb : TCheckBox);overload;

    procedure SecurityCenter(val : integer);overload;//����� ����������� ������������
    procedure SecurityCenter(cb : TCheckBox);overload;

    procedure Superfetch(val : integer);overload;//Superfetch
    procedure Superfetch(cb : TCheckBox);overload;
end;


var
  Form1: TForm1;
implementation

{$R *.dfm}


procedure Service.switch(way: string; val : integer);
  var
    Reg: TRegistry;
  begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
    if val=0
      then
        begin
          Reg.OpenKey(way, false);
          Reg.WriteInteger('Start', 4);
        end
      else
        begin
          Reg.OpenKey(way, false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;
        Reg.Free;
  end;

procedure Service.BiomWinSvc(cb: TCheckBox);
  begin
    cb.Caption := '�������������� ������ Windows';
    cb.Hint := '����, ��������� � �������� �������������� ������.';
  end;
procedure Service.BiomWinSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := 'SYSTEM\CurrentControlSet\Services\WbioSrvc';
    Svc.switch(way,val);
  end;

procedure Service.Firewall(cb : TCheckBox);
  begin
    cb.Caption := '����������';
    cb.Hint := '���� �� ����������� ��������� ���������, � �� ���������� Windows, �� ������ ������ �� ���������';
  end;
procedure Service.Firewall(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'MpsSvc';
    Svc.switch(way,val);
  end;


procedure Service.IPHelperSvc(cb : TCheckBox);
  begin
    cb.Caption := '��������������� ������ IP';
    cb.Hint := '���� �� �� ����������� IPv6-�����������.';
  end;
procedure Service.IPHelperSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'iphlpsvc';
    Svc.switch(way,val);
  end;


procedure Service.PrintManager(cb : TCheckBox);
  begin
    cb.Caption := '��������� ������';
    cb.Hint := '���� � ��� ��� ��������.';

  end;
procedure Service.PrintManager(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'Spooler';
    Svc.switch(way,val);
  end;


procedure Service.DowMapManager(cb : TCheckBox);
  begin
    cb.Caption := '��������� ��������� ����';
    cb.Hint := '���� �� �� ����������� ���������� �������';

  end;
procedure Service.DowMapManager(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'MapsBroker';
    Svc.switch(way,val);
  end;


procedure Service.XboxLiveNet(cb : TCheckBox);
  begin
    cb.Caption := '������� ������ Xbox Live';
    cb.Hint := '������������ ������ � �������� Xbox Live.';
  end;
procedure Service.XboxLiveNet(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'XboxNetApiSvc';
    Svc.switch(way,val);
  end;


procedure Service.DiagTrackSvc(cb : TCheckBox);
  begin
    cb.Caption := '������ ���������������� ������������';
    cb.Hint := '��������� �������� �������� � �������������� ���������, ��������� � ������������ Windows.';
  end;
procedure Service.DiagTrackSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'DiagTrack';
    Svc.switch(way,val);
  end;





procedure Service.ProgCompatbltyAssistSvc(cb : TCheckBox);
  begin
    cb.Caption := '������ ��������� �� ������������� ��������';
    cb.Hint := '������������ ��������� ��������� �� ������������� ��������.';
  end;
procedure Service.ProgCompatbltyAssistSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'PcaSvc';
    Svc.switch(way,val);
  end;


procedure Service.WinErrLogSvc(cb : TCheckBox);
  begin
    cb.Caption := '������ ����������� ������ Windows';
    cb.Hint := '��������� �������� ������� �� ������� � ������ ����������� ������ ��� ��������� ���������.';
  end;
procedure Service.WinErrLogSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'WerSvc';
    Svc.switch(way,val);
  end;


procedure Service.BitLockDrvEncryptSvc(cb : TCheckBox);
  begin
    cb.Caption := '������ ���������� ������ BitLocker';
    cb.Hint := '��������� ��������� �����, ���� �� �� �� ����������� ���������� ���������.';
  end;
procedure Service.BitLockDrvEncryptSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'BDESVC';
    Svc.switch(way,val);
  end;

procedure Service.RemoteReg(cb : TCheckBox);
  begin
    cb.Caption := '�������� ������';
    cb.Hint := '��� ����������� ������ ������������� �������� �������� ��� ������.';
  end;
procedure Service.RemoteReg(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'RemoteRegistry';
    Svc.switch(way,val);
  end;

procedure Service.SecurityCenter(cb : TCheckBox);
  begin
    cb.Caption := '����� ����������� ������������';
    cb.Hint := '������ �� ����������� ����������������� ������� ������������ � ������������� ��.';
  end;
procedure Service.SecurityCenter(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'wscsvc';
    Svc.switch(way,val);
  end;


procedure Service.Superfetch(cb : TCheckBox);
  begin
    cb.Caption := 'Superfetch';
    cb.Hint := '������������� ���������, ���� ����������� SSD ����.';
  end;
procedure Service.Superfetch(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'SysMain';
    Svc.switch(way,val);
  end;

procedure Service.OfflineFiles(cb : TCheckBox);
  begin
    cb.Caption := 'Superfetch';
    cb.Hint := '������������� ���������, ���� ����������� SSD ����.';
  end;
procedure Service.OfflineFiles(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'CscService';
    Svc.switch(way,val);
  end;

procedure Service.Server(cb : TCheckBox);
  begin
    cb.Caption := '������';
    cb.Hint := '������������� ���������, ���� ��������� �� ������������ ��� ������';
  end;
procedure Service.Server(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'LanmanServer';
    Svc.switch(way,val);
  end;

procedure Service.SessionManager(cb : TCheckBox);
  begin
    cb.Caption := '��������� ������� ���������� ���� �������� �����';
    cb.Hint := '���� �� ����������� ���� ���������� Aero.';
  end;
procedure Service.SessionManager(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'UxSms';
    Svc.switch(way,val);
  end;

procedure Service.SecureStorage(cb : TCheckBox);
  begin
    cb.Caption := '���������� ���������';
    cb.Hint := '��������� ������ ����������� (������� ��������������� ���������� ���� � ���������.';
  end;
procedure Service.SecureStorage(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'ProtectedStorage';
    Svc.switch(way,val);
  end;

procedure Service.TabletInputSvc(cb : TCheckBox);
  begin
    cb.Caption := '������ ����� ����������� ��';
    cb.Hint := '������������ ���������������� ���� � ����������� ����� �� ���������� ��.';
  end;
procedure Service.TabletInputSvc(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'TabletInputService';
    Svc.switch(way,val);
  end;

procedure Service.Themes(cb : TCheckBox);
  begin
    cb.Caption := '����';
    cb.Hint := '���� �� �� ����������� ����� ���������� Windows 7, �� ���������� ���������.';
  end;
procedure Service.Themes(val : integer);
  var
    Svc : Service;
    way : string;
  begin
    way := w + 'Themes';
    Svc.switch(way,val);
  end;


function OSVersion() : integer;
  var Reg: TRegistry;
  s : string;
 begin
  Reg := TRegIniFile.Create;

  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion', false);
    s := reg.ReadString('ProductName');
    Delete(s, 11, Length(s));
    if (s =  'Windows 10') then result := 1
      else
        if (s =  'Windows 8 ') then result := 2
          else
            if (s =  'Windows 8.') then result := 2
              else
                if (s =  'Windows 7 ') then result := 3
                  else
                      result := 0;

    Reg.CloseKey;

  end;




procedure SetServiceWin10();
  var
    svc : service;
  begin
    Application.HintHidePause := 100000;

    Svc.BiomWinSvc(Form1.CB1);
    Form1.CB1.Checked := True;
                                                    //Form1.CB1.Enabled := False;
    Svc.Firewall(Form1.CB2);

    Svc.IPHelperSvc(Form1.CB3);
    Form1.CB3.Checked := True;

    Svc.PrintManager(Form1.CB4);

    Svc.DowMapManager(Form1.CB5);
    Form1.CB5.Checked := True;

    Svc.XboxLiveNet(Form1.CB6);
    Form1.CB6.Checked := True;

    Svc.DiagTrackSvc(Form1.CB7);
    Form1.CB7.Checked := True;

    Svc.ProgCompatbltyAssistSvc(Form1.CB8);
    Form1.CB8.Checked := True;

    Svc.WinErrLogSvc(Form1.CB9);
    Form1.CB9.Checked := True;

    Svc.BitLockDrvEncryptSvc(Form1.CB10);
    Form1.CB10.Checked := True;

    Svc.RemoteReg(Form1.CB11);
    Form1.CB11.Checked := True;

    Svc.SecurityCenter(Form1.CB12);
    Form1.CB12.Checked := True;

    Svc.Superfetch(Form1.CB13);
    Form1.CB13.Checked := True;

    Form1.CB14.Destroy;
    Form1.CB15.Destroy;

    Form1.MainScrollBox.VertScrollBar.Range := 500;


end;

procedure SetServiceWin8();
  var
    svc : service;
  begin
    Application.HintHidePause := 100000;

    Svc.OfflineFiles(Form1.CB1);
    Svc.Firewall(Form1.CB2);
    Svc.IPHelperSvc(Form1.CB3);
    Svc.PrintManager(Form1.CB4);
    Svc.Server(Form1.CB5);
    Svc.ProgCompatbltyAssistSvc(Form1.CB6);
    Svc.WinErrLogSvc(Form1.CB7);
    Svc.SecurityCenter(Form1.CB8);
end;


procedure SetServiceWin7();
  var
    svc : service;
  begin
    Application.HintHidePause := 100000;

    Svc.OfflineFiles(Form1.CB1);
    Svc.IPHelperSvc(Form1.CB2);
    Svc.PrintManager(Form1.CB3);
    Svc.SessionManager(Form1.CB4);
    Svc.SecureStorage(Form1.CB5);
    Svc.Server(Form1.CB6);
    Svc.TabletInputSvc(Form1.CB7);
    Svc.WinErrLogSvc(Form1.CB8);
    Svc.RemoteReg(Form1.CB9);
    Svc.Themes(Form1.CB10);
    Svc.SecurityCenter(Form1.CB11);


end;

procedure TForm1.ServiceCBClick(Sender: TObject);
  var
    i : integer;
    s : string;
  begin
    i := 0;

      begin
        for i:=1 to  ComponentCount - 1 do
          if (Components[i] is TCheckBox) then
            begin
              s := (Components[i] as TCheckBox).Name;
              Delete(s, 3, Length(s));
              if s = 'CB' then
                begin
                  if ServiceCB.Checked then (Components[i] as TCheckBox).Enabled := True
                    else (Components[i] as TCheckBox).Enabled := False;
                end;
            end;
      end;
  end;

procedure TForm1.FormCreate(Sender: TObject);
  var
    os : integer;
  begin
    os := OSVersion();

    case os of
      1 : SetServiceWin10;
      2 : SetServiceWin8;
      3 : SetServiceWin7;
    end;
  end;


procedure EmptyRecycleBin;    // http://www.kansoftware.ru/?tid=1510
 const
   SHERB_NOCONFIRMATION = $00000001;
   SHERB_NOPROGRESSUI = $00000002;
   SHERB_NOSOUND = $00000004;
 type
   TSHEmptyRecycleBin = function(Wnd: HWND;
                                 pszRootPath: PChar;
                                 dwFlags: DWORD): HRESULT;  stdcall;
 var
   SHEmptyRecycleBin: TSHEmptyRecycleBin;
   LibHandle: THandle;
 begin  { EmptyRecycleBin }
   LibHandle := LoadLibrary(PChar('Shell32.dll'));
   if LibHandle <> 0 then @SHEmptyRecycleBin :=
       GetProcAddress(LibHandle, 'SHEmptyRecycleBinA')
   else
   begin
     MessageDlg('Failed to load Shell32.dll.', mtError, [mbOK], 0);
     Exit;
   end;

   if @SHEmptyRecycleBin <> nil then
     SHEmptyRecycleBin(Application.Handle,
                       nil,
                       SHERB_NOCONFIRMATION or SHERB_NOPROGRESSUI or SHERB_NOSOUND);
   FreeLibrary(LibHandle); @SHEmptyRecycleBin := nil;
 end;

procedure move(codekey : integer; n : integer);
  var
    i : integer;
  begin
    for i:=1 to n do
      begin
        keybd_event(codekey, 0, 0, 0);
        keybd_event(codekey, 0, KEYEVENTF_KEYUP, 0);
      end;
    keybd_event(VK_RETURN, 0, 0, 0);
    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
  end;

procedure ServiceEditWin10();
 var Reg: TRegistry;
  begin
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_LOCAL_MACHINE;
  ///////////////FASTOFF//////////////////////



    if Form1.CB1.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\WbioSrvc', false);
          Reg.WriteInteger('Start', 4);
        end
      else  //�������������� ������ Windows
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\WbioSrvc', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB2.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\MpsSvc', false);
          Reg.WriteInteger('Start', 4);
        end
      else  //����������
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\MpsSvc', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB3.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\iphlpsvc', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //��������������� ������ IP
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\iphlpsvc', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB4.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Spooler', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //��������� ������
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\Spooler', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB5.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\MapsBroker', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //��������� ��������� ����
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\MapsBroker', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB6.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\XboxNetApiSvc', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //������� ������ Xbox Live
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\XboxNetApiSvc', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB7.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\DiagTrack', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //������ ���������������� ������������
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\DiagTrack', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB8.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\WinDefend', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //������ ��������� Windows
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\WinDefend', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    if Form1.CB9.Checked
      then
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\DPS', false);
          Reg.WriteInteger('Start', 4);
        end
      else   //������ �������� �����������
        begin
          Reg.OpenKey('SYSTEM\CurrentControlSet\Services\DPS', false);
          Reg.WriteInteger('Start', 2);
        end;
        Reg.CloseKey;

    Reg.Free;




 end;





  procedure ClearFolder(way:string);
  var
    iIndex: Integer;
    SearchRec: TSearchRec;
    sFileName: string;
  begin
    way := way + '\*.*';
    iIndex := FindFirst(way, faAnyFile, SearchRec);
      while iIndex = 0 do
        begin
          sFileName := ExtractFileDir(way)+'\'+SearchRec.name;
            if SearchRec.Attr = faDirectory
              then
                begin
                  if (SearchRec.name <> '' ) and (SearchRec.name <> '.') and
                   (SearchRec.name <> '..')
                   then TDirectory.Delete(sFileName, True);
                end
          else
            begin
              if SearchRec.Attr <> faArchive
                then FileSetAttr(sFileName, faArchive);
              DeleteFile(sFileName);
            end;
          iIndex := FindNext(SearchRec);
        end;
    FindClose(SearchRec);
  end;



  function DelAll(sDir : string) : Boolean;
var
k :integer;
  iIndex: Integer;
  SearchRec: TSearchRec;
  sFileName: string;
begin
  Result := False;
  sDir := sDir + '\*.*';
  iIndex := FindFirst(sDir, faAnyFile, SearchRec);

  while iIndex = 0 do
  begin
    sFileName := ExtractFileDir(sDir)+'\'+SearchRec.name;
    if SearchRec.Attr = faDirectory then
    begin
      if (SearchRec.name <> '' ) and (SearchRec.name <> '.') and
      (SearchRec.name <> '..') then
        DelAll(sFileName);
    end
    else
    begin
      if SearchRec.Attr <> faArchive then
        FileSetAttr(sFileName, faArchive);


      if not DeleteFile(sFileName) then
        k := 0;
    end;
    iIndex := FindNext(SearchRec);
  end;

  FindClose(SearchRec);
  RemoveDir(ExtractFileDir(sDir));
  Result := True;
end;


 function GetUserName():string;
  var
    Name: string;
    UserName: array[0..255] of Char;
    UserNameSize: DWORD;
  begin
    UserNameSize := 255;
      if Windows.GetUserName(@UserName, UserNameSize)
        then result := string(UserName)
      else
        result := '%UserName%';
  end;


 procedure CleanBrowsCache();
    //C:\Users\%UserName%\AppData\Roaming
    //http://www.programmersforum.ru/showthread.php?t=156981
    //C:\Users\Admin\AppData\Local\Yandex\YandexBrowser\User Data\Default\Cache
  var
    way, UserName: string;
    tsr : TSearchRec;
  begin
    UserName := GetUserName;
    way := 'C:\Users\' + UserName + '\AppData\Local\';

    //Yandex Browser
    ClearFolder(way + 'Yandex\YandexBrowser\User Data\Default\Cache');

    //Google Chrome
    ClearFolder(way + 'Google\Chrome\User Data\Default\Cache');

    //Opera Browser
    ClearFolder(way + 'Opera Software\Opera Stable\Cache');

    //Mozilla Firefox
    if FindFirst(way + 'Mozilla\Firefox\Profiles\*.*', faAnyFile, tsr) = 0 then
      begin
        repeat
          ClearFolder(way + 'Mozilla\Firefox\Profiles\' + tsr.name + '\cache2');
        until FindNext(tsr) <> 0;
          FindClose(tsr);
      end;

    //Microsoft Edge
    ClearFolder(way + 'Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\LocalCache');
    ClearFolder(way + 'Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\LocalState');
 end;


procedure CleanTempFiles();
  var
    UserName: string;
  begin
    UserName := GetUserName;
    ClearFolder('C:\Windows\Temp');
    ClearFolder('C:\Users\' + UserName + '\AppData\Local\Temp');
end;

procedure CleanDownloads();
  var
    UserName: string;
  begin
    UserName := GetUserName;
    ClearFolder('C:\Users\' + UserName + '\downloads');
  end;


function FreeDisk(): real;
var
    FreeBytesAvailableToCaller: TLargeInteger;
    FreeSize: TLargeInteger;
    TotalSize: TLargeInteger;
  begin
    GetDiskFreeSpaceEx('c:',
    FreeBytesAvailableToCaller,
    Totalsize,
    @FreeSize);
    result := FreeSize/(1024*1024);
  end;















 procedure TForm1.VE_CBClick(Sender: TObject);
  begin
    if VE_CB.Checked then
      begin
        onVE_CB.Enabled := True;
        offVE_CB.Enabled := True;

      end
    else
      begin
        onVE_CB.Enabled := False;
        offVE_CB.Enabled := False;
      end;
  end;

procedure TForm1.onVE_CBClick(Sender: TObject);
  begin
    if onVE_CB.Checked then offVE_CB.Checked := False
      else if (not offVE_CB.Checked) and (not onVE_CB.Checked) then
      begin
        VE_CB.Checked := False;
        offVE_CB.Checked := True;
      end;
  end;

procedure TForm1.offVE_CBClick(Sender: TObject);
  begin
    if offVE_CB.Checked then onVE_CB.Checked := False
      else if (not offVE_CB.Checked) and (not onVE_CB.Checked) then
         begin
        VE_CB.Checked := False;
        offVE_CB.Checked := True;
      end;
  end;



procedure TForm1.MainScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  begin
    if (WheelDelta > 0)
      then  MainScrollBox.VertScrollBar.Position:= MainScrollBox.VertScrollBar.Position-8
        else
          MainScrollBox.VertScrollBar.Position:= MainScrollBox.VertScrollBar.Position+8;
  end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
 var
    tmp : real;
  begin
    Label3.Caption := '��������� . . .';


    tmp := FreeDisk;

    if (CacheCB.Checked = True)
      then CleanBrowsCache();
    if (TmpFilesCB.Checked = True)
      then CleanTempFiles();
    if (DownloadsCB.Checked = True)
      then CleanDownloads();
    if (RecycleBinCB.Checked = True)
      then EmptyRecycleBin();

    Label3.Caption := ' ';
    Label2.Caption := '���� �������: ' + FloatToStr (roundto((FreeDisk - tmp), -2)) + ' �����' ;


end;

































procedure VE_switch();
  var
    Reg: TRegistry;
    s : integer;
    one : dword;
  begin
    if  (Form1.VE_CB.Checked = False) then Exit;

    Reg := TRegIniFile.Create;

  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects', false);
    s := reg.ReadInteger('VisualFXSetting');

    if (Form1.offVE_CB.Checked) and (s = 2) then Exit;
    if (Form1.onVE_CB.Checked) and (s = 1) then Exit;

    ShellExecute(Form1.Handle, 'open','c:\Windows\system32\SystemPropertiesPerformance.exe', nil, nil, SW_SHOWNORMAL);
        Sleep(1000);
    if Form1.offVE_CB.Checked
      then
        case s of
          0: move(40,2);
          1: move(40,1);
          3: move(38,1);
        end
      else
        case s of
          0: move(40,1);
          2: move(38,1);
          3: move(38,2);
        end;
 end;

 procedure cbchek();
  var
    Svc : Service;
  begin

      if (Form1.ServiceCB.checked = False) then Exit;

    if Form1.CB1.Checked then Svc.BiomWinSvc(0)
      else Svc.BiomWinSvc(1);
    if Form1.CB2.Checked then Svc.Firewall(0)
      else Svc.Firewall(1);
    if Form1.CB3.Checked then Svc.IPHelperSvc(0)
      else Svc.IPHelperSvc(1);
    if Form1.CB4.Checked then Svc.PrintManager(0)
      else Svc.PrintManager(1);
    if Form1.CB5.Checked then Svc.DowMapManager(0)
      else Svc.DowMapManager(1);
    if Form1.CB6.Checked then Svc.XboxLiveNet(0)
      else Svc.XboxLiveNet(1);
    if Form1.CB7.Checked then Svc.DiagTrackSvc(0)
      else Svc.DiagTrackSvc(1);
    if Form1.CB8.Checked then Svc.ProgCompatbltyAssistSvc(0)
      else Svc.ProgCompatbltyAssistSvc(1);
    if Form1.CB9.Checked then Svc.WinErrLogSvc(0)
      else Svc.WinErrLogSvc(1);
    if Form1.CB10.Checked then Svc.BitLockDrvEncryptSvc(0)
      else Svc.BitLockDrvEncryptSvc(1);
    if Form1.CB11.Checked then Svc.RemoteReg(0)
      else Svc.RemoteReg(1);
    if Form1.CB12.Checked then Svc.SecurityCenter(0)
      else Svc.SecurityCenter(1);
    if Form1.CB13.Checked then Svc.Superfetch(0)
      else Svc.Superfetch(1);




  end;

 procedure TForm1.ApplyClick(Sender: TObject);
 begin
    VE_switch();
    cbchek();
 end;










procedure TForm1.ExitBtnClick(Sender: TObject);
  begin
    Form1.Close;
  end;

end.

