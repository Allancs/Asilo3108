unit UFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  jpeg, ExtCtrls,
  Buttons,
  FMTBcd, DB, SqlExpr,
  DBClient, SimpleDS;

type
  TFuncionario = class(TForm)
    Image1: TImage;
    Baixo: TPanel;
    Direita: TBitBtn;
    Esquerda: TBitBtn;
    btnInserir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    sqlAux: TSQLQuery;
    LadoEsquerdo: TPanel;
    ti: TLabel;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Estado: TComboBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Select: TComboBox;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Name: TDBEdit;
    edtPesquisa: TEdit;
    fone: TDBEdit;
    cel: TDBEdit;
    dsAux: TDataSource;
    sdsAux: TSimpleDataSet;
    sdsAuxCOD_FUN: TIntegerField;
    sdsAuxNOME: TStringField;
    sdsAuxSEXO: TStringField;
    sdsAuxDATANASCIMENTO: TStringField;
    sdsAuxIDADE: TStringField;
    sdsAuxFUNCAO: TStringField;
    sdsAuxSALARIO: TFMTBCDField;
    sdsAuxCPF: TStringField;
    sdsAuxRG: TStringField;
    sdsAuxCARTEIRATRABALHO: TStringField;
    sdsAuxCELULAR: TStringField;
    sdsAuxTELEFONE: TStringField;
    Label15: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure SelectChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EstadoClick(Sender: TObject);
    procedure SelectClick(Sender: TObject);
    procedure EstadoChange(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
   
  private
    { Private declarations }
  public
    Copia, DtaAtual, DataCopia : String;
Nasc : Integer;
  end;

var
  Funcionario: TFuncionario;

implementation

uses UModulo;

{$R *.dfm}

procedure TFuncionario.btnEditarClick(Sender: TObject);
begin
Modulo.cdsFun.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;
          Estado.Enabled := true;
          DBEdit2.Enabled       := True;
          Select.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;
          DBEdit7.Enabled       := True;
          DBEdit8.Enabled       := True;
          DBEdit9.Enabled       := True;
          DBEdit10.Enabled       := True;
          DBEdit11.Enabled       := True;
          DBEdit12.Enabled       := True;
          btnGravar.Enabled      := True;
end;

procedure TFuncionario.SelectChange(Sender: TObject);
begin
DBEdit3.Text := Select.Text;
end;

procedure TFuncionario.btnDeletarClick(Sender: TObject);
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
          DBEdit2.Enabled       := false;
          Select.Enabled        := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;
          DBEdit7.Enabled       := false;
          DBEdit8.Enabled       := false;
          DBEdit9.Enabled       := false;
          DBEdit10.Enabled      := false;
          DBEdit11.Enabled      := false;
          DBEdit12.Enabled      := false;
          Estado.Enabled        := false;


 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsAviso.Delete;
                         Modulo.cdsAviso.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TFuncionario.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsFun.Cancel;
          DBEdit2.Enabled       := false;
          Select.Enabled        := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;
          DBEdit7.Enabled       := false;
          DBEdit8.Enabled       := false;
          DBEdit9.Enabled       := false;
          DBEdit10.Enabled      := false;
          DBEdit11.Enabled      := false;
          DBEdit12.Enabled      := false;
          Estado.Enabled        := false;



          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;

          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TFuncionario.btnGravarClick(Sender: TObject);
begin
Modulo.cdsFun.Post;

         Modulo.cdsFun.ApplyUpdates(-1);

         btnCancelar.Click;
end;

procedure TFuncionario.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;


          DBEdit2.Enabled       := True;
          Select.Enabled        := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;
          DBEdit7.Enabled       := True;
          DBEdit8.Enabled       := True;
          DBEdit9.Enabled       := True;
          DBEdit10.Enabled      := True;
          DBEdit11.Enabled      := True;
          DBEdit12.Enabled      := True;
          Estado.Enabled        := true;
          btnGravar.Enabled     := True;



          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_FUN) AS ULTIMO FROM FUNCIONARIO ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdsFun.Insert;


           Modulo.cdsFunCOD_FUN.Value := NReg;


           DBEdit2.SetFocus;
end;

procedure TFuncionario.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsFun.Prior;
DBEdit3.Text := Select.Text;
Estado.Text := (copy(DBEdit10.Text, 13,15));
end;

procedure TFuncionario.DireitaClick(Sender: TObject);
begin
Modulo.cdsFun.Next;
DBEdit3.Text := Select.Text;
Estado.Text := (copy(DBEdit10.Text, 13,15));
end;

procedure TFuncionario.EstadoClick(Sender: TObject);
var
Copia : string;
begin
copia := DBEdit10.Text;
DBEdit10.Text := Copia + Estado.Text; 
end;

procedure TFuncionario.SelectClick(Sender: TObject);
begin
DBEdit3.Text := Select.Text;
end;

procedure TFuncionario.EstadoChange(Sender: TObject);
Var
Copia : string;
begin
Copia := (Copy(DBEdit10.Text, 1, 12));
DBEdit10.Text :=  Copia+' '+Estado.Text;

end;

procedure TFuncionario.DBEdit4Exit(Sender: TObject);
begin
     DtaAtual := DateToStr(Date);
     DataCopia := (Copy(DtaAtual, 7, 10));
     Copia := (Copy(DBEdit4.Text, 7, 10));
     Nasc := (StrToInt(DataCopia)) - (StrToInt(Copia));
     DBEdit5.Text := IntToStr(Nasc);
end;

procedure TFuncionario.DBEdit5Enter(Sender: TObject);
begin
     DtaAtual := DateToStr(Date);
     DataCopia := (Copy(DtaAtual, 7, 10));
     Copia := (Copy(DBEdit4.Text, 7, 10));
     Nasc := (StrToInt(DataCopia)) - (StrToInt(Copia));
     DBEdit5.Text := IntToStr(Nasc);
end;

procedure TFuncionario.FormCreate(Sender: TObject);
begin
DBEdit3.Text := Select.Text;
Estado.Text := (copy(DBEdit10.Text, 13,15));
end;

procedure TFuncionario.edtPesquisaChange(Sender: TObject);

var Texto, TSQL, Parametro : String;
 begin
      sdsAux.Close;

      TSQL := 'select * from Funcionario ';
      Name.Visible := false;
      cel.Visible := false;
      fone.Visible := false;

      If edtPesquisa.Text = ''
      Then Begin
      Texto := TSQL;
      sdsAux.DataSet.CommandText := Texto;
      Name.Visible := false;
      cel.Visible := false;
      fone.Visible := false;

      End
      Else Begin
      Name.Visible := true;
      cel.Visible := true;
      fone.Visible := true;

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

end.
procedure TFuncionario.Label5Click(Sender: TObject);
begin

end;


