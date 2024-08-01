unit Atalho_Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TMain_Menu = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Menu: TMain_Menu;

implementation

{$R *.dfm}

uses Vmap_Unit1;

procedure TMain_Menu.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
PostMessage (Main_Menu.Handle, WM_SYSCOMMAND, $F012, 0) ;
end;

procedure TMain_Menu.Image2Click(Sender: TObject);
begin
VMap.show;
Main_Menu.Visible:=false;
end;

end.
