#!/bin/bash

  # Diretorio de backup
  Origem="/home/fernandovictor/MeusScripts"

  # Diretorio onde backup vai ser armazenado 
  Destino="/home/fernandovictor/Backups/Arquivos.sh"
  
  # Data e hora do backup
  Data_Hora=$(date "+%d-%m-%Y")

  # Nome do arquivo 
  Nome_Backup="backup_$Data_Hora.tar.gz"

# Criar Backup
tar -czvf $Destino/$Nome_Backup $Origem 

# Verificar se meu backup foi criado com sucesso 
if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso: $Destino/$Nome_Backup"
else 
    echo "Erro ao criar backup."
    exit 1
fi 

# Excluir backups antigos (mais de 7 dias)
find $Destino -type f -name "backup_*.tar.gz" -mtime +7 -exec rm -v {} \;

echo "Backups com mais de 7 dias excluidos com sucesso."  
  
