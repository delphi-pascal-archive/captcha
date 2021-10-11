unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    lerr: TLabel;
    procedure Captcha(Code : Integer);
    procedure FormCreate(Sender: TObject);
    procedure SetCaptcha;
    function TestCaptcha(C : String) : Boolean;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CurCod : Integer;
implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if TestCaptcha(MaskEdit1.Text) then Halt
                                 else lerr.Show;
end;

procedure TForm1.Captcha(Code: Integer);
const lines = 6;
var x,y,g : integer;
    str   : string;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Brush.Style := bsSolid;
  Image1.Canvas.FillRect(Image1.Canvas.ClipRect);
  if (Code < 99999) or (Code > 1000000) then Image1.Canvas.TextOut(4,4,'INVALID CODE');
  for x := 0 to Image1.Width - 1 do
    for y := 0 to Image1.Height - 1 do
      if Random(1000) mod 2 = 0 then begin
        g := Random(100)+100;
        Image1.Canvas.Pixels[x,y] := rgb(g,g,g);
      end;
  Image1.Canvas.Brush.Style := bsClear;
  for x := 1 to 6 do begin
    g := Random(100)+100;
    case Random(3) of
      0 : Image1.Canvas.Font.Color := rgb(g,0,0);
      1 : Image1.Canvas.Font.Color := rgb(0,g,0);
      2 : Image1.Canvas.Font.Color := rgb(0,0,g);
    end;
    case random(2) of
      0 : Image1.Canvas.Font.Style := [fsBold];
      1 : Image1.Canvas.Font.Style := [];
    end;
    Image1.Canvas.Font.Size := 15 + Random(6);
    Image1.Canvas.TextOut((x-1)*15+10, random(image1.Height-Image1.Canvas.TextHeight('1')), IntToStr(Code)[x]);
  end;
  Image1.Canvas.Pen.Color := clBlack;
  for x := 0 to lines - 1 do begin
    Image1.Canvas.MoveTo(0, Random(Image1.Height));
    Image1.Canvas.LineTo(Image1.Width, Random(Image1.Height));
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
  SetCaptcha;
end;

procedure TForm1.SetCaptcha;
begin
  CurCod := Random(899999) + 100000;
  Captcha(CurCod);
end;

function TForm1.TestCaptcha(C: String): Boolean;
begin
  Result := IntToStr(CurCod) = C;
end;

end.
