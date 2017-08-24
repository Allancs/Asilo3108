unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, FMTBcd, DB, DBClient, SimpleDS,
  SqlExpr, QRCtrls, QuickRpt, Buttons;

type
  TRelatorio = class(TForm)
    Baixo: TPanel;
    Image1: TImage;
    LadoEsquerdo: TPanel;
    Email: TGroupBox;
    TodosE: TCheckBox;
    VoluntariosE: TCheckBox;
    ParceirosE: TCheckBox;
    Telefone: TGroupBox;
    ProfissionaisT: TCheckBox;
    ParceirosT: TCheckBox;
    ResponsaveisT: TCheckBox;
    FuncionariosT: TCheckBox;
    Residente: TGroupBox;
    TodosR: TCheckBox;
    Aniversariantes: TCheckBox;
    Responsavel: TGroupBox;
    Todosres: TCheckBox;
    sdsTodos: TSimpleDataSet;
    dsAux: TDataSource;
    sdsVolu: TSimpleDataSet;
    volu: TDataSource;
    sdsTodosEMAIL: TStringField;
    sdsTodosNOME: TStringField;
    RlVolun: TBitBtn;
    RlParceiros: TBitBtn;
    RLTodos: TBitBtn;
    sdsPar: TSimpleDataSet;
    DataSource1: TDataSource;
    sdsParNOME: TStringField;
    sdsParEMAIL: TStringField;
    sdsVoluNOME: TStringField;
    sdsVoluEMAIL: TStringField;
    Cancel: TSpeedButton;
    todosresp: TBitBtn;
    DataSource2: TDataSource;
    sdsResponsavel: TSimpleDataSet;
    sdsResponsavelCOD_LIGACOES: TIntegerField;
    sdsResponsavelCOD_IDOSO: TIntegerField;
    sdsResponsavelNOME: TStringField;
    sdsResponsavelNOMER: TStringField;
    sdsResponsavelCELULAR: TStringField;
    sdsResponsavelTELEFONE: TStringField;
    pt: TBitBtn;
    prot: TSimpleDataSet;
    proot: TDataSource;
    Label2: TLabel;
    protNOME: TStringField;
    protCELULAR: TStringField;
    protTELEFONE: TStringField;
    protEEMPRESA: TStringField;
    parceiro: TSimpleDataSet;
    parceiross: TDataSource;
    Funcionario: TSimpleDataSet;
    funnc: TDataSource;
    responsa: TSimpleDataSet;
    respp: TDataSource;
    parceiroNOME: TStringField;
    parceiroTELEFONE: TStringField;
    parceiroCELULAR: TStringField;
    parceiroEMPRESA: TStringField;
    FuncionarioNOME: TStringField;
    FuncionarioCELULAR: TStringField;
    FuncionarioTELEFONE: TStringField;
    responsaNOMER: TStringField;
    responsaTELEFONE: TStringField;
    responsaCELULAR: TStringField;
    responsaNOME: TStringField;
    Parceiros: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Aniversario: TSimpleDataSet;
    Aniversarios: TDataSource;
    TodosResidentess: TDataSource;
    TodosResidentes: TSimpleDataSet;
    TodosResidentesCOD_IDOSO: TIntegerField;
    TodosResidentesNOME: TStringField;
    TodosResidentesDATANASCIMENTO: TStringField;
    TodosResidentesIDADE: TStringField;
    TodosResidentesNASCIONALIDADE: TStringField;
    TodosResidentesNATURALIDADE: TStringField;
    TodosResidentesESTADOCIVIL: TStringField;
    TodosResidentesRELIGIAO: TStringField;
    TodosResidentesPROFISSAO: TStringField;
    TodosResidentesRG: TStringField;
    TodosResidentesCPF: TStringField;
    TodosResidentesPAI: TStringField;
    TodosResidentesMAE: TStringField;
    TodosResidentesOBS: TStringField;
    TodosResidentesDATAENTRADA: TDateField;
    TodosResidentesINFORMACOES: TStringField;
    TodosResidentesDATASAIDA: TDateField;
    Todosresidentesss: TBitBtn;
    Ani: TBitBtn;
    AniversarioNOME: TStringField;
    AniversarioDATANASCIMENTO: TStringField;
    AniversarioIDADE: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    procedure RLTodosClick(Sender: TObject);
    procedure RlVolunClick(Sender: TObject);
    procedure RlParceirosClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure todosrespClick(Sender: TObject);
    procedure ptClick(Sender: TObject);
    procedure ParceirosClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure TodosresidentesssClick(Sender: TObject);
    procedure AniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Relatorio: TRelatorio;

implementation

uses UModulo, UPesquisaRel, UResponsavel;

{$R *.dfm}


procedure TRelatorio.RLTodosClick(Sender: TObject);
begin
sdsTodos.Close;
sdsTodos.DataSet.CommandText := 'SELECT nome, email FROM voluntario union all SELECT nome, email FROM parceiro';

sdsTodos.Open;
Pesquisarel.Email.Caption := 'Todos email cadastrados de Parceiros e Voluntarios';

PesquisaRel.volu.Preview;
end;

procedure TRelatorio.RlVolunClick(Sender: TObject);
begin
sdsPar.Close;
sdsPar.DataSet.CommandText := 'select EMAIL , Nome FROM VOLUNTARIO';
sdsPar.Open;

Pesquisarel.Email.Caption := 'Todos email cadastrados de Parceiros';
PesquisaRel.par.Preview;
end;

procedure TRelatorio.RlParceirosClick(Sender: TObject);
begin

sdsVolu.Close;
sdsVolu.DataSet.CommandText := 'select EMAIL , Nome FROM PARCEIRO';
sdsVolu.Open;
Pesquisarel.Email.Caption := 'Todos email cadastrados de Voluntários';
PesquisaRel.Vol.Preview;
end;

procedure TRelatorio.CancelClick(Sender: TObject);
begin
Email.Enabled := true;
Responsavel.Enabled := true;
Residente.Enabled := true;
TodosE.Enabled :=true;
Voluntariose.Enabled := true;
Parceirose.Enabled := true;
Todosres.Enabled := true;
profissionaist.Enabled := true;
parceirost.Enabled    := true;
responsaveist.Enabled := true;
funcionariost.Enabled := true;
todosr.Enabled       := true;
aniversariantes.Enabled  := true;
Email.Enabled := true;
Responsavel.Enabled := true;
Telefone.Enabled := true;
residente.Enabled := true;
end;

procedure TRelatorio.todosrespClick(Sender: TObject);
begin
sdsResponsavel.Close;
sdsResponsavel.dataset.CommandText := 'select * from LIGACOES';
sdsResponsavel.Open;
 PesquisaRel.Respo.Preview;
end;

procedure TRelatorio.ptClick(Sender: TObject);
begin
prot.Close;
prot.DataSet.CommandText := 'select  NOME, CELULAR,TELEFONE, EEMPRESA from PROFISSIONAIS';
prot.Open;
PesquisaRel.TelefonePro.Preview;
end;

procedure TRelatorio.ParceirosClick(Sender: TObject);
begin
Parceiro.Close;
Parceiro.DataSet.CommandText := 'Select NOME, TELEFONE, CELULAR, EMPRESA from PARCEIRO';
Parceiro.Open;
PesquisaRel.Relparceiros.Preview;
end;

procedure TRelatorio.BitBtn2Click(Sender: TObject);
begin
Responsa.Close;
Responsa.DataSet.CommandText := 'Select NOMER, TELEFONE, CELULAR, NOME from LIGACOES';
Responsa.Open;

PesquisaRel.ResponsaveisAgenda.Preview;
end;

procedure TRelatorio.BitBtn3Click(Sender: TObject);
begin
Funcionario.Close;
Funcionario.DataSet.CommandText := 'Select NOME, CELULAR, TELEFONE from FUNCIONARIO';
Funcionario.Open;
PesquisaRel.FunAgenda.Preview;
end;

procedure TRelatorio.TodosresidentesssClick(Sender: TObject);
begin
TodosResidentes.Close;
TodosResidentes.DataSet.CommandText := 'select * from RESIDENTE';
TodosResidentes.Open;
PesquisaRel.Residentetodos.Preview;
end;

procedure TRelatorio.AniClick(Sender: TObject);
var
DtaAtual, copy1, copy2, copy3, copy4 : string;
begin
            DtaAtual := DateToStr(Date);
            copy1 := (Copy(DateToStr(Date), 4, 2));
            copy2 := (Copy(DateToStr(Date), 7, 10));
            Copy3 := '00/'+copy1+'/1900';
            copy4 := '31/'+copy1+'/'+copy2;

          // Troca a / por . (Firebird guarda a data com . e nao /)

Aniversario.Close;
Aniversario.DataSet.CommandText := 'Select Nome, DataNascimento, Idade From Residente Where dataNascimento between '+QuotedStr(copy3)+' And '+QuotedStr(copy4)+' order by dataNascimento';
Aniversario.Open;

Label2.Caption := 'Select Nome, DataNascimento, Idade From Residente Where dataNascimento between '+QuotedStr(copy3)+' And '+QuotedStr(copy4)+' order by dataNascimento';
Label3.Caption := copy1;
Label4.Caption := copy2;
PesquisaRel.Data.Preview;
end;

end.
