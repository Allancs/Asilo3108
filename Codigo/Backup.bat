@echo off
@echo *  Fazendo Backup do Banco.
@echo *  Para : OneDrive\Backup\
@echo * 
IF EXIST C:\Users\allan\OneDrive\Backup\BANCO.FDB (
del C:\Users\allan\OneDrive\Backup\BANCO.FDB
) Else (
@echo *  Deletanto Backup Antigo.
)
@echo *  Backup Deletado.
@echo *
copy C:\Asilo\Banco\BANCO.FDB C:\Users\allan\OneDrive\Backup
@echo *  Backup Completo.

