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
  USplash in 'USplash.pas' {FSplash},
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
  IniFiles, SYSUTILS,
  USuport in 'USuport.pas' {Suporte};

{$R *.res}
Var
     ArquivoIni,ArquivoC : TIniFile;
      UsuarioLog : string;
      TempoFim : TDateTime;
    DataBase , Vendedor, Local, soma : String;
begin


  Application.Initialize;
  FSplash := TFSplash.Create(Application);
  FSplash.Show;
  FSplash.Update;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TModulo, Modulo);
  Application.CreateForm(TFSplash, FSplash);
  ArquivoC := TIniFile.create('C:\Asilo\ConfigAsilo.ini');
  Local := ArquivoC.ReadString('Local','Local','');
  ArquivoIni := TIniFile.Create(Local+'\Config.ini');
  DataBase := ArquivoIni.ReadString('Asilo','DATABASE','');
  Vendedor := ArquivoIni.ReadString('Asilo','VENDEDORLIB','');
  ArquivoC.Free;

  Modulo.Conexao.ConnectionName := Nome;
  Modulo.Conexao.Params.Values['Database'] :=DataBase;
  Modulo.Conexao.VendorLib := Vendedor;
  ArquivoINI.Free;

     TempoFim := Time + StrToTime('0:00:01');
  repeat
  until time >= TempoFim;

  Application.Run;





  end.
