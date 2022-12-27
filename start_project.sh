#! /bin/bash

# Instala as dependências do projeto
./run.sh composer install

# Gera chaves públicas/privadas para uso na aplicação - API Lexik
./run.sh bin/console lexik:jwt:generate-keypair

# Da permissão de escrita e leitura pasta /var/*
./run.sh chmod 777 /var/ -R

# Cria o banco de dados
./run.sh bin/console doctrine:database:create

# Monta schema no banco de dados
./run.sh bin/console doctrine:schema:update --force

# Cria usuário administrador
./run.sh bin/console security:create-admin joao@gmail.com joao@gmail.com 7e8d7e5ccbddfd9576be61e3ab86aa73

# Cria usuário padrão
./run.sh bin/console security:create-user joao@gmail.com joao@gmail.com 7e8d7e5ccbddfd9576be61e3ab86aa73

# Faz instalação dos assets
./run.sh bin/console assets:install

# Limpa o cache do projeto
./run.sh bin/console cache:clear
