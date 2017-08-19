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
    Label1: TLabel;
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
    procedure RLTodosClick(Sender: TObject);
    procedure RlVolunClick(Sender: TObject);
    procedure RlParceirosClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure todosrespClick(Sender: TObject);
    procedure ptClick(Sender: TObject);
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
PesquisaRel.TelefonePro.Preview;
end;

end.
