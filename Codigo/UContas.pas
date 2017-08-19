unit UContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, Mask, FMTBcd, DB, SqlExpr,
  jpeg, ExtCtrls;

type
  TContas = class(TForm)
    sqlAux: TSQLQuery;
    Baixo: TPanel;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    Label7: TLabel;
    OQue: TMemo;
    Image1: TImage;
    LadoEsquerdo: TPanel;
    SQLQuery1: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Contas: TContas;

implementation

uses UModulo;

{$R *.dfm}

end.
