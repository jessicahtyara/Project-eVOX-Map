program OnceHumanMap;

uses
  Vcl.Forms,
  Main in 'O:\Programa\Main.pas' {Main_Form},
  Vcl.Themes,
  Vcl.Styles,
  Vmap_Unit1 in 'O:\Programa\Vmap_Unit1.pas' {VMap},
  Set_Location_Unit2 in 'O:\Programa\Set_Location_Unit2.pas' {Set_Location},
  Ranking_Unit3 in 'Ranking_Unit3.pas' {Ranking},
  Atalho_Unit4 in 'Atalho_Unit4.pas' {Main_Menu},
  Web_Map_Unit5 in 'Web_Map_Unit5.pas' {Web_Map},
  Configs_Unit7 in 'Configs_Unit7.pas' {Configs},
  KeyHook in 'KeyHook.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TVMap, VMap);
  Application.CreateForm(TSet_Location, Set_Location);
  Application.CreateForm(TRanking, Ranking);
  Application.CreateForm(TMain_Menu, Main_Menu);
  Application.CreateForm(TWeb_Map, Web_Map);
  Application.CreateForm(TConfigs, Configs);
  Application.Run;
end.
