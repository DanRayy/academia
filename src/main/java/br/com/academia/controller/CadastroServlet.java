package br.com.academia.controller;

import br.com.academia.model.Cliente;
import br.com.academia.dao.ClienteDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CadastroServlet
 */
@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CadastroServlet() {
        super();
     }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("telefone");
		String plano = request.getParameter("plano");
		
		Cliente cliente = new Cliente (nome, telefone, plano);
		
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.addCliente(cliente);
		
		response.sendRedirect("cadastroSucesso.jsp");
	}
}
