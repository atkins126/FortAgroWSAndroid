object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ClientHeight = 389
  ClientWidth = 734
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object log: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 728
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = '...'
    Color = clBtnText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    WordWrap = True
    ExplicitWidth = 9
  end
  object mLog: TMemo
    Left = 0
    Top = 19
    Width = 734
    Height = 335
    Align = alClient
    Color = clInactiveCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 285
  end
  object Panel1: TPanel
    Left = 0
    Top = 354
    Width = 734
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 304
    object chkLogJson: TCheckBox
      Left = 624
      Top = 1
      Width = 109
      Height = 33
      Align = alRight
      Caption = 'View Log Json'
      TabOrder = 0
    end
  end
end