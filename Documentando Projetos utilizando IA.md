<p align="center">
  <img src="https://github.com/user-attachments/assets/01d016b8-5a21-4d6c-a7aa-76c6f3b5083a" alt="Mega Man Robots API" width="400"/>
  <br />
  <b style="font-size: 72px;">Mega Man Robots API</b>
  <br />
  <sub><sup style="font-size: 28px;">(MEGA-MAN-ROBOTS)</sup></sub>
  <br />


# 🤖 MegaApiDotnetCor

# Sobre a API

- API REST em .NET Core que fornece dados em JSON sobre os robôs (bosses) do universo Mega Man. Ideal para estudos, integrações e projetos de exemplo com C# e Entity Framework Core.
- Desenvolvido com Entity Framework Core e tecnologias modernas do .NET, fornecendo uma API robusta para acessar dados dos robôs do Mega Man.

---

## Endpoints

| Método | Endpoint             | Descrição                        |
|--------|--------------------|----------------------------------|
| GET    | `/api/v1/robots`    | Lista todos os robôs             |
| GET    | `/api/v1/robots/{id}` | Retorna detalhes de um robô por ID |
| POST   | `/api/v1/robots`    | Criar um novo registro de robô  |

---

## Técnicas e Tecnologias Usadas

- **Entity Framework Core:** ORM para gerenciamento de dados.  
- **RESTful API Design:** Endpoints claros e eficazes.  
- **Dependency Injection:** Promove baixo acoplamento e facilita testes.

---

## Dependências

| Pacote | Versão | Link |
|--------|--------|------|
| Microsoft.EntityFrameworkCore | 3.1.8 | [NuGet](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/3.1.8) |
| Microsoft.EntityFrameworkCore.Design | 3.1.8 | [NuGet](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Design/3.1.8) |
| Microsoft.EntityFrameworkCore.SqlServer | 3.1.8 | [NuGet](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.SqlServer/3.1.8) |
| Newtonsoft.Json | 12.0.2 | [NuGet](https://www.nuget.org/packages/Newtonsoft.Json/12.0.2) |

---

## Estrutura do Projeto

src
- ├── Controllers [Rotas e handlers]
- ├── Models [Modelos de dados]
- ├── Services [Regras de negócio]
- ├── Middlewares [Funções intermediárias]
- ├── Database [Banco de dados e migrations]
- │ ├── DTOs
- │ ├── EntityFramework
- │ │ ├── Context
- │ │ ├── Migrations- 
├── Repositories [Acesso a dados]

---

## Como Executar
1. *Clone o repositório*:
   ```bash
   git clone https://github.com/felipeAguiarCode/MegaApiDotnetCore.git
   cd MegaApiDotnetCore/src

2. Restaure pacotes:
dotnet restore

3. Aplique migrações:
dotnet ef database update

4. Rode a aplicação:
dotnet run

- A API estará disponível em https://localhost:5001 ou http://localhost:5000.

---

## Exemplos de Uso

- Listar todos os robôs:
curl https://localhost:5001/api/v1/robots

- Buscar robô por ID:
curl https://localhost:5001/api/v1/robots/1

---

## Criar novo robô:

curl -X POST https://localhost:5001/api/v1/robots \
  -H "Content-Type: application/json" \
  -d '{"name":"Roll","ability":"Support"}'

---

## Contribuindo
- Faça um fork, crie uma branch (feature/minha-ideia), commit suas mudanças e envie um Pull Request.

## Licença
Licenciado sob a MIT License.
