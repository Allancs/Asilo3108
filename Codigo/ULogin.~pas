unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, StdCtrls, jpeg, ExtCtrls, Buttons, IniFiles, IdBaseComponent, IdComponent, IdIPWatch ;

type
  TLogin = class(TForm)
    Image3: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    BitBtn1: TBitBtn;
    BancoOpen: TOpenDialog;
    Label1: TLabel;
    Button1: TButton;
    procedure mrCancelClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  Tentativas : Smallint;
  public
    { Public declarations }

      UsuarioLog : string;
      r : TIdIPWatch;

    DataBase , Vendedor : String;

  end;

var
 ArquivoIni : TIniFile;
  Login: TLogin;
  User, Nome : string;
  NomeArquivo, DataBase, soma: string;
implementation

uses UModulo, UPrincipal,
  UEmail,
  UVoluntarios,
  UCadastroAvisos,
  USMTP,
  UIdoso,
  UResponsavel,
  UContas,
  UFuncionario,
  UIncidentes,
  UParceiros,
  UProfissionais,
  USaude,
  UTarefa,
  UAv,
  URelatorio,
  USuport;

{$R *.dfm}

procedure TLogin.mrCancelClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TLogin.btnCancelarClick(Sender: TObject);
begin
Application.Terminate;
end;



procedure TLogin.BitBtn1Click(Sender: TObject);

begin

Emails := TEmails.Create(Application);
Voluntarios := TVoluntarios.Create(Application);
CadastroAvisos := TCadastroAvisos.Create(Application);
Idoso := TIdoso.Create(Application);
Responsavel := TResponsavel.Create(Application);


  soma := (Copy(Application.Exename, 1, 15));
  ULogin.ArquivoIni := TIniFile.Create(soma+'\Config.ini');
  DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
  Principal.Caminhobanco.Caption := 'Caminho do Banco : '+DataBase;

  if not FileExists(DataBase) then Begin
  Messagedlg('Base de dados não encontrada! Caminho : '+ DataBase, mtInformation, [mbOk], 0);
  if BancoOpen.Execute then begin
  ArquivoIni.WriteString ('Asilo','DATABASE', BancoOpen.FileName);
  Modulo.Conexao.Params.Values['Database'] :=BancoOpen.FileName;
  Principal.Caminhobanco.Caption := 'Caminho Banco : '+BancoOpen.FileName;
  ArquivoIni.Free;
  Messagedlg('Base de dados alterado com sucesso!', mtInformation, [mbOk], 0);
  end;
  end;

          If (edtUsuario.Text = '')
             Then Begin
                    Messagedlg('"Usuário" Inválido!', mtInformation, [mbOk], 0);
                    edtUsuario.SetFocus;
                    Exit;
                  End;
          If (edtSenha.Text = '')
             Then Begin
                    Messagedlg('"Senha" Inválida!', mtInformation, [mbOk], 0);
                    edtSenha.SetFocus;
                    Exit;
                  End;
         Modulo.sqlDSLogin.Close;
         Modulo.sqlDSLogin.CommandText := 'SELECT * FROM USUARIOS'
         + ' WHERE USU_Login = ' + QuotedStr(Trim(edtUsuario.Text))
         + ' AND USU_Senha = ' + QuotedStr(Trim(edtSenha.Text));
         Modulo.sqlDSLogin.Open;
         If Modulo.sqlDSLogin.Fields[0].AsInteger > 0
            Then ModalResult := mrOk
            Else Begin
                   Inc(Tentativas);
                   If Tentativas < 3
                      Then Begin
                             MessageDlg(Format('Tentativa %d de 3', [Tentativas]),
                                                 mtError, [mbOk], 0);
                             if edtUsuario.CanFocus then edtUsuario.SetFocus;
                           End
                      Else Begin
                             MessageDlg(Format('%dª tentativa de acesso',[Tentativas]) + #13 +
                                                'A aplicação será fechada!', mtError, [mbOk], 0);
                             ModalResult := mrCancel;
                           End;
                 End;

           Modulo.sqlDSLogin.RecNo; // Estaciona no Registro corrente
           UsuarioLog := Modulo.sqlDSLogin.Fields[1].AsString;;
            r := TIdIPWatch.Create(nil);
            r.free;

           Principal.UNome.Caption  := 'IP : '+r.LocalIP+', Usuário : ' + Modulo.sqlDSLogin.Fields[1].AsString;

           User := Modulo.sqlDSLogin.Fields[2].AsString;
           Principal.Caption := 'Casa de Repouso Jardim das Flores - Usuário : '+Modulo.sqlDSLogin.Fields[1].AsString;


end;

procedure TLogin.Button1Click(Sender: TObject);
begin
  soma := (Copy(Application.Exename, 1, 15));
  ArquivoIni := TIniFile.Create(soma+'\Config.ini');
  DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
if BancoOpen.Execute then begin
  ArquivoIni.WriteString ('Asilo','DATABASE', BancoOpen.FileName);
  Modulo.Conexao.Params.Values['Database'] :=BancoOpen.FileName;
  Principal.Caminhobanco.Caption := 'Caminho Banco : '+BancoOpen.FileName;
  ArquivoIni.Free;
  Messagedlg('Base de dados alterado com sucesso!', mtInformation, [mbOk], 0);
end;
end;

end.
