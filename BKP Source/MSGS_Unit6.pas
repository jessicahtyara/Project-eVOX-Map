unit MSGS_Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TMSGS = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSGS: TMSGS;

implementation

{$R *.dfm}

uses Main;

procedure TMSGS.Timer1Timer(Sender: TObject);
begin
Progressbar1.Position:=Progressbar1.Position+1;
if progressbar1.Position = progressbar1.Max then begin

  Main_form.image2.visible:=false;
  timer1.Enabled:=false;
  progressbar1.Position:=progressbar1.Min;
end;
end;

end.
