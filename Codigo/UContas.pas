unit UContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, Mask, FMTBcd, DB, SqlExpr,
  jpeg, ExtCtrls,
  DBClient, SimpleDS,
  QuickRpt, QRCtrls;

type
  TTermor = class(TForm)
    Image1: TImage;
    LadoEsquerdo: TPanel;
    sqlAux: TSQLQuery;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    sdsAuxCOD_IDOSO: TIntegerField;
    sdsAuxNOME: TStringField;
    DataSaida: TMaskEdit;
    Label3: TLabel;
    HoraSaida: TMaskEdit;
    Label4: TLabel;
    DataChegada: TMaskEdit;
    Label9: TLabel;
    HoraChegada: TMaskEdit;
    Label10: TLabel;
    BitBtn2: TBitBtn;
    NomeResponsavel: TEdit;
    NomeResidente: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Idoso: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edtPesquisa: TEdit;
    Name: TDBEdit;
    BitBtn1: TBitBtn;
    Termo: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    SummaryBand1: TQRBand;
    Label5: TLabel;
    cpf: TMaskEdit;
    rg: TMaskEdit;
    Label6: TLabel;
    PageHeaderBand1: TQRBand;
    Corpo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Corpo2: TQRLabel;
    procedure edtPesquisaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Termor: TTermor;

implementation

uses UModulo;

{$R *.dfm}

procedure TTermor.edtPesquisaChange(Sender: TObject);

var Texto, TSQL, Parametro : String;
 begin
      sdsAux.Close;

      TSQL := 'select COD_IDOSO ,NOME from RESIDENTE ';
      If edtPesquisa.Text = ''
      Then Begin
      Texto := TSQL;
      sdsAux.DataSet.CommandText := Texto;
      End
      Else Begin
      Texto := TSQL + ' WHERE NOME LIKE :PROCURE ' ;
      sdsAux.DataSet.CommandText := Texto;
      Parametro := edtPesquisa.Text + '%';
      sdsAux.DataSet.Params.ParamByName('PROCURE').AsString := Parametro;

      End;
      sdsAux.Open;
      //DBEdit2.Text := Cod.Text;
      //DBEdit3.Text := Name.Text;
      exit;
end;

procedure TTermor.BitBtn1Click(Sender: TObject);
begin
NomeResidente.Text := Name.Text;
end;

procedure TTermor.BitBtn2Click(Sender: TObject);
var
NomeRes, NomeResi, DataS, HoraS, DataC, HoraC : String;
begin
NomeRes := NomeResponsavel.text;
NomeResi := NomeResidente.Text;
DataS := DataSaida.Text;
HoraS := HoraSaida.Text;
DataC := DataChegada.Text;
HoraC := HoraChegada.Text;

Corpo.Caption :=
'Eu '+NomeRes+' inscrito(a) no CPF sob o nº '+cpf.Text+' e no RG nº '+rg.Text+','+#13+'por meio deste instrumento declaro me responsabilizar pelo bem estar de, '+NomeResi+','+#13+
'de responsabilidade da Casa de Repouso jardin das Flores,'+#13+'pelo(s) dias apartir de '+DataS+' hora :'+Horas+ 'h, até '+DataC+' hora: '+HoraC+'h.'+
''+#13+#13+
'Me comprometo a devolver o mesmo bem como foi me entregue , ao fim do prazo estabelecido.'+
''+#13+#13+#13+#13+
''+'Responsavel '+NomeRes
+''+#13+#13+
'________________________'+
''+#13+#13+#13+

'Responsável pela Instituição'+
''+#13+#13+
'________________________';
Corpo2.Caption := Corpo.Caption;

Termo.Preview;

end;

end.
