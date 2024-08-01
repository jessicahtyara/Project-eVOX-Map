object Configs: TConfigs
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Configs'
  ClientHeight = 372
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 372
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 320
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object TrackBar1: TTrackBar
      Left = 1
      Top = 326
      Width = 825
      Height = 45
      Align = alBottom
      Max = 255
      TabOrder = 0
      OnChange = TrackBar1Change
      ExplicitLeft = 136
      ExplicitTop = 296
      ExplicitWidth = 150
    end
    object CheckBox1: TCheckBox
      Left = 11
      Top = 16
      Width = 75
      Height = 17
      Caption = 'Click ON'
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 11
      Top = 39
      Width = 75
      Height = 17
      Caption = 'Click OFF'
      TabOrder = 2
    end
    object Button1: TButton
      Left = 11
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Click Set'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Panel2: TPanel
      Left = 1
      Top = 103
      Width = 825
      Height = 223
      Align = alBottom
      TabOrder = 4
      ExplicitLeft = 0
      object Label1: TLabel
        Left = 10
        Top = 194
        Width = 92
        Height = 16
        Caption = 'Transpar'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 15
        Top = 10
        Width = 77
        Height = 16
        Caption = 'Set Position'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 63
        Width = 30
        Height = 16
        Caption = 'Main'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 111
        Width = 36
        Height = 16
        Caption = 'VMap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 15
        Top = 32
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 0
        TextHint = 'width'
      end
      object Edit2: TEdit
        Left = 91
        Top = 32
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 1
        TextHint = 'height'
      end
      object Edit3: TEdit
        Left = 167
        Top = 32
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 2
        TextHint = 'top'
      end
      object Edit4: TEdit
        Left = 243
        Top = 32
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 3
        TextHint = 'left'
      end
      object Edit6: TEdit
        Left = 91
        Top = 85
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 4
        TextHint = 'height'
      end
      object Edit8: TEdit
        Left = 243
        Top = 85
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 5
        TextHint = 'left'
      end
      object Edit7: TEdit
        Left = 167
        Top = 85
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 6
        TextHint = 'top'
      end
      object Edit5: TEdit
        Left = 15
        Top = 85
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 7
        TextHint = 'width'
      end
      object Edit9: TEdit
        Left = 15
        Top = 133
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 8
        TextHint = 'width'
      end
      object Edit10: TEdit
        Left = 91
        Top = 133
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 9
        TextHint = 'height'
      end
      object Edit11: TEdit
        Left = 167
        Top = 133
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 10
        TextHint = 'top'
      end
      object Edit12: TEdit
        Left = 243
        Top = 133
        Width = 70
        Height = 21
        Alignment = taCenter
        TabOrder = 11
        TextHint = 'left'
      end
    end
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 385
    Top = 151
  end
end
