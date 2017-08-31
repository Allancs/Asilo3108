unit UParceiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls,
  jpeg, ExtCtrls,
  Buttons,
  FMTBcd, DB, SqlExpr,
  DBClient, SimpleDS;

type
  TParceiros = class(TForm)
    Image1: TImage;
    LadoEsquerdo: TPanel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Baixo: TPanel;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    sqlAux: TSQLQuery;
    Label17: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    edtPesquisa: TEdit;
    cel: TDBEdit;
    fone: TDBEdit;
    Name: TDBEdit;
    email: TDBEdit;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    Empresa: TDBEdit;
    Label8: TLabel;
    Label18: TLabel;
    Label9: TLabel;
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Parceiros: TParceiros;

implementation

uses UModulo,
  UIdoso;

{$R *.dfm}

procedure TParceiros.btnEditarClick(Sender: TObject);
begin

If DBEdit1.Text = ''
then
begin
MessageDlg('Não há dados para serem editados!', mtInformation, [mbOK], 0);
end
else
begin
Modulo.cdsParceiro.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          edtPesquisa.Enabled := false;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;


          btnGravar.Enabled      := True;

          btnGravar.Enabled      := True;
          end;

end;

procedure TParceiros.btnCancelarClick(Sender: TObject);
begin

Modulo.cdsParceiro.Cancel;
          
          DBEdit2.Enabled       := false;
          DBEdit3.Enabled       := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;
          edtPesquisa.Enabled := true;
          btnGravar.Enabled      := False;
          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;
          edtPesquisa.SetFocus;
          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TParceiros.btnDeletarClick(Sender: TObject);
begin

IF (DBEdit1.Text = '')
then
begin
   MessageDlg ('Não a registros no banco',
                       mtInformation,
                       [mbyes],
                       0)
end
else
begin
  DBEdit2.Enabled       := false;
          DBEdit3.Enabled       := false;
          DBEdit4.Enabled       := false;
          DBEdit5.Enabled       := false;
          DBEdit6.Enabled       := false;

 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsParceiro.Delete;
                         Modulo.cdsParceiro.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
         end;
end;

procedure TParceiros.btnGravarClick(Sender: TObject);
begin
Modulo.cdsParceiro.Post;

         Modulo.cdsParceiro.ApplyUpdates(-1);

         btnCancelar.Click;



end;

procedure TParceiros.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          Idoso.Enabled := True;
          edtPesquisa.Enabled := false;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          DBEdit6.Enabled       := True;

          btnGravar.Enabled      := True;
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(COD_PARCEIRO) AS ULTIMO FROM PARCEIRO');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsParceiro.Insert;
           Modulo.cdsParceiroCOD_PARCEIRO.Value := NReg;
           DBEdit2.SetFocus;

end;

procedure TParceiros.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsparceiro.Refresh;
Modulo.cdsParceiro.Next;
end;

procedure TParceiros.DireitaClick(Sender: TObject);
begin
Modulo.cdsparceiro.Refresh;
Modulo.cdsParceiro.Prior;
end;

procedure TParceiros.edtPesquisaChange(Sender: TObject);
var Texto, TSQL, Parametro : String;
 begin
      sdsAux.Close;
Modulo.cdsparceiro.Refresh;
      TSQL := 'select * from Parceiro ';
      Name.Visible := false;
      cel.Visible := false;
      fone.Visible := false;
      email.Visible := false;
      empresa.visible := false;
      If edtPesquisa.Text = ''
      Then Begin
      Texto := TSQL;
      sdsAux.DataSet.CommandText := Texto;
      Name.Visible := false;
      cel.Visible := false;
      fone.Visible := false;
      email.Visible := false;
      empresa.visible := false;
      End
      Else Begin
      Name.Visible := true;
      cel.Visible := true;
      fone.Visible := true;
      email.Visible := true;
      empresa.visible := true;
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
