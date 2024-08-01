unit KeyHook;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Dialogs;

procedure SetHook;
procedure UnsetHook;

implementation

var
  Hook: HHOOK;

type
  PKBDLLHOOKSTRUCT = ^TKBDLLHOOKSTRUCT;
  TKBDLLHOOKSTRUCT = record
    vkCode: DWORD;
    scanCode: DWORD;
    flags: DWORD;
    time: DWORD;
    dwExtraInfo: ULONG_PTR;
  end;

function KeyboardProc(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  TargetForm: TForm;
begin
  if (nCode = HC_ACTION) and ((wParam = WM_KEYDOWN) or (wParam = WM_SYSKEYDOWN)) then
  begin
    case PKBDLLHOOKSTRUCT(lParam)^.vkCode of
      VK_F4:
        begin
          TargetForm := Application.FindComponent('Set_Location') as TForm;
          if Assigned(TargetForm) then
          begin
            TargetForm.Visible := True;
            TargetForm.BringToFront; // Traz o formulário para frente
            TargetForm.SetFocus;     // Define o foco no formulário
          end
          else
            ShowMessage('Formulário Set_Location não encontrado');
        end;
      VK_F5:
        begin
          TargetForm := Application.FindComponent('VMap') as TForm;
          if Assigned(TargetForm) then
          begin
            TargetForm.Visible := True;
            TargetForm.BringToFront; // Traz o formulário para frente
            TargetForm.SetFocus;     // Define o foco no formulário
          end
          else
            ShowMessage('Formulário VMap não encontrado');
        end;
      VK_F7:
        begin
          TargetForm := Application.FindComponent('Main_Menu') as TForm;
          if Assigned(TargetForm) then
          begin
            TargetForm.Visible := True;
            TargetForm.BringToFront; // Traz o formulário para frente
            TargetForm.SetFocus;     // Define o foco no formulário
          end
          else
            ShowMessage('Formulário Main_Menu não encontrado');
        end;
    end;
  end;
  Result := CallNextHookEx(Hook, nCode, wParam, lParam);
end;

procedure SetHook;
begin
  Hook := SetWindowsHookEx(WH_KEYBOARD_LL, @KeyboardProc, GetModuleHandle(nil), 0);
  if Hook = 0 then
    RaiseLastOSError;
end;

procedure UnsetHook;
begin
  if Hook <> 0 then
  begin
    UnhookWindowsHookEx(Hook);
    Hook := 0;
  end;
end;

end.

