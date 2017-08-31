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
    Contato: TMemo;
    SMTP: TMemo;
    URL: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    requisitos: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
SMTP.Visible := false;
URL.Visible := false;
requisitos.Visible := false;
end;

procedure TSuporte.BitBtn2Click(Sender: TObject);
begin
Contato.Visible := true;
Como.Visible := false;
SMTP.Visible := false;
URL.Visible := false;
requisitos.Visible := false;
end;

procedure TSuporte.BitBtn3Click(Sender: TObject);
begin
SMTP.Visible := true;
Url.Text := 'https://support.google.com/a/answer/176600?hl=pt-BR';
URL.Visible := true;
Como.Visible := false;
Contato.Visible := false;
requisitos.Visible := false;
end;

procedure TSuporte.BitBtn4Click(Sender: TObject);
begin
requisitos.Visible := true;
Como.Visible := false;
Contato.Visible := false;
SMTP.Visible := false;
URL.Visible := false;
end;

procedure TSuporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
Suporte := Nil;
end;

end.
