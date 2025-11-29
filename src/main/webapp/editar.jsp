<%@ page import="br.com.academia.dao.ClienteDAO" %>
<%@ page import="br.com.academia.model.Cliente" %>
<%
    // Pega o ID da URL e busca no banco
    int id = Integer.parseInt(request.getParameter("id"));
    ClienteDAO dao = new ClienteDAO();
    Cliente c = dao.buscarPorId(id);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar informações do cliente</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Editar Cliente</p>
    </div>

    <div class="form-container">
        <h2>Dados:</h2>
        
			<form action="EditarServlet" method="post">
			    <input type="hidden" name="id" value="<%= c.getId() %>">
			
			    <div class="form-group">
			        <label for="nome">Nome:</label>
			        <input type="text" id="nome" name="nome" required 
			               value="<%= c.getNome() %>">
			    </div>
			    
			    <div class="form-group">
			        <label for="telefone">Telefone:</label>
			        <input type="text" id="telefone" name="telefone" required 
			               value="<%= c.getTelefone() %>">
			    </div>
			    
			    <div class="form-group">
			        <label for="plano">Plano Atual: <%= c.getPlano() %></label>
			        <select id="plano" name="plano" required>
			            <option value="<%= c.getPlano() %>" selected>Manter atual</option>
			            <option value="Plano Mensal">Mensal</option>
			            <option value="Plano Trimestral">Trimestral</option>
			            </select>
			    </div>
			    
			    <button type="submit" class="btn-submit">Salvar Alterações</button>
			</form>
        
        <div class="voltar-p-home">
            <a href="funcionarios.jsp"><button>Voltar para funcionários</button></a>
        </div>
    </div>
</body>
</html>