object Modulo: TModulo
  OldCreateOrder = False
  Left = 290
  Top = 164
  Height = 574
  Width = 890
  object Conexao: TSQLConnection
    ConnectionName = 'Asilo'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\Asilo\Banco\BANCO.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'C:\Windows\System32\FBCLIENT.DLL'
    Connected = True
    Left = 65080
    Top = 456
  end
  object sdsAviso: TSQLDataSet
    CommandText = 'select * from AVISOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 16
    object sdsAvisoCOD_AVISO: TIntegerField
      FieldName = 'COD_AVISO'
      Required = True
    end
    object sdsAvisoOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object sdsAvisoDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object cdsAviso: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAviso'
    Left = 192
    Top = 8
    object cdsAvisoCOD_AVISO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_AVISO'
      Required = True
    end
    object cdsAvisoOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
      Size = 1000
    end
    object cdsAvisoDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsAviso: TDataSource
    DataSet = cdsAviso
    Left = 248
    Top = 8
  end
  object dspAviso: TDataSetProvider
    DataSet = sdsAviso
    Left = 104
    Top = 8
  end
  object dsFun: TDataSource
    DataSet = cdsFun
    Left = 248
    Top = 112
  end
  object dsInc: TDataSource
    DataSet = cdsInc
    Left = 248
    Top = 160
  end
  object dsLigacoes: TDataSource
    DataSet = sdsLigacoes
    Left = 248
    Top = 208
  end
  object dsParceiro: TDataSource
    DataSet = cdsParceiro
    Left = 776
    Top = 16
  end
  object cdsFun: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFun'
    Left = 192
    Top = 112
    object cdsFunCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Required = True
    end
    object cdsFunNOME: TStringField
      FieldName = 'NOME'
      Size = 45
    end
    object cdsFunSEXO: TStringField
      FieldName = 'SEXO'
      Size = 8
    end
    object cdsFunDATANASCIMENTO: TStringField
      FieldName = 'DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object cdsFunIDADE: TStringField
      FieldName = 'IDADE'
      Size = 3
    end
    object cdsFunFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 45
    end
    object cdsFunSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
      Size = 2
    end
    object cdsFunCPF: TStringField
      FieldName = 'CPF'
      EditMask = '000\.000\.000\-00;1;_'
      Size = 14
    end
    object cdsFunRG: TStringField
      FieldName = 'RG'
      EditMask = '0.000.000;1;_'
      Size = 9
    end
    object cdsFunCARTEIRATRABALHO: TStringField
      FieldName = 'CARTEIRATRABALHO'
      EditMask = '0000000 0000 aa;1;_'
      Size = 17
    end
    object cdsFunCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '(00)00000-0000;1;_'
      Size = 14
    end
    object cdsFunTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '(00)0000-0000;1;_'
      Size = 13
    end
  end
  object cdsInc: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInc'
    Left = 192
    Top = 160
    object cdsIncCOD_INCIDENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_INCIDENTE'
      Required = True
    end
    object cdsIncCOD_IDOSO: TIntegerField
      DisplayLabel = 'C'#243'digo Idoso'
      FieldName = 'COD_IDOSO'
    end
    object cdsIncNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 45
    end
    object cdsIncDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsIncOBCERVACAO: TStringField
      DisplayLabel = 'OObserva'#231#227'o'
      FieldName = 'OBCERVACAO'
      Size = 100
    end
    object cdsIncDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dspFun: TDataSetProvider
    DataSet = sqsFun
    Left = 104
    Top = 112
  end
  object dspInc: TDataSetProvider
    DataSet = sdsInc
    Left = 104
    Top = 160
  end
  object cdsLigacoes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLigacoes'
    Left = 192
    Top = 208
    object cdsLigacoesCOD_LIGACOES: TIntegerField
      FieldName = 'COD_LIGACOES'
      Required = True
    end
    object cdsLigacoesCOD_IDOSO: TIntegerField
      FieldName = 'COD_IDOSO'
    end
    object cdsLigacoesNOME: TStringField
      FieldName = 'NOME'
      Size = 45
    end
    object cdsLigacoesNOMER: TStringField
      FieldName = 'NOMER'
      Size = 45
    end
    object cdsLigacoesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '\(00)0000-0000;1;_'
      Size = 14
    end
    object cdsLigacoesCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '\(00\)00000\-0000;1;_'
    end
  end
  object cdsParceiro: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParceiro'
    Left = 704
    Top = 16
    object cdsParceiroCOD_PARCEIRO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_PARCEIRO'
      Required = True
    end
    object cdsParceiroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 45
    end
    object cdsParceiroTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      EditMask = '\(00\)0000-0000;1; '
      Size = 13
    end
    object cdsParceiroCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      EditMask = '\(00\)\90000-0000;1; '
      Size = 14
    end
    object cdsParceiroEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 45
    end
    object cdsParceiroEMPRESA: TStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Size = 45
    end
  end
  object dspLigacoes: TDataSetProvider
    DataSet = sdsLigacoes
    Left = 104
    Top = 208
  end
  object dspParceiro: TDataSetProvider
    DataSet = sdsParceiro
    Left = 616
    Top = 16
  end
  object sqsFun: TSQLDataSet
    Active = True
    CommandText = 'select * from FUNCIONARIO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 112
    object sqsFunCOD_FUN: TIntegerField
      FieldName = 'COD_FUN'
      Required = True
    end
    object sqsFunNOME: TStringField
      FieldName = 'NOME'
      Size = 45
    end
    object sqsFunSEXO: TStringField
      FieldName = 'SEXO'
      Size = 8
    end
    object sqsFunDATANASCIMENTO: TStringField
      FieldName = 'DATANASCIMENTO'
      Size = 10
    end
    object sqsFunIDADE: TStringField
      FieldName = 'IDADE'
      Size = 3
    end
    object sqsFunFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 45
    end
    object sqsFunSALARIO: TFMTBCDField
      FieldName = 'SALARIO'
      Precision = 15
      Size = 2
    end
    object sqsFunCPF: TStringField
      FieldName = 'CPF'
      Size = 14
    end
    object sqsFunRG: TStringField
      FieldName = 'RG'
      Size = 9
    end
    object sqsFunCARTEIRATRABALHO: TStringField
      FieldName = 'CARTEIRATRABALHO'
      Size = 17
    end
    object sqsFunCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 14
    end
    object sqsFunTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 13
    end
  end
  object sdsInc: TSQLDataSet
    Active = True
    CommandText = 'select * from INCIDENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 160
  end
  object sdsLigacoes: TSQLDataSet
    Active = True
    CommandText = 'select * from LIGACOES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 208
    object sdsLigacoesCOD_LIGACOES: TIntegerField
      FieldName = 'COD_LIGACOES'
      Required = True
    end
    object sdsLigacoesCOD_IDOSO: TIntegerField
      FieldName = 'COD_IDOSO'
    end
    object sdsLigacoesNOME: TStringField
      FieldName = 'NOME'
      Size = 45
    end
    object sdsLigacoesNOMER: TStringField
      FieldName = 'NOMER'
      Size = 45
    end
    object sdsLigacoesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object sdsLigacoesCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 13
    end
  end
  object sdsParceiro: TSQLDataSet
    Active = True
    CommandText = 'select * from PARCEIRO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 16
  end
  object sdsProfisional: TSQLDataSet
    CommandText = 'select * from PROFISSIONAIS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 64
  end
  object cdsProfisional: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProfisional'
    Left = 704
    Top = 64
    object cdsProfisionalCOD_PRO: TIntegerField
      FieldName = 'COD_PRO'
      Required = True
    end
    object cdsProfisionalNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object c: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object cdsProfisionalCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '!\(99\)\90000-0000;1;_'
    end
    object cdsProfisionalEEMPRESA: TStringField
      FieldName = 'EEMPRESA'
      Size = 100
    end
  end
  object dsProfisional: TDataSource
    DataSet = cdsProfisional
    Left = 776
    Top = 64
  end
  object dspProfisional: TDataSetProvider
    DataSet = sdsProfisional
    Left = 616
    Top = 64
  end
  object dsResidente: TDataSource
    DataSet = cdsResidente
    Left = 776
    Top = 112
  end
  object dsSaude: TDataSource
    DataSet = cdsSaude
    Left = 776
    Top = 168
  end
  object dsTarefa: TDataSource
    DataSet = cdsTarefa
    Left = 776
    Top = 216
  end
  object dsVoluntario: TDataSource
    DataSet = cdsVoluntario
    Left = 776
    Top = 288
  end
  object dspResidente: TDataSetProvider
    DataSet = sdsResidente
    Left = 616
    Top = 112
  end
  object cdsSaude: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaude'
    Left = 704
    Top = 168
    object cdsSaudeCOD_SAUDE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_SAUDE'
      Required = True
    end
    object cdsSaudeCOD_IDOSO: TIntegerField
      DisplayLabel = 'C'#243'digo Idoso'
      FieldName = 'COD_IDOSO'
    end
    object cdsSaudeNOMEM: TStringField
      DisplayLabel = 'Nome Medico (a) / Emfermeiro (a)'
      FieldName = 'NOMEM'
      Size = 45
    end
    object cdsSaudeNOMEI: TStringField
      DisplayLabel = 'Nome Idoso (a)'
      FieldName = 'NOMEI'
      Size = 45
    end
    object cdsSaudeRECEITA: TStringField
      DisplayLabel = 'Receita'
      FieldName = 'RECEITA'
      Size = 100
    end
    object cdsSaudeOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Size = 100
    end
    object cdsSaudeDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object cdsResidente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResidente'
    Left = 704
    Top = 112
    object cdsResidenteCOD_IDOSO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_IDOSO'
      Required = True
    end
    object cdsResidenteNOME: TStringField
      DisplayLabel = 'Nomle'
      FieldName = 'NOME'
      Size = 45
    end
    object cdsResidenteDATANASCIMENTO: TStringField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
    object cdsResidenteIDADE: TStringField
      DisplayLabel = 'Idade'
      FieldName = 'IDADE'
      Size = 3
    end
    object cdsResidenteNASCIONALIDADE: TStringField
      DisplayLabel = 'Nascionalidade'
      FieldName = 'NASCIONALIDADE'
      Size = 45
    end
    object cdsResidenteNATURALIDADE: TStringField
      DisplayLabel = 'Naturalidade'
      FieldName = 'NATURALIDADE'
      Size = 45
    end
    object cdsResidenteESTADOCIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADOCIVIL'
      Size = 45
    end
    object cdsResidenteRELIGIAO: TStringField
      DisplayLabel = 'Religi'#227'o'
      FieldName = 'RELIGIAO'
      Size = 45
    end
    object cdsResidentePROFISSAO: TStringField
      DisplayLabel = 'Profiss'#227'o'
      FieldName = 'PROFISSAO'
      Size = 45
    end
    object cdsResidenteRG: TStringField
      FieldName = 'RG'
      EditMask = '0\.000\.000;1;_'
      Size = 9
    end
    object cdsResidentePAI: TStringField
      DisplayLabel = 'Nome do Pai'
      FieldName = 'PAI'
      Size = 45
    end
    object cdsResidenteMAE: TStringField
      DisplayLabel = 'Nome da M'#227'e'
      FieldName = 'MAE'
      Size = 45
    end
    object cdsResidenteOBS: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBS'
      Size = 1000
    end
    object cdsResidenteDATAENTRADA: TDateField
      DisplayLabel = 'Data de Entrada'
      FieldName = 'DATAENTRADA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsResidenteINFORMACOES: TStringField
      DisplayLabel = 'Informa'#231#245'es'
      FieldName = 'INFORMACOES'
      Size = 100
    end
    object cdsResidenteDATASAIDA: TDateField
      DisplayLabel = 'Data de Saida'
      FieldName = 'DATASAIDA'
      EditMask = '!99/99/0000;1;_'
    end
    object cdsResidenteCPF: TStringField
      DisplayWidth = 16
      FieldName = 'CPF'
      EditMask = '000\.000\.000\-00;1;_'
      Size = 16
    end
  end
  object cdsTarefa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTarefa'
    Left = 704
    Top = 216
    object cdsTarefaCOD_TAREFA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_TAREFA'
      Required = True
    end
    object cdsTarefaTAREFA: TStringField
      DisplayLabel = 'Tarefa'
      FieldName = 'TAREFA'
      Size = 1000
    end
    object cdsTarefaDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dspSaude: TDataSetProvider
    DataSet = sdsSaude
    Left = 616
    Top = 168
  end
  object dspTarefa: TDataSetProvider
    DataSet = sdsTarefa
    Left = 616
    Top = 216
  end
  object cdsVoluntario: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVoluntario'
    Left = 704
    Top = 288
    object cdsVoluntarioCOD_VOLUNTARIO: TIntegerField
      FieldName = 'COD_VOLUNTARIO'
      Required = True
    end
    object cdsVoluntarioNOME: TStringField
      FieldName = 'NOME'
      Size = 45
    end
    object cdsVoluntarioTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '\(00\)0000-0000;1; '
      Size = 13
    end
    object cdsVoluntarioCELULAR: TStringField
      FieldName = 'CELULAR'
      EditMask = '\(00\)\90000-0000;1; '
      Size = 14
    end
    object cdsVoluntarioEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dspVoluntario: TDataSetProvider
    DataSet = sdsVoluntario
    Left = 616
    Top = 288
  end
  object sdsResidente: TSQLDataSet
    Active = True
    CommandText = 'select * from RESIDENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 112
  end
  object sdsSaude: TSQLDataSet
    Active = True
    CommandText = 'select * from SAUDE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 168
  end
  object sdsTarefa: TSQLDataSet
    Active = True
    CommandText = 'select * from TAREFA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 216
  end
  object sdsVoluntario: TSQLDataSet
    Active = True
    CommandText = 'select * from VOLUNTARIO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 528
    Top = 288
  end
  object dsDespesa: TDataSource
    DataSet = sdsDespesas
    Left = 248
    Top = 64
  end
  object cdsDespesas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDespesas'
    Left = 192
    Top = 64
    object cdsDespesasCOD_DESPESA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD_DESPESA'
      Required = True
    end
    object cdsDespesasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 45
    end
    object cdsDespesasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object cdsDespesasVALOR: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      FixedChar = True
      Size = 4
    end
    object cdsDespesasDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dspDespesas: TDataSetProvider
    DataSet = sdsDespesas
    Left = 104
    Top = 64
  end
  object sdsDespesas: TSQLDataSet
    Active = True
    CommandText = 'select * from DESPESAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 64
  end
  object dsEmail: TDataSource
    DataSet = sdsEmail
    Left = 248
    Top = 256
  end
  object cdsEmail: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmail'
    Left = 192
    Top = 256
    object cdsEmailID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Required = True
    end
    object cdsEmailSMTP: TStringField
      FieldName = 'SMTP'
      Size = 50
    end
    object cdsEmailPORT: TStringField
      DisplayLabel = 'Port'
      FieldName = 'PORT'
      Size = 3
    end
    object cdsEmailEMAIL: TStringField
      DisplayLabel = 'Usuario'
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsEmailSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 50
    end
  end
  object dspEmail: TDataSetProvider
    DataSet = sdsEmail
    Left = 104
    Top = 256
  end
  object sdsEmail: TSQLDataSet
    Active = True
    CommandText = 'select * from EMAIL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 256
  end
  object cdsAvisos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAvisos'
    Left = 392
    Top = 8
    object cdsAvisosCOD_AVISO: TIntegerField
      FieldName = 'COD_AVISO'
      Required = True
    end
    object cdsAvisosOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object cdsAvisosDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dsAvisos: TDataSource
    DataSet = cdsAvisos
    Left = 440
    Top = 8
  end
  object dspAvisos: TDataSetProvider
    DataSet = sdsAviso
    Left = 352
    Top = 8
  end
  object sdsUser: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Conexao
    DataSet.CommandText = 'select * from USUARIOS'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 16
    Top = 360
    object sdsUserID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsUserUSU_NOME: TStringField
      FieldName = 'USU_NOME'
      Required = True
      Size = 40
    end
    object sdsUserUSU_EMAIL: TStringField
      FieldName = 'USU_EMAIL'
      Required = True
      Size = 40
    end
    object sdsUserUSU_LOGIN: TStringField
      FieldName = 'USU_LOGIN'
      Required = True
      Size = 40
    end
    object sdsUserUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Required = True
      Size = 40
    end
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 240
    Top = 312
  end
  object sqlDSLogin: TSQLDataSet
    CommandText = 'select * from USUARIOS'
    DataSource = dsUser
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 312
    object sqlDSLoginID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sqlDSLoginUSU_NOME: TStringField
      FieldName = 'USU_NOME'
      Required = True
      Size = 40
    end
    object sqlDSLoginUSU_EMAIL: TStringField
      FieldName = 'USU_EMAIL'
      Required = True
      Size = 40
    end
    object sqlDSLoginUSU_LOGIN: TStringField
      FieldName = 'USU_LOGIN'
      Required = True
      Size = 40
    end
    object sqlDSLoginUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Required = True
      Size = 40
    end
  end
  object cdsUser: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUser'
    Left = 192
    Top = 312
    object cdsUserID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsUserUSU_NOME: TStringField
      FieldName = 'USU_NOME'
      Required = True
      Size = 40
    end
    object cdsUserUSU_EMAIL: TStringField
      FieldName = 'USU_EMAIL'
      Required = True
      Size = 40
    end
    object cdsUserUSU_LOGIN: TStringField
      FieldName = 'USU_LOGIN'
      Required = True
      Size = 40
    end
    object cdsUserUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
      Required = True
      Size = 40
    end
  end
  object dspUser: TDataSetProvider
    DataSet = sqlDSLogin
    Left = 104
    Top = 312
  end
  object sdUser: TSQLDataSet
    CommandText = 'select * from USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 16
    Top = 416
  end
  object cdUser: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsUsers'
    Left = 200
    Top = 400
    object cdUserID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdUserUSU_NOME: TStringField
      FieldName = 'USU_NOME'
      Size = 40
    end
    object cdUserUSU_EMAIL: TStringField
      FieldName = 'USU_EMAIL'
      Size = 7
    end
    object cdUserUSU_LOGIN: TStringField
      FieldName = 'USU_LOGIN'
      Size = 40
    end
    object cdUserUSU_SENHA: TStringField
      FieldName = 'USU_SENHA'
    end
  end
  object dsUsers: TDataSetProvider
    DataSet = sdUser
    Left = 104
    Top = 408
  end
  object User: TDataSource
    AutoEdit = False
    DataSet = cdUser
    Left = 264
    Top = 392
  end
end
