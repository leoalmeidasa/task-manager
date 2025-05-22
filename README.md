# Task Manager

## Visão Geral

O Task Manager é uma aplicação web robusta desenvolvida para gerenciar tarefas e projetos de forma eficiente e colaborativa. Construída com Ruby on Rails, esta aplicação oferece uma interface intuitiva para criação, atribuição e acompanhamento de tarefas, permitindo que equipes organizem seu trabalho de maneira estruturada e produtiva.

A aplicação foi projetada com foco na experiência do usuário, implementando boas práticas de desenvolvimento e seguindo padrões modernos de arquitetura de software. O sistema permite o gerenciamento completo do ciclo de vida de tarefas, desde a criação até a conclusão, com recursos de priorização, categorização por status e atribuição a membros do projeto.

## Arquitetura e Estrutura

O Task Manager segue uma arquitetura bem definida, organizada em componentes modulares que facilitam a manutenção e extensão do sistema:

### Modelos

O sistema é construído em torno de vários modelos principais que representam as entidades do domínio:

**User**: Representa os usuários do sistema, com informações de autenticação gerenciadas pelo Devise.

**Project**: Entidade central que agrupa tarefas relacionadas e define o escopo de trabalho.

**Task**: Representa unidades individuais de trabalho, com atributos como título, descrição, data de vencimento, prioridade e status.

**Priority**: Define níveis de prioridade para as tarefas (baixa, média, alta).

**Status**: Representa os diferentes estados de uma tarefa (pendente, em progresso, concluída).

**ProjectMember**: Estabelece a relação entre usuários e projetos, permitindo colaboração em equipe.

### Controllers

Os controllers implementam a lógica de negócio e gerenciam as interações entre os modelos e as views, seguindo o princípio de "controllers enxutos, modelos gordos" para manter o código organizado e testável.

### Views

As views são construídas com uma combinação de ERB (Embedded Ruby) e Bootstrap, oferecendo uma interface responsiva e amigável. O sistema utiliza partials para reutilização de componentes e layouts consistentes.

### Jobs

A aplicação utiliza Solid Queue para processamento em background, permitindo que operações demoradas sejam executadas de forma assíncrona sem bloquear a interface do usuário.

## Funcionalidades Principais

O Task Manager oferece um conjunto abrangente de funcionalidades para gerenciamento eficiente de tarefas e projetos:

### Gerenciamento de Usuários

Sistema completo de autenticação com registro, login e recuperação de senha.
Perfis de usuário com informações personalizáveis.
Controle de acesso baseado em papéis para diferentes níveis de permissão.

### Gerenciamento de Projetos

Criação e edição de projetos com título, descrição e membros associados.
Dashboard de projetos com visão geral do progresso e atividades recentes.
Adição e remoção de membros do projeto com diferentes níveis de acesso.

### Gerenciamento de Tarefas

Criação, edição e exclusão de tarefas com campos para título, descrição, data de vencimento, prioridade e status.
Atribuição de tarefas a membros específicos do projeto.
Filtros e ordenação de tarefas por diferentes critérios (status, prioridade, data).
Validações para garantir a integridade dos dados, como verificação de datas no futuro e campos obrigatórios.

### Interface Responsiva

Design adaptável para diferentes dispositivos, desde desktops até smartphones.
Navegação intuitiva com feedback visual para ações do usuário.
Componentes interativos para melhorar a experiência do usuário.

## Requisitos de Sistema

Para executar o Task Manager em ambiente de desenvolvimento ou produção, são necessários os seguintes componentes:

Ruby 3.4.3 ou superior
Rails 8.0.2 ou superior
PostgreSQL 12 ou superior
Node.js e Yarn para gerenciamento de assets
Docker e Docker Compose (opcional, para containerização)

## Instalação e Configuração

### Ambiente de Desenvolvimento

Para configurar o ambiente de desenvolvimento, siga os passos abaixo:

1. Clone o repositório:

```bash
git clone https://github.com/leoalmeidasa/task-manager.git
cd task-manager
```

2. Instale as dependências:

```bash
bundle install
yarn install
```

3. Configure o banco de dados:

```bash
cp config/database.yml.example config/database.yml
# Edite o arquivo database.yml com suas configurações locais
rails db:create
rails db:migrate
rails db:seed
```

4. Inicie o servidor:

```bash
rails server
```

5. Acesse a aplicação em seu navegador:

```
http://localhost:3000
```

### Usando Docker

Para executar a aplicação usando Docker, siga estas instruções:

1. Certifique-se de ter Docker e Docker Compose instalados.

2. Clone o repositório:

```bash
git clone https://github.com/leoalmeidasa/task-manager.git
cd task-manager
```

3. Construa e inicie os containers:

```bash
docker-compose build
docker-compose up
```

4. Em outro terminal, configure o banco de dados:

```bash
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
```

5. Acesse a aplicação em seu navegador:

```
http://localhost:3000
```

## Deploy em Produção

O Task Manager está configurado para deploy usando Kamal, uma ferramenta moderna para implantação de aplicações Rails em containers Docker:

1. Configure as variáveis de ambiente necessárias:

```bash
cp .env.example .env.production
# Edite o arquivo .env.production com suas configurações de produção
```

2. Configure o Kamal:

```bash
cp .kamal/deploy.yml.example .kamal/deploy.yml
# Edite o arquivo deploy.yml com suas configurações de servidor
```

3. Execute o deploy:

```bash
bundle exec kamal setup
bundle exec kamal deploy
```

A aplicação também pode ser implantada no Heroku, como demonstrado pela instância em execução em:
[task-manager-leo-898e46902197.herokuapp.com](https://task-manager-leo-898e46902197.herokuapp.com/)

### Análise de Código

Verifique a qualidade do código com:

```bash
bundle exec rubocop
bundle exec brakeman
```

## Contribuição

Contribuições para o Task Manager são bem-vindas. Para contribuir:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Implemente suas mudanças
4. Execute os testes para garantir que tudo está funcionando
5. Faça commit das suas alterações (`git commit -am 'Adiciona nova funcionalidade'`)
6. Envie para o branch (`git push origin feature/nova-funcionalidade`)
7. Crie um Pull Request

## Melhorias Futuras

O Task Manager está em constante evolução, e algumas melhorias planejadas incluem:

Implementação de um sistema de notificações em tempo real para atualizações de tarefas.
Integração com calendários externos (Google Calendar, Outlook).
Adição de gráficos e relatórios para análise de produtividade.
Implementação de um sistema de comentários em tarefas para facilitar a comunicação.
Expansão das opções de personalização da interface do usuário.
Integração com ferramentas de terceiros como Slack, Trello e GitHub.

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo LICENSE para detalhes.

## Contato

Para questões, sugestões ou feedback, entre em contato com o desenvolvedor:

Leonardo Almeida - [GitHub](https://github.com/leoalmeidasa)

Link do projeto: [https://github.com/leoalmeidasa/task-manager](https://github.com/leoalmeidasa/task-manager)
