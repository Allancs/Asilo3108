unit USMTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, FMTBcd, SqlExpr,
  jpeg, ExtCtrls, IniFiles;

type
  TSMTPs = class(TForm)
    DataSource1: TDataSource;
    sqlAux: TSQLQuery;
    LadoEsquerdo: TPanel;
    Baixo: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    Direita: TBitBtn;
    Esquerda: TBitBtn;
    Label6: TLabel;
    Banco: TBitBtn;
    Base: TLabel;
    Base2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BancoConfig: TOpenDialog;
    procedure btnEditarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure EsquerdaClick(Sender: TObject);
    procedure DireitaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CaregaBancoClick(Sender: TObject);
    procedure BancoConfigClose(Sender: TObject);
    procedure BancoConfigCanClose(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    auto : string;
    ArquivoIni : TIniFile;
  end;

var
  SMTPs: TSMTPs;

implementation

uses UModulo,
  UCadastroConta,
  UPrincipal,
  ULogin;

{$R *.dfm}

procedure TSMTPs.btnEditarClick(Sender: TObject);
begin
If DBEdit1.Text = ''
then
begin
MessageDlg('Não há dados para serem editados!', mtInformation, [mbOK], 0);
end
else
begin
Modulo.cdsEmail.Edit;
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

procedure TSMTPs.btnInserirClick(Sender: TObject);
Var NReg : integer;
begin

          btnInserir.Enabled    := False;
          btnDeletar.Enabled    := False;
          btnEditar.Enabled     := False;
          Direita.Enabled       := False;
          Esquerda.Enabled      := False;

          //DBEdit2.Enabled       := True;
        // DBEdit3.Enabled       := True;
          DBEdit4.Enabled       := True;
          DBEdit5.Enabled       := True;


          btnGravar.Enabled      := True;

          sqlAux.Close;


          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('SELECT MAX(ID) AS ULTIMO FROM EMAIL');

          sqlAux.Open;
           If sqlAux.FieldByName('ULTIMO').Value = Null
           Then NReg :=1
           Else NReg := sqlAux.FieldByName('ULTIMO').Value + 1;
           Modulo.cdsEmail.Insert;

           Modulo.cdsEmailSMTP.Text := 'smtp.gmail.com';
           Modulo.cdsEmailPORT.Text := IntToStr(465);
           Modulo.cdsEmailID.Value := NReg;


           DBEdit4.SetFocus;
end;

procedure TSMTPs.btnDeletarClick(Sender: TObject);
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
          DBEdit2.Enabled       := False;
          DBEdit3.Enabled       := False;
          DBEdit4.Enabled       := False;
          DBEdit5.Enabled       := False;

 If
           MessageDlg ('Você tem certeza que deseja excluir?',
                       mtWarning,
                       [mbyes,mbno],
                       0)
          = mryes Then Begin
                         Modulo.cdsEmail.Delete;
                         Modulo.cdsEmail.ApplyUpdates(-1);
                         ShowMessage ('Registro Excluido com sucesso!');
                       End
                  Else Begin
                          ShowMessage ('Nenhum registro deletado!');
                       End;
                       end;

end;

procedure TSMTPs.btnCancelarClick(Sender: TObject);
begin
Modulo.cdsEmail.Cancel;
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

procedure TSMTPs.btnGravarClick(Sender: TObject);
begin
IF (DBEdit4.Text = '')
then begin
 MessageDlg('Campo usuário não pode ser vasio'
                    , mtWarning, [mbOK], 0);
end
else if (DBEdit5.Text = '')
then begin
MessageDlg('Campo senha não pode ser vasio'
                    , mtWarning, [mbOK], 0);

end
else
begin
Modulo.cdsEmail.Post;

         Modulo.cdsEmail.ApplyUpdates(-1);
         SMTPs.Caption := 'Servidor Smtp cadastrado com Sucesso!';
         btnCancelar.Click;
         end;
end;

procedure TSMTPs.EsquerdaClick(Sender: TObject);
begin
Modulo.cdsEmail.Prior;
end;

procedure TSMTPs.DireitaClick(Sender: TObject);
begin
Modulo.cdsEmail.Next;
end;

procedure TSMTPs.FormCreate(Sender: TObject);
var
dataBase : string;
begin
ArquivoIni := TIniFile.Create('C:\Asilo\Codigo\Config.ini');
DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
SMTPs.Caption := 'Cadastro de servidor Smtp';
Base.Caption :='Caminho banco atual : '+DataBase;

end;

procedure TSMTPs.CaregaBancoClick(Sender: TObject);
var
dataBase : string;
begin
ArquivoIni := TIniFile.Create('C:\Asilo\Codigo\Config.ini');
DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');

if BancoConfig.Execute then begin
//Edit1.Text := BancoConfig.FileName;
ArquivoIni.WriteString ('Asilo','DATABASE', BancoConfig.FileName);

ArquivoIni.Free;
end
else begin
ShowMessage('Favor selecionar o arquivo !!!')
end;
end;
procedure TSMTPs.BancoConfigClose(Sender: TObject);
var
dataBase : string;
begin
DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
base2.Caption :='Caminho banco atualizado : '+ DataBase ;

end;

procedure TSMTPs.BancoConfigCanClose(Sender: TObject;
  var CanClose: Boolean);
  var
dataBase : string;
begin
DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
base2.Caption :='Caminho banco atualizado : '+ DataBase ;
end;

procedure TSMTPs.BitBtn1Click(Sender: TObject);
begin
CadastroCOntas.Visible := true;
end;

procedure TSMTPs.BitBtn2Click(Sender: TObject);
var
hora : string;
begin
hora := (copy(TimeToStr(Time), 1 , 5 ));
winexec('C:\Asilo\Codigo\Backup.bat',SW_SHOWMINIMIZED);
Principal.Label7.Caption := 'Backup manual '+ hora+'h';
end;

end.
