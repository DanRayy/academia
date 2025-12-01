<%@ page import="br.com.academia.gc.ClienteGC" %>
<%@ page import="br.com.academia.model.Cliente" %>
<%
// Pega o ID da URL e busca no banco
    int id = Integer.parseInt(request.getParameter("id"));
    ClienteGC dao = new ClienteGC();
    Cliente clienteAtual = dao.buscarPorId(id);
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
			    <input type="hidden" name="id" value="<%= clienteAtual.getId() %>">
			
			    <div class="form-group">
			        <label for="nome">Nome:</label>
			        <input type="text" id="nome" name="nome" required 
			               value="<%= clienteAtual.getNome() %>">
			    </div>
			    
			    <div class="form-group">
			        <label for="telefone">Telefone:</label>
			        <input type="text" id="telefone" name="telefone" required 
			               value="<%= clienteAtual.getTelefone() %>">
			    </div>
			    
			    <div class="form-group">
			        <label for="plano">Plano Atual: <%= clienteAtual.getPlano() %></label>
			        <select id="plano" name="plano" required>
			            <option value="<%= clienteAtual.getPlano() %>" selected>Manter atual</option>
	                    <option value="Plano Mensal">Mensal - 1 x R$120</option>
	                    <option value="Plano Trimestral">Trimestral - 3 x R$110</option>
	                    <option value="Plano Semestral">Semestral - 6 x R$100</option>
	                    <option value="Plano Anual">Anual - 12 x R$90</option>
			        </select>
			    </div>
			    
			    <button type="submit" class="btn-submit">Salvar Alterações</button>
			</form>
        
        <div class="btn-acoes">
            <a href="funcionarios.jsp"><button>Voltar para funcionários</button></a>
        </div>
    </div>
</body>
</html>