# Desafio DevOps VExpenses - Terraform

## Descrição Técnica

### Infraestrutura Criada

O código Terraform cria a seguinte infraestrutura na AWS:

- **VPC (Rede Privada)**: Uma rede virtual principal com bloco CIDR `10.0.0.0/16`.
- **Subnet**: Subrede `10.0.1.0/24` associada à VPC.
- **Internet Gateway**: Permite que a instância EC2 se comunique com a internet.
- **Tabela de Rotas**: Configura o tráfego para a internet via o Internet Gateway.
- **Grupo de Segurança**: Define as regras de segurança da instância EC2, permitindo SSH (porta 22) e liberando o tráfego de saída.
- **Par de Chaves (Key Pair)**: Gera uma chave SSH para acesso à instância.
- **Instância EC2**: Máquina virtual rodando Debian 12.

### Recursos Criados

- **VPC (`aws_vpc`)**: Criada com o bloco CIDR `10.0.0.0/16`.
- **Subnet (`aws_subnet`)**: Subrede `10.0.1.0/24`, alocada na zona de disponibilidade `us-east-1a`.
- **Internet Gateway (`aws_internet_gateway`)**: Atrelado à VPC, permitindo comunicação com a internet.
- **Tabela de Rotas (`aws_route_table`)**: Direciona o tráfego da subnet para o Internet Gateway.
- **Grupo de Segurança (`aws_security_group`)**: Permite tráfego SSH (porta 22) e todo tráfego de saída.
- **Instância EC2**: Instância rodando Debian 12 com o Nginx automaticamente instalado.

## Melhorias Implementadas

### Segurança
- Restrição de acesso SSH à instância EC2 para um endereço IP específico.
- Regras de saída configuradas para permitir apenas o tráfego necessário.

### Automação
- Instalação e inicialização automática do Nginx utilizando o recurso `user_data`.

### Outras Melhorias
- Parâmetros como nome do projeto e candidato foram adicionados para facilitar a reutilização do código.

### Principais Alterações
- Segurança:
    Alterei a regra do grupo de segurança para permitir SSH apenas de um endereço IP específico.
  
- Automação da Instalação do Nginx:
    Adicionei a seção user_data na instância EC2, que irá instalar e iniciar o Nginx automaticamente ao criar a instância.

- Variáveis de Projeto:
    Mantive as variáveis projeto e candidato para facilitar a personalização e reutilização do código.

  ## Instruções de Uso

### Pré-requisitos
- **Conta AWS**: Você precisa de uma conta na AWS com permissões adequadas para criar recursos.
- **AWS CLI**: Certifique-se de que a AWS Command Line Interface (CLI) esteja instalada e configurada. Você pode seguir [este guia](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) para instalar e configurar.
- **Terraform**: O Terraform deve estar instalado em sua máquina. Siga as instruções de instalação na [documentação oficial do Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

### Passos para Executar

 **Clone o repositório**:
   ```bash
   git clone <link-do-repositorio>
   cd <nome-do-repositorio>


