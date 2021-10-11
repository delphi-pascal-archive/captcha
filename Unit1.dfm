object Form1: TForm1
  Left = 227
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Captcha'
  ClientHeight = 145
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Image1: TImage
    Left = 10
    Top = 46
    Width = 172
    Height = 65
  end
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 195
    Height = 17
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1089' '#1082#1072#1088#1090#1080#1085#1082#1080':'
  end
  object lerr: TLabel
    Left = 55
    Top = 119
    Width = 107
    Height = 18
    Caption = #1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object MaskEdit1: TMaskEdit
    Left = 190
    Top = 52
    Width = 158
    Height = 44
    EditMask = '999999;1;~'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -42
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    MaxLength = 6
    ParentFont = False
    TabOrder = 0
    Text = '      '
  end
  object Button1: TButton
    Left = 249
    Top = 114
    Width = 98
    Height = 26
    Caption = #1054#1050
    TabOrder = 1
    OnClick = Button1Click
  end
end
