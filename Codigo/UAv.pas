unit UAv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdMessage, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, StdCtrls, ExtCtrls, jpeg;

type
  TAvaliacao = class(TForm)
    enviar: TButton;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    IdMessage1: TIdMessage;
    Label6: TLabel;
    Label9: TLabel;
    Nome: TEdit;
    GS: TCheckBox;
    Label1: TLabel;
    GN: TCheckBox;
    EN: TEdit;
    LE: TLabel;
    Label3: TLabel;
    CS: TCheckBox;
    CN: TCheckBox;
    CE: TEdit;
    CL: TLabel;
    Label5: TLabel;
    OQMS: TEdit;
    Label7: TLabel;
    N1: TRadioButton;
    N2: TRadioButton;
    N3: TRadioButton;
    N4: TRadioButton;
    N5: TRadioButton;
    Timer2: TTimer;
    Image1: TImage;
    procedure enviarClick(Sender: TObject);
    procedure GNClick(Sender: TObject);
    procedure CNClick(Sender: TObject);
    procedure GSClick(Sender: TObject);
    procedure CSClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
GSS, GNN, PNN, CEE, CSS , CNN, PNC, Msggs, Msgcs,Msgcss, Msgm, OQM, N11, N22, N33, N44, N55 : String;
    Menssagem : String;
  end;

var
  Avaliacao: TAvaliacao;

implementation

uses USMTP;

{$R *.dfm}

procedure TAvaliacao.enviarClick(Sender: TObject);

var

  // objetos necess�rios para o funcionamento
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  //CaminhoAnexo: string;
//  i : Integer;
begin
      Msgm := 'O que melhoraria o Sistema?';
      OQM := OQMS.Text;
         Menssagem := Msggs +' '+GSS + ' '+GNN + ' '+PNN+#13+Msgcss +' '+CSS +' '+CNN +' '+PNC+#13+ 'O que melhoraria o sistema ?'+ ' '+OQMS.Text+#13+ Msgcs + ' ' +N11+N22+N33+N44+N55+#13+'Finalizado com Sucesso!';
  // instancia��o dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    // Configura��o do SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configura��o do SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.AuthenticationType := atLogin;
    IdSMTP.Port := 465;

    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'asiloautomatico2.0@gmail.com';
    IdSMTP.Password := 'compreiumcarro123456789';


    // Tentativa de conex�o e autentica��o
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conex�o e/ou autentica��o: ' +
                    E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    // Configura��o da mensagem

    IdMessage.From.Address := 'cssoftwaresuporte@hotmail.com';
    IdMessage.From.Name := Nome.Text;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.EMailAddresses := 'cssoftwaresuporte@hotmail.com';
    IdMessage.Subject := 'Avalia��o do Sistema';
    IdMessage.Body.Text := Menssagem;

    //Anexo da mensagem (opcional)
{    CaminhoAnexo := OpenDialog1.Files[i];
    if FileExists(CaminhoAnexo) then
      TIdAttachment.Create(IdMessage.MessageParts, CaminhoAnexo);
    if ListBoxAnexos.Items.Count > 0 then
		begin
			for i:= 0 to ListBoxAnexos.Items.Count - 1 do
				TIdAttachment.Create(IdMessage1.MessageParts, ListBoxAnexos.Items[i]);
			end;   }

  // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Formulario emviado com sucesso', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        MessageDlg('Erro ao enviar o formulario : ' +
                    E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    // libera��o dos objetos da mem�ria
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
    Avaliacao.Caption := 'Obrigado pela sua Avalia��o !';
    enviar.Enabled := false;
  end;
end;

procedure TAvaliacao.GNClick(Sender: TObject);
begin
  if GN.Checked = True
     then
     begin
          EN.Visible := True;
          LE.Visible := True;
      end
      Else
       Begin
         EN.Visible := False;
          LE.Visible := False;
      End;
end;

procedure TAvaliacao.CNClick(Sender: TObject);
begin
        if CN.Checked = True
     then
     begin
          CL.Visible := True;
          CE.Visible := True;
      end
      Else
       Begin
         CL.Visible := False;
          CE.Visible := False;
      End;
end;

procedure TAvaliacao.GSClick(Sender: TObject);
begin
                 if GS.Checked = True
     then
     begin
          Msggs := 'Gostou do Sistema?';
          GSS := Nome.Text+', Sim!';

      end
      Else
       Begin
         Msggs := 'Gostou do Sistema?';
         GNN := Nome.Text +' , N�o';
         PNN := 'Porque n�o gostou? '+ EN.Text+'.';

      End;
end;

procedure TAvaliacao.CSClick(Sender: TObject);
begin
  if CS.Checked = True
     then
     begin
          Msgcss := 'Achou o Sistema completo e intuitivo?';
          CSS := Nome.Text+', Sim!';
      end
      Else
       Begin
         Msgcss := 'Achou o Sistema completo e intuitivo?';
         CNN := Nome.Text +' , N�o';
         PNC := 'Porque n�o gostou? '+ CE.Text+'.';
      End;
end;

procedure TAvaliacao.N1Click(Sender: TObject);
begin

      if N1.Checked = True
     then
     begin
          Msgcs := 'Qual nota daria ao Sistema';
          N11 := '1, Poderia melhorar mais.';
          //Image1.Picture := 'C:\Asilo\Icones\Avaliacao1.jpg';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao1.jpg');
      end;
end;

procedure TAvaliacao.N2Click(Sender: TObject);
begin

      if N2.Checked = True
       then
       Begin
          Msgcs := 'Qual nota daria ao Sistema';
          N22 := '2, Esta quase bom.';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao2.jpg');
      End;
end;

procedure TAvaliacao.N3Click(Sender: TObject);
begin

      if N3.Checked = True
      then
       Begin
         Msgcs := 'Gostou do Sistema';
          N33 := '3, Ele esta no caminho certo';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao3.jpg');
      end;
end;

procedure TAvaliacao.N4Click(Sender: TObject);
begin

        if N4.Checked = True
        then
       Begin
         Msgcs := 'Qual nota daria ao Sistema';
          N44 := '4, O sistema esta rodando perfeitamente';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao4.jpg');
          end;
end;

procedure TAvaliacao.N5Click(Sender: TObject);
begin

       if N5.Checked = True
       then
       Begin
         Msgcs := 'Qual nota daria ao Sistema';
          N55 := '5, O Sistema esta 100%, Otimo!';
          Image1.Picture.LoadFromFile('C:\Asilo\Icones\Avaliacao5.jpg');
          END;
end;

procedure TAvaliacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
Avaliacao := Nil;
end;

end.
