package br.com.academia.controller;

import br.com.academia.gc.ClienteGC;
import br.com.academia.model.Cliente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditarServlet")
public class EditarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("telefone");
		String plano = request.getParameter("plano");
		
		Cliente cliente = new Cliente();
		cliente.setId(Integer.parseInt(id));
		cliente.setNome(nome);
		cliente.setTelefone(telefone);
		cliente.setPlano(plano);
		
		ClienteGC dao = new ClienteGC();
		dao.atualizarCliente(cliente);
		
		response.sendRedirect("funcionarios.jsp");
	}
}