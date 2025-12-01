<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.academia.gc.ClienteGC" %>
<%@ page import="br.com.academia.model.Cliente" %>
<%@ page import="java.util.List" %>
<%
if (session.getAttribute("funcionarioLogado") == null) {
        response.sendRedirect("loginFuncionarios.jsp");
        return;
    }

    ClienteGC clienteDAO = new ClienteGC();
    List<Cliente> clientes = null;
    String mensagem = "";
    String acao = request.getParameter("acao");
    String idExcluir = request.getParameter("id");
    
    if ("excluir".equals(acao) && idExcluir != null) {
        try {
            int id = Integer.parseInt(idExcluir);
            clienteDAO.excluirCliente(id);
            mensagem = "Cliente excluído com sucesso!";
        } catch (Exception e) {
            mensagem = "Erro ao excluir cliente: " + e.getMessage();
        }
    }
    
    // Carrega a lista de clientes
    clientes = clienteDAO.listarClientes();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Área Funcionários - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Área de Funcionários - Gerenciar Clientes</p>
    </div>

    <div class="btn-acoes">
        <a href="funcionarios.jsp"><button>Atualizar Lista</button></a>
        <a href="cadastroForm.jsp"><button>Cadastrar Novo Cliente</button></a>
        <a href="index.jsp"><button>Voltar para Home</button></a>
    </div>

    <% if (!mensagem.isEmpty()) { %>
        <div class="mensagem-sucesso">
            <%= mensagem %>
        </div>
    <% } %>

    <div class="lista-clientes">
        <h2>Clientes Cadastrados</h2>
        
        <% if (clientes == null || clientes.isEmpty()) { %>
            <div class="sem-clientes">
                Nenhum cliente cadastrado.
            </div>
        <% } else { %>
            <% for (Cliente cliente : clientes) { %>
            	    <div class="cliente-item">
                    <div class="cliente-info">
                        <div class="cliente-nome"><%= cliente.getNome() %></div>
                        <div class="cliente-detalhes">
                            Plano: <%= cliente.getPlano() %> | Telefone: <%= cliente.getTelefone() %>
                        </div>
                    </div>
                    <div>
                        <a href="funcionarios.jsp?acao=excluir&id=<%= cliente.getId() %>" 
                           onclick="return confirm('Tem certeza que deseja excluir <%= cliente.getNome() %>?')">
                            <button class="btn-excluir">Exclur</button>
                        </a>
                        <a href="editar.jsp?id=<%= cliente.getId() %>">
    						<button type="button" class="btn-editar">Editar</button>
						</a>                
                    </div>                 
                </div>
            <% } %>
        <% } %>
    </div>
</body>
</html>