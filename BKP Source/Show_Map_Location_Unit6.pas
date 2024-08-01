unit Show_Map_Location_Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus;

type
  TShow_Location_Max = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Close1: TMenuItem;
    procedure Close1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Show_Location_Max: TShow_Location_Max;

implementation

{$R *.dfm}

procedure TShow_Location_Max.Close1Click(Sender: TObject);
begin
Show_location_max.Visible:=false;
end;

end.
