unit UResponsavel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, Buttons, DBClient, SimpleDS, DB, SqlExpr,
  Mask, DBCtrls,
  jpeg, ExtCtrls;

type
  TResponsavel = class(TForm)
    DataSource1: TDataSource;
    sqlAux: TSQLQuery;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    sdsAuxx: TSimpleDataSet;
    aux: TDataSource;
    Image1: TImage;
    Baixo: TPanel;
    btnEditar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    LadoEsquerdo: TPanel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Idoso: TGroupBox;
    Label7: TLabel;
    edtPesquisa: TEdit;
    Name: TDBEdit;
    BitBtn1: TBitBtn;
    Cod: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    pesquisa: TEdit;
    cel: TDBEdit;
    fone: TDBEdit;
    nomes: TDBEdit;
    dspesquisa: TDataSource;
    sdspesquisa: TSimpleDataSet;
    sdspesquisaCOD_LIGACOES: TIntegerField;
    sdspesquisaCOD_IDOSO: TIntegerField;
    sdspesquisaNOME: TStringField;
    sdspesquisaNOMER: TStringField;
    sdspesquisaTELEFONE: TStringField;
    sdspesquisaCELULAR: TStringField;
    Label18: TLabel;
    Label9: TLabel;
    procedure edtPesquisaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure pesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Responsavel: TResponsavel;

implementation

uses UModulo;

{$R *.dfm}

procedure TResponsavel.edtPesquisaChange(Sender: TObject);
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

procedure TResponsavel.BitBtn1Click(Sender: TObject);
begin
DBEdit2.Text := Cod.Text;
DBEdit3.Text := Name.Text;
end;

procedure TResponsavel.FormCreate(Sender: TObject);
begin
if DBEdit1.Text = ''
Then Begin
      //btnEditar.Enabled := False;
      End
      Else Begin
      //btnEditar.Enabled := True;;
      End;
end;

procedure TResponsavel.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          Idoso.Enabled := True;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          //DBEdit2.Enabled       := True;
          DBEdit6.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          btnGravar.Enabled      := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_LIGACOES) AS ULTIMO FROM LIGACOES');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsLigacoes.Insert;
           Modulo.cdsLigacoesCOD_LIGACOES.Value := NReg;


           DBEdit4.SetFocus;

end;

procedure TResponsavel.btnEditarClick(Sender: TObject);
begin
Modulo.cdsLigacoes.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;
          Idoso.Enabled       := True;

          btnGravar.Enabled      := True;
end;

procedure TResponsavel.btnGravarClick(Sender: TObject);
begin
Modulo.cdsLigacoes.Post;

         Modulo.cdsLigacoes.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TResponsavel.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsLigacoes.Cancel;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;
          DBEdit6.Enabled       := False;
          Idoso.Enabled       := False;

          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TResponsavel.btnDeletarClick(Sender: TObject);
begin
IF (DBEdit1.Text = '')
then
begin
   MessageDlg ('Não a registros no banco',
                       mtWarning,
                       [mbyes,mbno],
                       0)
end
else
begin
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;
          DBEdit6.Enabled       := False;
          Idoso.Enabled       := False;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsLigacoes.Delete;
                         Modulo.cdsLigacoes.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TResponsavel.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsLigacoes.Prior;
end;

procedure TResponsavel.DireitaClick(Sender: TObject);
begin
Modulo.cdsLigacoes.Next;
end;

procedure TResponsavel.pesquisaChange(Sender: TObject);
var Texto, TSQL, Parametro : String;
 begin
      sdspesquisa.Close;

      TSQL := 'select * from LIGACOES ';
      nomes.Visible := false;
      cel.Visible := false;
      fone.Visible := false;

      If pesquisa.Text = ''
      Then Begin
      Texto := TSQL;
      sdspesquisa.DataSet.CommandText := Texto;
      nomes.Visible := false;
      cel.Visible := false;
      fone.Visible := false;
      End
      Else Begin
      nomes.Visible := true;
      cel.Visible := true;
      fone.Visible := true;
      Texto := TSQL + ' WHERE NOME LIKE :PROCURE ' ;
      sdspesquisa.DataSet.CommandText := Texto;
      Parametro := pesquisa.Text + '%';
      sdspesquisa.DataSet.Params.ParamByName('PROCURE').AsString := Parametro;

      End;
      sdspesquisa.Open;
      //DBEdit2.Text := Cod.Text;
      //DBEdit3.Text := Name.Text;
      exit;

end;

end.
