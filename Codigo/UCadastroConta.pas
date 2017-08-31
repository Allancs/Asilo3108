unit UCadastroConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Mask, DBCtrls, jpeg, ExtCtrls, FMTBcd, DB,
  SqlExpr;

type
  TCadastroContas = class(TForm)
    Image1: TImage;
    sqlAux: TSQLQuery;
    Veryfi: TTimer;
    Baixo: TPanel;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnInserir: TBitBtn;
    Esquerda: TBitBtn;
    Direita: TBitBtn;
    LadoEsquerdo: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    OQue: TMemo;
    ti: TLabel;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Admin: TRadioButton;
    Padrao: TRadioButton;
    User: TRadioButton;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure VeryfiTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroContas: TCadastroContas;

implementation

uses UModulo;

{$R *.dfm}

procedure TCadastroContas.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;


          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;
          btnGravar.Enabled      := True;
          btnCancelar.Enabled    := True;

          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(ID) AS ULTIMO FROM USUARIOS ');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;

           Modulo.cdUser.Insert;
           Modulo.cdUserID.Value := NReg;

           DBEdit2.SetFocus;
end;
procedure TCadastroContas.btnEditarClick(Sender: TObject);
begin
If DBEdit1.Text = ''
then
begin
MessageDlg('N�o h� dados para serem editados!', mtInformation, [mbOK], 0);
end
else
begin
Modulo.cdUser.Edit;
          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;

          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          DBEdit2.Enabled       := True;
          DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;

          btnGravar.Enabled      := True;
          end;

end;

procedure TCadastroContas.btnCancelarClick(Sender: TObject);
begin
Modulo.cdUser.Cancel;
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;


          btnInserir.Enabled    := True;
          btnDeletar.Enabled    := True;

          btnEditar.Enabled     := True;
          Direita.Enabled       := True;
          Esquerda.Enabled      := True;

          // Ligar o Gravar
          btnGravar.Enabled      := False;
end;

procedure TCadastroContas.btnDeletarClick(Sender: TObject);
begin
IF (DBEdit1.Text = '')
then
begin
   MessageDlg ('N�o a registros no banco',
                       mtInformation,
                       [mbyes],
                       0)
end
else
begin
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled      := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled      := False;


 If
           MessageDlg ('Voc� tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdUser.Delete;
                         Modulo.cdUser.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;
end;

procedure TCadastroContas.btnGravarClick(Sender: TObject);
begin
  if (DBEdit2.Text = '')
     then
     begin
          Messagedlg('O campo nome n�o pode ser vazio', mtInformation, [mbOk], 0);
      end
      Else if (Admin.Checked = False) and (Padrao.Checked = False) and (User.Checked = False)
       then
       Begin
        Messagedlg('O campo tipo de conta n�o pode ser vazio', mtInformation, [mbOk], 0);
      End
      else if (DBEdit4.Text = '')
      then
      begin
      Messagedlg('O campo login n�o pode ser vazio', mtInformation, [mbOk], 0);
      end
      else if (DBEdit5.Text = '')
      then
      begin
  Messagedlg('O campo senha n�o pode ser vazio', mtInformation, [mbOk], 0);
      end;


Modulo.cdUser.Post;

         Modulo.cdUser.ApplyUpdates(-1);

         btnCancelar.Click;
        
end;

procedure TCadastroContas.DireitaClick(Sender: TObject);

begin
Modulo.cdUser.Next;
ti.Caption := 'Conta tipo : '+DBEdit3.Text+'.';
end;

procedure TCadastroContas.EsquerdaClick(Sender: TObject);

begin
Modulo.cdUser.Prior;
ti.Caption := 'Conta tipo : '+DBEdit3.Text+'.';
end;

procedure TCadastroContas.VeryfiTimer(Sender: TObject);

begin
    if Admin.Checked = True
     then
     begin
         DBEdit3.Text := 'admin'
      end
      Else if Padrao.Checked = True
       then
       Begin
        DBEdit3.Text := 'padrao'
      End
      else if User.Checked = True
      then
      begin
      DBEdit3.Text := 'user'
      end;


end;

procedure TCadastroContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
CadastroCOntas := Nil;
end;

end.
