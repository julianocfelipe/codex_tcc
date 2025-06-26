## Overview Geral do Projeto

Este documento fornece uma visão geral de dois sistemas distintos: um sistema de log em PHP e um controlador (MedicoController) para uma API em Java (Spring Framework) para gerenciamento de médicos.

**Sistema de Log (PHP):**

*   **Propósito:** Registrar as ações realizadas por usuários no banco de dados.
*   **Arquitetura:**
    *   Utiliza um sistema de tokens de acesso para identificar usuários.
    *   Registra informações detalhadas sobre as modificações (tabela, ID do registro, descrição da ação).
    *   Depende do arquivo `db_conn.php` para conexão com o banco de dados.
    *   Utiliza as tabelas `access_tokens`, `log_reference` e `system_logs`.
*   **Funções Principais:**
    *   `registra_modificacoes`: Recebe um array de modificações e as registra individualmente.
    *   `registrar_log`:  Registra um evento de log no banco de dados.
*   **Fluxo de Execução:** Uma ação é realizada > `registra_modificacoes` é chamada > para cada modificação, `registrar_log` é chamada > `registrar_log` consulta o usuário pelo token e insere dados nas tabelas de log.
*   **Segurança:** Proteção de tokens de acesso, descrições claras das ações e restrição de acesso às tabelas de log são cruciais.

**API MedicoController (Java - Spring Framework):**

*   **Propósito:**  Gerenciar informações de médicos através de uma API RESTful.
*   **Arquitetura:**
    *   Utiliza o Spring Framework para manipular requisições HTTP.
    *   Interage com o `MedicoRepository` para persistência de dados.
    *   A API é protegida por autenticação JWT (`@SecurityRequirement(name = "bearer-key")`).
*   **Endpoints:**
    *   `POST /medicos`: Cadastra um novo médico.
    *   `GET /medicos`: Lista médicos ativos (paginado).
    *   `PUT /medicos`: Atualiza informações de um médico existente.
    *   `DELETE /medicos/{id}`: Exclui um médico (marca como inativo).
    *   `GET /medicos/{id}`: Detalha informações de um médico.
*   **Classes de Dados (DTOs):**
    *   `DadosCadastroMedico`: Dados para cadastrar um médico.
    *   `DadosAtualizacaoMedico`: Dados para atualizar um médico.
    *   `DadosListagemMedico`: Dados para listagem de médicos.
    *   `DadosDetalhamentoMedico`: Dados detalhados de um médico.
    *   `DadosEndereco`:  Dados de endereço de um médico.
*   **Detalhes dos Métodos:**
    *   Cada método do controlador (cadastrar, listar, atualizar, deletar, detalhar) corresponde a uma operação CRUD na entidade `Medico`.
*   **Validação:** `@Valid` para garantir a integridade dos dados recebidos.
*   **Transacionalidade:** `@Transactional` para garantir a consistência das operações no banco de dados.

## Visualização da Estrutura de Pastas e Arquivos

Para ajudar na compreensão da estrutura do projeto, segue uma visualização simplificada da organização dos arquivos, baseado nas informações da documentação. É importante notar que essa é uma estrutura *presumida* baseada no texto fornecido, e a estrutura real pode variar.

**Estrutura Presumida do Projeto (PHP - Sistema de Log):**

```
raiz_do_projeto/
│
├── db_conn.php          # Arquivo de conexão com o banco de dados (PDO)
├── log_function.php   # Arquivo contendo as funções registra_modificacoes e registrar_log
└── [outras pastas e arquivos do sistema PHP]
```

**Descrição:**

*   `db_conn.php`: Contém a lógica para estabelecer a conexão com o banco de dados, utilizando PDO.  É provável que contenha informações de configuração como o nome do banco de dados, usuário, senha e host.
*   `log_function.php`: Contém as funções principais para registrar as modificações no banco de dados.  Ele importa o arquivo `db_conn.php` para poder acessar a conexão com o banco de dados.
*   `[outras pastas e arquivos do sistema PHP]`: Representa o restante da estrutura do projeto PHP, que não foi detalhada na documentação.  Poderia incluir arquivos para gerenciamento de usuários, tokens, rotas, etc.

**Estrutura Presumida do Projeto (Java - API MedicoController):**

```
raiz_do_projeto/
│
└── src/
    │
    └── main/
        │
        └── java/
            │
            └── med/
                │
                └── voll/
                    │
                    └── api/
                        │
                        ├── controller/
                        │   │
                        │   └── MedicoController.java  # Controlador REST para médicos
                        │
                        ├── domain/
                        │   │
                        │   └── medico/
                        │       │
                        │       ├── Medico.java                  # Entidade Medico (classe de modelo)
                        │       ├── MedicoRepository.java        # Interface para acesso ao banco de dados (JPA Repository)
                        │       ├── DadosCadastroMedico.java     # DTO para cadastro de médicos
                        │       ├── DadosAtualizacaoMedico.java    # DTO para atualização de médicos
                        │       ├── DadosListagemMedico.java    # DTO para listagem de médicos
                        │       ├── DadosDetalhamentoMedico.java   # DTO para detalhamento de médicos
                        │       └── Especialidade.java          # Enum para especialidades médicas
                        │
                        └── DadosEndereco.java               # DTO para informações de endereço

```

**Descrição:**

*   `src/main/java/med/voll/api/controller/MedicoController.java`: Este é o arquivo principal da API, contendo a classe `MedicoController` que define os endpoints REST para gerenciamento de médicos.
*   `src/main/java/med/voll/api/domain/medico/*`: Esta pasta contém as classes relacionadas à entidade `Medico`. Isso inclui a classe `Medico` (que representa a tabela de médicos no banco de dados), a interface `MedicoRepository` (que fornece métodos para acessar e manipular os dados dos médicos no banco de dados), e as classes DTO (Data Transfer Objects) que são usadas para transferir dados entre a API e o cliente.
*   `src/main/java/med/voll/api/DadosEndereco.java`:  Contém a classe `DadosEndereco`, que é um DTO para representar informações de endereço.
*   `[outras pastas e arquivos do projeto Java]`: Representa o restante da estrutura do projeto Java, que não foi detalhada na documentação.  Isso inclui arquivos de configuração do Spring, classes de serviço, exceptions, configurações de segurança, etc.

**Considerações:**

*   **Nomes de Pastas e Pacotes:** A estrutura mostrada é uma convenção comum para projetos Java usando Maven ou Gradle, onde as pastas refletem a estrutura dos pacotes Java.
*   **Frameworks e Bibliotecas:** O projeto Java utiliza o Spring Framework, JPA (Hibernate provavelmente), e Swagger/OpenAPI para documentação.
*   **Dados Faltantes:** Essa é uma representação simplificada. Um projeto real teria mais arquivos e pastas para lidar com configurações, testes, recursos estáticos, etc.

Essa visualização combinada oferece um entendimento da organização dos arquivos em ambos os projetos, facilitando a localização e a compreensão dos componentes principais.
