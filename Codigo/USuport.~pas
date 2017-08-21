unit USuport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons;

type
  TSuporte = class(TForm)
    Image1: TImage;
    Baixo: TPanel;
    Como: TMemo;
    BitBtn1: TBitBtn;
    Contato: TMemo;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Suporte: TSuporte;

implementation

{$R *.dfm}

procedure TSuporte.BitBtn1Click(Sender: TObject);
begin
Como.Visible := true;
Contato.Visible := false;
end;

procedure TSuporte.BitBtn2Click(Sender: TObject);
begin
Contato.Visible := true;
Como.Visible := false;
end;

end.
