unit Configs_Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, IniFiles;

type
  TConfigs = class(TForm)
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Timer1: TTimer;
    Edit6: TEdit;
    Label3: TLabel;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FTransparentClickEnabled: Boolean;
    procedure UpdateCheckBoxes;
    procedure SaveSettings;
    procedure LoadSettings;
    procedure CheckAndSave(Edit: TEdit; Section, Ident: string; var PreviousValue: Integer);
  public
    { Public declarations }
  end;

var
  Configs: TConfigs;
  PreviousValues: array[1..12] of Integer;

implementation

{$R *.dfm}

uses
  Main, Set_Location_Unit2, Vmap_Unit1;

procedure TConfigs.Button1Click(Sender: TObject);
begin
  // Alterna o estado de transparência de clique do formulário Main_Form
  FTransparentClickEnabled := not FTransparentClickEnabled;

  if FTransparentClickEnabled then
  begin
    // Permite que cliques do mouse atravessem o formulário Main_Form
    SetWindowLong(Main_Form.Handle, GWL_EXSTYLE, GetWindowLong(Main_Form.Handle, GWL_EXSTYLE) or WS_EX_TRANSPARENT);
  end
  else
  begin
    // Remove a transparência de clique do formulário Main_Form
    SetWindowLong(Main_Form.Handle, GWL_EXSTYLE, GetWindowLong(Main_Form.Handle, GWL_EXSTYLE) and not WS_EX_TRANSPARENT);
  end;

  UpdateCheckBoxes;
end;

procedure TConfigs.Button2Click(Sender: TObject);
begin
  SaveSettings;
end;

procedure TConfigs.Button3Click(Sender: TObject);
begin
  LoadSettings;
end;

procedure TConfigs.CheckAndSave(Edit: TEdit; Section, Ident: string; var PreviousValue: Integer);
var
  NewValue: Integer;
  Ini: TIniFile;
begin
  NewValue := StrToIntDef(Edit.Text, 0);
  if NewValue <> PreviousValue then
  begin
    PreviousValue := NewValue;
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
    try
      Ini.WriteInteger(Section, Ident, NewValue);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TConfigs.EditChange(Sender: TObject);
begin
  CheckAndSave(Edit1, 'Set_Location', 'Width', PreviousValues[1]);
  CheckAndSave(Edit2, 'Set_Location', 'Height', PreviousValues[2]);
  CheckAndSave(Edit3, 'Set_Location', 'Top', PreviousValues[3]);
  CheckAndSave(Edit4, 'Set_Location', 'Left', PreviousValues[4]);

  CheckAndSave(Edit5, 'Main_Form', 'Width', PreviousValues[5]);
  CheckAndSave(Edit6, 'Main_Form', 'Height', PreviousValues[6]);
  CheckAndSave(Edit7, 'Main_Form', 'Top', PreviousValues[7]);
  CheckAndSave(Edit8, 'Main_Form', 'Left', PreviousValues[8]);

  CheckAndSave(Edit9, 'VMap', 'Width', PreviousValues[9]);
  CheckAndSave(Edit10, 'VMap', 'Height', PreviousValues[10]);
  CheckAndSave(Edit11, 'VMap', 'Top', PreviousValues[11]);
  CheckAndSave(Edit12, 'VMap', 'Left', PreviousValues[12]);
end;

procedure TConfigs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TConfigs.FormCreate(Sender: TObject);
begin
  LoadSettings;
  // Inicializa os valores anteriores
  PreviousValues[1] := StrToIntDef(Edit1.Text, 0);
  PreviousValues[2] := StrToIntDef(Edit2.Text, 0);
  PreviousValues[3] := StrToIntDef(Edit3.Text, 0);
  PreviousValues[4] := StrToIntDef(Edit4.Text, 0);
  PreviousValues[5] := StrToIntDef(Edit5.Text, 0);
  PreviousValues[6] := StrToIntDef(Edit6.Text, 0);
  PreviousValues[7] := StrToIntDef(Edit7.Text, 0);
  PreviousValues[8] := StrToIntDef(Edit8.Text, 0);
  PreviousValues[9] := StrToIntDef(Edit9.Text, 0);
  PreviousValues[10] := StrToIntDef(Edit10.Text, 0);
  PreviousValues[11] := StrToIntDef(Edit11.Text, 0);
  PreviousValues[12] := StrToIntDef(Edit12.Text, 0);
end;

procedure TConfigs.LoadSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    // Carrega as configurações do Set_Location
    Set_Location.Width := Ini.ReadInteger('Set_Location', 'Width', Set_Location.Width);
    Set_Location.Height := Ini.ReadInteger('Set_Location', 'Height', Set_Location.Height);
    Set_Location.Top := Ini.ReadInteger('Set_Location', 'Top', Set_Location.Top);
    Set_Location.Left := Ini.ReadInteger('Set_Location', 'Left', Set_Location.Left);

    // Carrega as configurações do Main_Form
    Main_Form.Width := Ini.ReadInteger('Main_Form', 'Width', Main_Form.Width);
    Main_Form.Height := Ini.ReadInteger('Main_Form', 'Height', Main_Form.Height);
    Main_Form.Top := Ini.ReadInteger('Main_Form', 'Top', Main_Form.Top);
    Main_Form.Left := Ini.ReadInteger('Main_Form', 'Left', Main_Form.Left);

    // Carrega as configurações do VMap
    VMap.Width := Ini.ReadInteger('VMap', 'Width', VMap.Width);
    VMap.Height := Ini.ReadInteger('VMap', 'Height', VMap.Height);
    VMap.Top := Ini.ReadInteger('VMap', 'Top', VMap.Top);
    VMap.Left := Ini.ReadInteger('VMap', 'Left', VMap.Left);
  finally
    Ini.Free;
  end;
end;

procedure TConfigs.SaveSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    // Salva as configurações do Set_Location
    Ini.WriteInteger('Set_Location', 'Width', Set_Location.Width);
    Ini.WriteInteger('Set_Location', 'Height', Set_Location.Height);
    Ini.WriteInteger('Set_Location', 'Top', Set_Location.Top);
    Ini.WriteInteger('Set_Location', 'Left', Set_Location.Left);

    // Salva as configurações do Main_Form
    Ini.WriteInteger('Main_Form', 'Width', Main_Form.Width);
    Ini.WriteInteger('Main_Form', 'Height', Main_Form.Height);
    Ini.WriteInteger('Main_Form', 'Top', Main_Form.Top);
    Ini.WriteInteger('Main_Form', 'Left', Main_Form.Left);

    // Salva as configurações do VMap
    Ini.WriteInteger('VMap', 'Width', VMap.Width);
    Ini.WriteInteger('VMap', 'Height', VMap.Height);
    Ini.WriteInteger('VMap', 'Top', VMap.Top);
    Ini.WriteInteger('VMap', 'Left', VMap.Left);
  finally
    Ini.Free;
  end;
end;

procedure TConfigs.Timer1Timer(Sender: TObject);
begin
  // Atualiza os Edits com as propriedades do Set_Location
  Edit1.Text := IntToStr(Set_Location.Width);
  Edit2.Text := IntToStr(Set_Location.Height);
  Edit3.Text := IntToStr(Set_Location.Top);
  Edit4.Text := IntToStr(Set_Location.Left);

  // Atualiza os Edits com as propriedades do Main_Form
  Edit5.Text := IntToStr(Main_Form.Width);
  Edit6.Text := IntToStr(Main_Form.Height);
  Edit7.Text := IntToStr(Main_Form.Top);
  Edit8.Text := IntToStr(Main_Form.Left);

  // Atualiza os Edits com as propriedades do VMap
  Edit9.Text := IntToStr(VMap.Width);
  Edit10.Text := IntToStr(VMap.Height);
  Edit11.Text := IntToStr(VMap.Top);
  Edit12.Text := IntToStr(VMap.Left);
end;

procedure TConfigs.TrackBar1Change(Sender: TObject);
var
  TransparencyValue: Integer;
begin
  // Calcula o valor da transparência em porcentagem
  TransparencyValue := 100 - TrackBar1.Position * 100 div 255;

  // Habilita a transparência do formulário Main_Form
  Main_Form.AlphaBlend := True;
  // Ajusta a transparência de acordo com o valor invertido do TrackBar
  Main_Form.AlphaBlendValue := 255 - TrackBar1.Position;

  // Atualiza o Caption do Label3 no Main_Form com o valor da transparência
  Main_Form.Label3.Caption := Format('Visibility: %d%%', [TransparencyValue]);
end;

procedure TConfigs.UpdateCheckBoxes;
begin
  CheckBox1.Checked := FTransparentClickEnabled; // Atualiza o CheckBox1 com o status
  CheckBox2.Checked := not FTransparentClickEnabled; // Atualiza o CheckBox2 com o status
end;


end.

