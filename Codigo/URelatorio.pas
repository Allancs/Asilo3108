unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, FMTBcd, DB, DBClient, SimpleDS,
  SqlExpr, QRCtrls, QuickRpt, Buttons,
  MPlayer;

type
  TRelatorio = class(TForm)
    Baixo: TPanel;
    Image1: TImage;
    LadoEsquerdo: TPanel;
    Email: TGroupBox;
    Telefone: TGroupBox;
    Residente: TGroupBox;
    Responsavel: TGroupBox;
    sdsTodos: TSimpleDataSet;
    dsAux: TDataSource;
    sdsVolu: TSimpleDataSet;
    volu: TDataSource;
    sdsTodosEMAIL: TStringField;
    sdsTodosNOME: TStringField;
    RlParceiros: TBitBtn;
    RlVolun: TBitBtn;
    RLTodos: TBitBtn;
    sdsPar: TSimpleDataSet;
    DataSource1: TDataSource;
    sdsParNOME: TStringField;
    sdsParEMAIL: TStringField;
    sdsVoluNOME: TStringField;
    sdsVoluEMAIL: TStringField;
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
    responsaveistele: TBitBtn;
    funtele: TBitBtn;
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
    Label3: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    AniversarioCOD_IDOSO: TIntegerField;
    AniversarioNOME: TStringField;
    AniversarioDATANASCIMENTO: TStringField;
    AniversarioIDADE: TStringField;
    AniversarioNASCIONALIDADE: TStringField;
    AniversarioNATURALIDADE: TStringField;
    AniversarioESTADOCIVIL: TStringField;
    AniversarioRELIGIAO: TStringField;
    AniversarioPROFISSAO: TStringField;
    AniversarioRG: TStringField;
    AniversarioCPF: TStringField;
    AniversarioPAI: TStringField;
    AniversarioMAE: TStringField;
    AniversarioOBS: TStringField;
    AniversarioDATAENTRADA: TDateField;
    AniversarioINFORMACOES: TStringField;
    AniversarioDATASAIDA: TDateField;
    Cancel: TBitBtn;
    todosmeial: TRadioButton;
    VoluntariosE: TRadioButton;
    ParceirosE: TRadioButton;
    Todosres: TRadioButton;
    ParceirosT: TRadioButton;
    ProfissionaisT: TRadioButton;
    ResponsaveisT: TRadioButton;
    FuncionariosT: TRadioButton;
    TodosR: TRadioButton;
    Aniversariantes: TRadioButton;
    procedure RLTodosClick(Sender: TObject);
    procedure RlParceirosClick(Sender: TObject);
    procedure RlVolunClick(Sender: TObject);
    procedure todosrespClick(Sender: TObject);
    procedure ptClick(Sender: TObject);
    procedure ParceirosClick(Sender: TObject);
    procedure responsaveisteleClick(Sender: TObject);
    procedure funteleClick(Sender: TObject);
    procedure TodosresidentesssClick(Sender: TObject);
    procedure AniClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure todosmeial1Click(Sender: TObject);
    procedure ParceirosE1Click(Sender: TObject);
    procedure VoluntariosE1Click(Sender: TObject);
    procedure TodosressClick(Sender: TObject);
    procedure ProfissionaisTtClick(Sender: TObject);
    procedure ParceirosTsClick(Sender: TObject);
    procedure ResponsaveisTsClick(Sender: TObject);
    procedure FuncionariosTsClick(Sender: TObject);
    procedure TodosRsClick(Sender: TObject);
    procedure AniversarianteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Relatorio: TRelatorio;

implementation

uses UModulo, UPesquisaRel, UResponsavel,
  UVoluntarios;

{$R *.dfm}


procedure TRelatorio.RLTodosClick(Sender: TObject);
begin
sdsTodos.Close;
sdsTodos.DataSet.CommandText := 'SELECT nome, email FROM voluntario union all SELECT nome, email FROM parceiro';

sdsTodos.Open;
Pesquisarel.Email.Caption := 'Todos email cadastrados de Parceiros e Voluntarios';

PesquisaRel.vol.Preview;
end;

procedure TRelatorio.RlParceirosClick(Sender: TObject);
begin
sdsPar.Close;
sdsPar.DataSet.CommandText := 'select EMAIL , Nome FROM VOLUNTARIO';
sdsPar.Open;

Pesquisarel.Email.Caption := 'Todos email cadastrados de Parceiros';
PesquisaRel.par.Preview;
end;

procedure TRelatorio.RlVolunClick(Sender: TObject);
begin

sdsVolu.Close;
sdsVolu.DataSet.CommandText := 'select EMAIL , Nome FROM PARCEIRO';
sdsVolu.Open;
Pesquisarel.Email.Caption := 'Todos email cadastrados de Voluntários';
PesquisaRel.Vol.Preview;
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

procedure TRelatorio.responsaveisteleClick(Sender: TObject);
begin
Responsa.Close;
Responsa.DataSet.CommandText := 'Select NOMER, TELEFONE, CELULAR, NOME from LIGACOES';
Responsa.Open;

PesquisaRel.ResponsaveisAgenda.Preview;
end;

procedure TRelatorio.funteleClick(Sender: TObject);
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
DtaAtual, copy1, copy2,a,b,c,d,e,f,g : string;
begin
            DtaAtual := DateToStr(Date);
            copy1 := (Copy(DateToStr(Date), 4, 2));
            copy2 := (Copy(DateToStr(Date), 7, 10));

            a := QuotedStr('/');
            b := QuotedStr('.');
            c := QuotedStr(',');
            d := QuotedStr(',');
            e := QuotedStr('1');
            f := QuotedStr('31');
            g := QuotedStr(copy1);
          // Troca a / por . (Firebird guarda a data com . e nao /)

Aniversario.Close;
//Aniversario.DataSet.CommandText := 'Select Nome, DataNascimento, Idade From Residente Where dataNascimento between '+QuotedStr(copy3)+' And '+QuotedStr(copy4)+' order by dataNascimento';
Aniversario.DataSet.CommandText := 'SELECT * FROM Residente WHERE(EXTRACT(MONTH FROM CAST (replace(datanascimento,'+a+','+b+') AS date))between '+g+' and '+g+') and (EXTRACT(day FROM CAST (replace(datanascimento,'+a+','+b+') AS date)) between '+e+' and '+f+')';
               Edit1.Text := 'SELECT * FROM Residente WHERE(EXTRACT(MONTH FROM CAST (replace(datanascimento,'+a+','+b+') AS date))between '+g+' and '+g+') and (EXTRACT(day FROM CAST (replace(datanascimento,'+a+','+b+') AS date)) between '+e+' and '+f+')';
Aniversario.Open;

Label2.Caption := 'SELECT * FROM Residente WHERE(EXTRACT(MONTH FROM CAST (replace(datanascimento,'+a+','+b+')';
Label3.Caption :=  'AS date))between '+g+' and '+g+') and (EXTRACT(day FROM CAST (replace(datanascimento,';
Label4.Caption :=a+','+b+') AS date)) between '+e+' and '+f+') replace(p.valor_venda,'+c+c+d+')';




PesquisaRel.Data.Preview;
end;

procedure TRelatorio.CancelClick(Sender: TObject);
begin
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end;

procedure TRelatorio.todosmeial1Click(Sender: TObject);
begin
If todosmeial.Checked = true
then
begin
todosmeial.Checked := true;
RLTodos.Visible := true;
//RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
//todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.ParceirosE1Click(Sender: TObject);
begin
If Parceirose.Checked = true
then
begin
Parceirose.Checked := true;
RlParceiros.Visible     := true;
RLTodos.visible := false;
RlVolun.visible := false;
//RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
//parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;




procedure TRelatorio.VoluntariosE1Click(Sender: TObject);
begin
If Voluntariose.Checked = true
then
begin
Voluntariose.Checked := true;
RlVolun.Visible := true;
RLTodos.visible := false;
//RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
//voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.TodosressClick(Sender: TObject);
begin
If Todosres.Checked = true
then
begin
Todosres.Checked := true;
todosresp.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
//todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
//todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.ProfissionaisTtClick(Sender: TObject);
begin
If profissionaist.Checked = true
then
begin
profissionaist.Checked := true;
pt.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
//pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
//profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.ParceirosTsClick(Sender: TObject);
begin
If parceirost.Checked = true
then
begin
parceirost.Checked := true;
Parceiros.Visible       := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
//Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
//parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.ResponsaveisTsClick(Sender: TObject);
begin
If responsaveist.Checked = true
then
begin
responsaveist.Checked := true;
responsaveistele.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
//responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
//responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.FuncionariosTsClick(Sender: TObject);
begin
If funcionariost.Checked = true
then
begin
funcionariost.Checked := true;
funtele.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
//funtele.visible := false;
Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
//funcionariost.Checked   := false;
todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.TodosRsClick(Sender: TObject);
begin
If todosr.Checked = true
then
begin
todosr.Checked := true;
Todosresidentesss.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
//Todosresidentesss.visible := false;
Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
//todosr.Checked          := false;
aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

procedure TRelatorio.AniversarianteClick(Sender: TObject);
begin
If aniversariantes.Checked = true
then
begin
aniversariantes.Checked := true;
Ani.Visible := true;
RLTodos.visible := false;
RlVolun.visible := false;
RlParceiros.visible := false;
todosresp.visible := false;
pt.visible := false;
Parceiros.visible := false;
responsaveistele.visible := false;
funtele.visible := false;
Todosresidentesss.visible := false;
//Ani.visible := false;
todosmeial.Checked      := false;
voluntariose.Checked    := false;
parceirose.Checked      := false;
todosres.Checked        := false;
profissionaist.Checked  := false;
parceirost.Checked      := false;
responsaveist.Checked   := false;
funcionariost.Checked   := false;
todosr.Checked          := false;
//aniversariantes.Checked := false;
end
else
begin
cancel.Click;
end;
end;

end.
