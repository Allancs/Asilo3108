program Asilo;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Principal},
  UModulo in 'UModulo.pas' {Modulo: TDataModule},
  UEmail in 'UEmail.pas' {Emails},
  UIdoso in 'UIdoso.pas' {Idoso},
  UVoluntarios in 'UVoluntarios.pas' {Voluntarios},
  USMTP in 'USMTP.pas' {SMTPs},
  UResponsavel in 'UResponsavel.pas' {Responsavel},
  UCadastroAvisos in 'UCadastroAvisos.pas' {CadastroAvisos},
  UContas in 'UContas.pas' {Termor},
  UDespesas in 'UDespesas.pas' {medicacao},
  UFuncionario in 'UFuncionario.pas' {Funcionario},
  UIncidentes in 'UIncidentes.pas' {Incidentes},
  UParceiros in 'UParceiros.pas' {Parceiros},
  UProfissionais in 'UProfissionais.pas' {Profissionais},
  USaude in 'USaude.pas' {Saudes},
  UTarefa in 'UTarefa.pas' {Tarefa},
  UAv in 'UAv.pas' {Avaliacao},
  ULogin in 'ULogin.pas' {Login},
  UCadastroConta in 'UCadastroConta.pas' {CadastroContas},
  URelatorio in 'URelatorio.pas' {Relatorio},
  UPesquisaRel in 'UPesquisaRel.pas' {PesquisaRel},
  IniFiles;

{$R *.res}
Var
     ArquivoIni : TIniFile;
      UsuarioLog : string;

    DataBase , Vendedor, Local, soma : String;
begin


  Application.Initialize;

  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TEmails, Emails);
  Application.CreateForm(TIdoso, Idoso);
  Application.CreateForm(TVoluntarios, Voluntarios);
  Application.CreateForm(TSMTPs, SMTPs);
  Application.CreateForm(TResponsavel, Responsavel);
  Application.CreateForm(TCadastroAvisos, CadastroAvisos);
  Application.CreateForm(TTermor, Termor);
  Application.CreateForm(Tmedicacao, medicacao);
  Application.CreateForm(TFuncionario, Funcionario);
  Application.CreateForm(TIncidentes, Incidentes);
  Application.CreateForm(TParceiros, Parceiros);
  Application.CreateForm(TProfissionais, Profissionais);
  Application.CreateForm(TSaudes, Saudes);
  Application.CreateForm(TTarefa, Tarefa);
  Application.CreateForm(TAvaliacao, Avaliacao);
  Application.CreateForm(TCadastroContas, CadastroContas);
  Application.CreateForm(TRelatorio, Relatorio);
  Application.CreateForm(TPesquisaRel, PesquisaRel);
  soma := (Copy(Application.Exename, 1, 15));
   ArquivoIni := TIniFile.Create(soma+'\Config.ini');
   DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
   Vendedor := ArquivoIni.ReadString('Asilo','VENDEDORLIB','');
   Modulo.Conexao.ConnectionName := Nome;
   Modulo.Conexao.Params.Values['Database'] :=DataBase;
   Modulo.Conexao.VendorLib := Vendedor;
   ArquivoINI.Free;
  Application.Run;





  end.
