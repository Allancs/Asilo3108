unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Menus,
  OleCtrls, SHDocVw,
  jpeg,IniFiles,
  DB, DBClient, SimpleDS, IdBaseComponent, IdComponent, IdIPWatch ;

type
  TPrincipal = class(TForm)
    Env: TBitBtn;
    A: TBitBtn;
    Con: TBitBtn;
    I: TBitBtn;
    Resp: TBitBtn;
    Par: TBitBtn;
    Pro: TBitBtn;
    Res: TBitBtn;
    S: TBitBtn;
    Vol: TBitBtn;
    PoupUP: TTimer;
    Aviso: TGroupBox;
    DBText2: TDBText;
    Ser: TBitBtn;
    GP1: TGroupBox;
    AvisosPoP: TCheckBox;
    UNome: TLabel;
    Avali: TBitBtn;
    px: TButton;
    an: TButton;
    Label1: TLabel;
    Label2: TLabel;
    sdsAux: TSimpleDataSet;
    DataSource1: TDataSource;
    Image1: TImage;
    sdsAuxOBS: TStringField;
    sdsAuxDATA: TDateField;
    Tarefas: TCheckBox;
    Aux: TSimpleDataSet;
    DataSource2: TDataSource;
    TarefaPop: TGroupBox;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    TarefaP: TButton;
    TarefaA: TButton;
    AuxDATA: TDateField;
    AuxTAREFA: TStringField;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    Caminhobanco: TLabel;
    Relato: TBitBtn;
    suport: TBitBtn;
    Label7: TLabel;
    Backup: TTimer;
    Data: TLabel;
    Hora: TLabel;
    func: TBitBtn;
    Timer2: TTimer;
    T: TBitBtn;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    procedure EnvClick(Sender: TObject);
    procedure VolClick(Sender: TObject);
    procedure AClick(Sender: TObject);
    procedure SerClick(Sender: TObject);
    procedure ResClick(Sender: TObject);
    procedure RespClick(Sender: TObject);
    procedure DesClick(Sender: TObject);
    procedure ConClick(Sender: TObject);
    procedure funcClick(Sender: TObject);
    procedure IClick(Sender: TObject);
    procedure ParClick(Sender: TObject);
    procedure ProClick(Sender: TObject);
    procedure SClick(Sender: TObject);
    procedure TClick(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Avisos1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure incidentes1Click(Sender: TObject);
    procedure Responsaveis1Click(Sender: TObject);
    procedure Parceiros1Click(Sender: TObject);
    procedure Profissionais1Click(Sender: TObject);
    procedure Idosos1Click(Sender: TObject);
    procedure Saude1Click(Sender: TObject);
    procedure arefas1Click(Sender: TObject);
    procedure Voluntarios1Click(Sender: TObject);
    procedure pxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadastroContaClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure AvaliClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TarefaAClick(Sender: TObject);
    procedure TarefaPClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure AvisosPoPClick(Sender: TObject);
    procedure TarefasClick(Sender: TObject);
    procedure RelaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure suportClick(Sender: TObject);
    procedure BackupTimer(Sender: TObject);
    procedure anClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses UEmail, UVoluntarios,  UModulo,  USMTP, UIdoso,
  UResponsavel, UCadastroAvisos, UDespesas, UFuncionario, UContas,
  UIncidentes, UParceiros, UProfissionais, USaude, UTarefa,
  UAv,
  ULogin,
  UCadastroConta,
  URelatorio,
  USuport;

{$R *.dfm}

procedure TPrincipal.EnvClick(Sender: TObject);
begin
If (Emails = Nil)
Then
Emails := TEmails.Create(Application);
Emails.WindowState := wsNormal;
Emails.Show;
//On Close do Form
//Action := caFree;
//Emails := Nil;

end;

procedure TPrincipal.VolClick(Sender: TObject);
begin
If (Voluntarios = Nil)
Then
Voluntarios := TVoluntarios.Create(Application);
Voluntarios.WindowState := wsNormal;
Voluntarios.Show;
//On Close do Form
//Action := caFree;
//Voluntarios := Nil;

end;

procedure TPrincipal.AClick(Sender: TObject);
begin
If (CadastroAvisos = Nil)
Then
CadastroAvisos := TCadastroAvisos.Create(Application);
CadastroAvisos.WindowState := wsNormal;
CadastroAvisos.Show;

//On Close do Form
//Action := caFree;
//CadastroAvisos := Nil;
//CadastroAvisos.Visible := True;
end;

procedure TPrincipal.SerClick(Sender: TObject);
begin
If (SMTPs = Nil)
Then
SMTPs := TSMTPs.Create(Application);
SMTPs.WindowState := wsNormal;
SMTPs.Show;
//On Close do Form
//Action := caFree;
//SMTPs := Nil;

end;

procedure TPrincipal.ResClick(Sender: TObject);
begin
If (Idoso = Nil)
Then
Idoso := TIdoso.Create(Application);
Idoso.WindowState := wsNormal;
Idoso.Show;
//On Close do Form
//Action := caFree;
//Idoso := Nil;

end;

procedure TPrincipal.RespClick(Sender: TObject);
begin
If (Responsavel = Nil)
Then
Responsavel := TResponsavel.Create(Application);
Responsavel.WindowState := wsNormal;
Responsavel.Show;
//On Close do Form
//Action := caFree;
//Responsavel := Nil;

end;

procedure TPrincipal.DesClick(Sender: TObject);
begin
medicacao.Visible := True;
end;

procedure TPrincipal.ConClick(Sender: TObject);
begin
If (Termor = Nil)
Then
Termor := TTermor.Create(Application);
Termor.WindowState := wsNormal;
Termor.Show;
//On Close do Form
//Action := caFree;
//Termor := Nil;
end;

procedure TPrincipal.funcClick(Sender: TObject);
begin
If (Funcionario = Nil)
Then
Funcionario := TFuncionario.Create(Application);
Funcionario.WindowState := wsNormal;
Funcionario.Show;
//On Close do Form
//Action := caFree;
//Funcionario := Nil;
//Funcionario.Visible := True;
end;

procedure TPrincipal.IClick(Sender: TObject);
begin
If (Incidentes = Nil)
Then
Incidentes := TIncidentes.Create(Application);
Incidentes.WindowState := wsNormal;
Incidentes.Show;

//On Close do Form
//Action := caFree;
//Incidentes := Nil;
//Incidentes.Visible := True;
end;

procedure TPrincipal.ParClick(Sender: TObject);
begin
If (Parceiros = Nil)
Then
Parceiros := TParceiros.Create(Application);
Parceiros.WindowState := wsNormal;
Parceiros.Show;
//On Close do Form
//Action := caFree;
//Parceiros := Nil;

end;

procedure TPrincipal.ProClick(Sender: TObject);
begin
If (Profissionais = Nil)
Then
Profissionais := TProfissionais.Create(Application);
Profissionais.WindowState := wsNormal;
Profissionais.Show;

//On Close do Form
//Action := caFree;
//Profissionais := Nil;
//Profissionais.Visible := True;
end;

procedure TPrincipal.SClick(Sender: TObject);
begin
If (Saudes = Nil)
Then
Saudes := TSaudes.Create(Application);
Saudes.WindowState := wsNormal;
Saudes.Show;

//On Close do Form
//Action := caFree;
//Saudes := Nil;
//Saudes.Visible := True;
end;

procedure TPrincipal.TClick(Sender: TObject);
begin
If (Tarefa = Nil)
Then
Tarefa := TTarefa.Create(Application);
Tarefa.WindowState := wsNormal;
Tarefa.Show;

//On Close do Form
//Action := caFree;
//Tarefa := Nil;
//Tarefa.Visible := True;
end;

procedure TPrincipal.Funcionarios1Click(Sender: TObject);
begin
Funcionario.Visible := True;
end;

procedure TPrincipal.Avisos1Click(Sender: TObject);
begin
CadastroAvisos.Visible := True;
end;

procedure TPrincipal.Despesas1Click(Sender: TObject);
begin
medicacao.Visible := True;
end;

procedure TPrincipal.incidentes1Click(Sender: TObject);
begin
Incidentes.Visible := True;
end;

procedure TPrincipal.Responsaveis1Click(Sender: TObject);
begin
Responsavel.Visible := True;
end;

procedure TPrincipal.Parceiros1Click(Sender: TObject);
begin
Parceiros.Visible := True;
end;

procedure TPrincipal.Profissionais1Click(Sender: TObject);
begin
Profissionais.Visible := True;
end;

procedure TPrincipal.Idosos1Click(Sender: TObject);
begin
Idoso.Visible := True;
end;

procedure TPrincipal.Saude1Click(Sender: TObject);
begin
Saudes.Visible := True;
end;

procedure TPrincipal.arefas1Click(Sender: TObject);
begin
Tarefa.Visible := True;
end;

procedure TPrincipal.Voluntarios1Click(Sender: TObject);
begin
Voluntarios.visible := true;
end;

procedure TPrincipal.pxClick(Sender: TObject);
begin
sdsAux.Next;

//Modulo.cdsAviso.Prior;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
Incidentes := TIncidentes.Create(Application);
Parceiros := TParceiros.Create(Application);
Profissionais := TProfissionais.Create(Application);
Saudes := TSaudes.Create(Application);
Tarefa := TTarefa.Create(Application);
     If TLogin.Create(Self).ShowModal = mrCancel
     Then Begin
        Application.Terminate;
        Exit;
        End;
         If (ULogin.User = 'admin')
             Then Begin

             Tarefa.btnDeletar.Enabled := true;
             Tarefa.btnEditar.Enabled := true;
             Tarefa.btnCancelar.Enabled := true;
                  Relato.Visible := true;

                  CaminhoBanco.Visible := true;
                  CadastroAvisos.btnEditar.visible := true;
                  CadastroAvisos.btnInserir.visible := true;
                  CadastroAvisos.btnCancelar.visible := true;
                  CadastroAvisos.btnDeletar.visible := true;
                  CadastroAvisos.btnGravar.visible := true;
                  Tarefa.btnEditar.visible := true;
                  Tarefa.btnInserir.visible := true;
                  Tarefa.btnCancelar.visible := true;
                  Tarefa.btnDeletar.visible := true;
                  Tarefa.btnGravar.visible := true;
                  pro.visible := true;
                  par.visible := true;
                  con.visible := true;
                  res.visible := true;
                  func.visible := true;
                  resp.visible := true;
                  vol.visible := true;
                  env.visible := true;
                  ser.visible := true;
                  avali.visible := true;
                  Tarefa.btnInserir.Enabled := true;
                  Tarefa.btnGravar.Enabled := true;



                    end
                    else If (ULogin.User = 'padrao')
                    then
                    begin
                    saudes.btnDeletar.visible := false;
                    Incidentes.btnDeletar.visible := false;
                    pro.visible := true;
                    par.visible := true;
                    con.visible := true;
                    res.visible := true;
                    resp.visible := true;
                    vol.visible := true;
                    env.visible := true;
                    ser.visible := true;
                    avali.visible := true;
                    Saudes.btnDeletar.Visible := false;
                    Incidentes.btnDeletar.Visible := false;
                    Tarefa.btnDeletar.Visible := false;
                    CadastroAvisos.btnDeletar.Visible := false;
                    Parceiros.btnDeletar.Visible := false;
                    Responsavel.btnDeletar.Visible := false;
                    Funcionario.btnDeletar.Visible := false;
                    Voluntarios.btnDeletar.Visible := false;
                    Emails.Mostrar.Visible := false;
                    Emails.Ocutar.Visible := false;
                    Ser.Visible := false;
                    Emails.Baixo.Visible := false;
                    Profissionais.btnDeletar.Visible := false;
                    Idoso.btnDeletar.Visible := false;
                    Avali.Visible := false;
 end
 else If (ULogin.User = 'user')
                    then
                    begin
                    Incidentes.btnDeletar.Visible := false;
                    CadastroAvisos.btnDeletar.Visible := false;
                    Tarefa.btnDeletar.Visible := false;
                    Saudes.btnDeletar.Visible := false;
                    //medicacao.btnDeletar.Visible := false;


end;
end;



procedure TPrincipal.CadastroContaClick(Sender: TObject);
begin
  CadastroContas.Visible := true;
end;

procedure TPrincipal.Sair1Click(Sender: TObject);
begin
Application.Terminate;
WinExec('C:\Asilo\Codigo\Asilo.exe',SW_NORMAL);
end;

procedure TPrincipal.AvaliClick(Sender: TObject);
begin
If (Avaliacao = Nil)
Then
Avaliacao := TAvaliacao.Create(Application);
Avaliacao.WindowState := wsNormal;
Avaliacao.Show;
//On Close do Form
//Action := caFree;
//Avaliacao := Nil;

end;

procedure TPrincipal.FormActivate(Sender: TObject);
Var       TxtConsulta, TxxtConsulta, DtaAtual : String;
begin

          Label5.Font.Color := clRed;
          Label6.Font.Color := clGreen;
          // Pega a Data
          DtaAtual := DateToStr(Date);
          // Troca a / por . (Firebird guarda a data com . e nao /)
          DtaAtual := StringReplace(DtaAtual, '/', '.', [rfreplaceall]);

          // para formatar a data -> FormatDateTime('mm/dd/yyyy', SuaData)

          TxtConsulta :=
          'SELECT OBS, DATA FROM AVISOS WHERE DATA >= '
           + QuotedStr(DtaAtual)+' order by data';
           //+ QuotedStr(DateToStr(DateTimePicker1.DateTime) com troca / por .);

          // Executa
          sdsAux.Close;
          sdsAux.DataSet.CommandText := TxtConsulta;
          sdsAux.Open;
          TxxtConsulta :=
          'Select DATA, TAREFA From TAREFA WHERE DATA >= '
          + QuotedStr(DtaAtual)+'Order by Data DESC';
          Aux.Close;
          Aux.DataSet.CommandText := TxxtConsulta;
          Aux.Open;
          Data.Caption := 'Data : '+DateToStr(Date);

end;

procedure TPrincipal.TarefaAClick(Sender: TObject);
begin
Aux.Prior;
end;

procedure TPrincipal.TarefaPClick(Sender: TObject);
begin
Aux.Next;

end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
var
DtaAtual : string;
begin
        DtaAtual := DateToStr(Date);
If (DBText3.Caption = DtaAtual)
          then
          Begin
          DBText3.Font.Color := clRed;
          End
          else
          begin
          DBText3.Font.Color := clGreen;
          end;

          If (DBText2.Caption = DtaAtual)
          then
          Begin
          DBText2.Font.Color := clRed;
          End
          else
          begin
          DBText2.Font.Color := clGreen;
          end;

          
end;

procedure TPrincipal.AvisosPoPClick(Sender: TObject);
begin
 if AvisosPop.Checked = true
     then
     begin
           Aviso.Visible := True;
      end
      Else
       Begin
      Aviso.Visible := False;
      End;

       if Tarefas.Checked = true and AvisosPop.Checked = false
     then
     begin
           TarefaPop.Top := 144;
           TarefaPop.Visible := true;
      end
      else if (Tarefas.Checked = true and AvisosPop.Checked = true)
      then
      begin
         TarefaPop.Top := 256;
         TarefaPop.Visible := true;
      end;

      if Tarefas.Checked = true
      then
      begin
       TarefaPop.Visible := true
       end
      Else
       Begin
      TarefaPop.Visible := False;
      End;
end;

procedure TPrincipal.TarefasClick(Sender: TObject);
begin
 if AvisosPop.Checked = true
     then
     begin
           Aviso.Visible := True;
      end
      Else
       Begin
      Aviso.Visible := False;
      End;

       if Tarefas.Checked = true and AvisosPop.Checked = false
     then
     begin
           TarefaPop.Top := 144;
           TarefaPop.Visible := true;
      end
      else if (Tarefas.Checked = true and AvisosPop.Checked = true)
      then
      begin
         TarefaPop.Top := 256;
         TarefaPop.Visible := true;
      end;

      if Tarefas.Checked = true
      then
      begin
       TarefaPop.Visible := true
       end
      Else
       Begin
      TarefaPop.Visible := False;
      End;
end;

procedure TPrincipal.RelaClick(Sender: TObject);
begin
Relatorio.Visible := True;
end;

procedure TPrincipal.BitBtn1Click(Sender: TObject);
begin
If (Relatorio = Nil)
Then
Relatorio := TRelatorio.Create(Application);
Relatorio.WindowState := wsNormal;
Relatorio.Show;
//On Close do Form
//Action := caFree;
//Relatorio := Nil;

end;

procedure TPrincipal.suportClick(Sender: TObject);
begin
If (Suporte = Nil)
Then
Suporte := TSuporte.Create(Application);
Suporte.WindowState := wsNormal;
Suporte.Show;

//On Close do Form
//Action := caFree;
//Suporte := Nil;
//Suporte.Visible := True;
end;

procedure TPrincipal.BackupTimer(Sender: TObject);
begin
//Label7.Caption := TimeToStr(Time);
Hora.Caption := 'Hora : '+TimeToStr(Time);
If (TimeToStr(Time)= '12:00:00')
then
begin
winexec('C:\Asilo\Codigo\Backup.bat',SW_SHOWMINIMIZED);
Label7.Caption := 'Backup Completo, 12h.'
end;

If (TimeToStr(Time)= '15:00:00')
then
begin
winexec('C:\Asilo\Codigo\Backup.bat',SW_SHOWMINIMIZED);
Label7.Caption := 'Backup Completo, 15h.'
end;

If (TimeToStr(Time)= '17:00:00')
then
begin
winexec('C:\Asilo\Codigo\Backup.bat',SW_SHOWMINIMIZED);
Label7.Caption := 'Backup Completo, 17h.'
end;

end;

procedure TPrincipal.anClick(Sender: TObject);
begin
sdsAux.Prior;
end;

end.






