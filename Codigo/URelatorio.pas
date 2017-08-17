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
    TodosT: TCheckBox;
    ProfissionaisT: TCheckBox;
    ParceirosT: TCheckBox;
    ResponsaveisT: TCheckBox;
    FuncionariosT: TCheckBox;
    Residente: TGroupBox;
    TodosR: TCheckBox;
    Aniversariantes: TCheckBox;
    DadosR: TCheckBox;
    Responsavel: TGroupBox;
    Todosres: TCheckBox;
    NumeroR: TCheckBox;
    sdsAux: TSimpleDataSet;
    dsAux: TDataSource;
    Timer1: TTimer;
    Label2: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure TodosEClick(Sender: TObject);
    procedure VoluntariosEClick(Sender: TObject);
    procedure ParceirosEClick(Sender: TObject);
    procedure TodosTClick(Sender: TObject);
    procedure ProfissionaisTClick(Sender: TObject);
    procedure ParceirosTClick(Sender: TObject);
    procedure ResponsaveisTClick(Sender: TObject);
    procedure FuncionariosTClick(Sender: TObject);
    procedure TodosresClick(Sender: TObject);
    procedure NumeroRClick(Sender: TObject);
    procedure TodosRClick(Sender: TObject);
    procedure AniversariantesClick(Sender: TObject);
    procedure DadosRClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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

procedure TRelatorio.TodosEClick(Sender: TObject);
begin
If TodosE.Checked = true
then
begin

VoluntariosE.Enabled := false;
ParceirosE.Enabled := False;
Telefone.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Telefone.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
VoluntariosE.Enabled := True;
ParceirosE.Enabled := True
end
end;

procedure TRelatorio.VoluntariosEClick(Sender: TObject);
begin
If (VoluntariosE.Checked = true)
then
begin
Telefone.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
TodosE.Enabled := false;
sdsAux.Close;
sdsAux.DataSet.CommandText := 'select EMAIL ,NOME from VOLUNTARIO';
sdsAux.Open;
end
else
begin
Telefone.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
TodosE.Enabled := true;
end;
IF VoluntariosE.Checked = True and ParceirosE.Checked = true
then
begin
Telefone.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
TodosE.Enabled := false;
sdsAux.Close;
sdsAux.DataSet.CommandText := 'select PARCEIRO.EMAIL ,PARCEIRO.NOME, VOLUNTARIO.EMAIL, VOLUNTARIO.NOME from VOLUNTARIO, PARCEIRO';
sdsAux.Open;
end
else
begin
Telefone.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
TodosE.Enabled := true;
end
end;

procedure TRelatorio.ParceirosEClick(Sender: TObject);
begin
If ParceirosE.Checked = true
then
begin
Telefone.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
sdsAux.Close;
sdsAux.DataSet.CommandText := 'select EMAIL ,NOME from PARCEIRO';
sdsAux.Open;
end
else
begin
Telefone.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end;
IF VoluntariosE.Checked = True and ParceirosE.Checked = true
then
begin
Telefone.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
TodosE.Enabled := false;
sdsAux.Close;
sdsAux.DataSet.CommandText := 'select PARCEIRO.EMAIL ,PARCEIRO.NOME, VOLUNTARIO.EMAIL, VOLUNTARIO.NOME from VOLUNTARIO, PARCEIRO';
sdsAux.Open;
end
else
begin
Telefone.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
TodosE.Enabled := true;
end
end;

procedure TRelatorio.TodosTClick(Sender: TObject);
begin
If TodosT.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end
end;

procedure TRelatorio.ProfissionaisTClick(Sender: TObject);
begin
If ProfissionaisT.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end
end;

procedure TRelatorio.ParceirosTClick(Sender: TObject);
begin
If ParceirosT.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end
end;

procedure TRelatorio.ResponsaveisTClick(Sender: TObject);
begin
If ResponsaveisT.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end
end;

procedure TRelatorio.FuncionariosTClick(Sender: TObject);
begin
If FuncionariosT.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Responsavel.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Responsavel.Enabled := True;
end
end;

procedure TRelatorio.TodosresClick(Sender: TObject);
begin
If Todosres.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Telefone.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Telefone.Enabled := True;
end
end;

procedure TRelatorio.NumeroRClick(Sender: TObject);
begin
If NumeroR.Checked = true
then
begin
Email.Enabled := false;
Residente.Enabled := false;
Telefone.Enabled := false;
end
else
begin
Email.Enabled := True;
Residente.Enabled := True;
Telefone.Enabled := True;
end
end;

procedure TRelatorio.TodosRClick(Sender: TObject);
begin
If TodosR.Checked = true
then
begin
Email.Enabled := false;
Responsavel.Enabled := false;
Telefone.Enabled := false;
end
else
begin
Email.Enabled := True;
Responsavel.Enabled := True;
Telefone.Enabled := True;
end
end;

procedure TRelatorio.AniversariantesClick(Sender: TObject);
begin
If Aniversariantes.Checked = true
then
begin
Email.Enabled := false;
Responsavel.Enabled := false;
Telefone.Enabled := false;
end
else
begin
Email.Enabled := True;
Responsavel.Enabled := True;
Telefone.Enabled := True;
end
end;

procedure TRelatorio.DadosRClick(Sender: TObject);
begin
If DadosR.Checked = true
then
begin
Email.Enabled := false;
Responsavel.Enabled := false;
Telefone.Enabled := false;
end
else
begin
Email.Enabled := True;
Responsavel.Enabled := True;
Telefone.Enabled := True;
end
end;

procedure TRelatorio.Timer1Timer(Sender: TObject);
begin
If TodosE.Checked = true
then
begin
sdsAux.Close;
sdsAux.DataSet.CommandText := 'select EMAIL ,NOME from VOLUNTARIO';
sdsAux.Open;
end
end;

procedure TRelatorio.Button1Click(Sender: TObject);
begin
If TodosE.Checked = true
then
begin

end
else if VoluntariosE.Checked = true
then
begin
PesquisaRel.volu.Preview;
end
end;

procedure TRelatorio.BitBtn1Click(Sender: TObject);
begin
  sdsAux.Close;
sdsAux.DataSet.CommandText := 'select * from VOLUNTARIO';
  sdsAux.Open;
end;

end.
