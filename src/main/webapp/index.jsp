<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String[] imagens = {"imagens/academia1.jpg", "imagens/academia2.jpg", "imagens/academia3.jpg", "imagens/academia4.jpg", "imagens/academia5.jpg"}; 
    String acao = request.getParameter("acao");
    int imagemAtual = 0;
    
    try{
        imagemAtual = Integer.parseInt(request.getParameter("index"));
    }catch (Exception e){
        imagemAtual = 0;
    }
    if("proximo".equals(acao)){
        imagemAtual++;
        if (imagemAtual >= imagens.length){
            imagemAtual = 0;
        }
    }else if("anterior".equals(acao)){
        imagemAtual--;
        if(imagemAtual < 0){
        	imagemAtual = imagens.length - 1;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Sua saúde em primeiro lugar!</p>
    </div>
    <div class="menu">
        <a href="pilates.jsp"><button>Pilates</button></a>
        <a href="luta.jsp"><button>Muay thai</button></a>
        <a href="treinos.jsp"><button>Treinos de Musculação</button></a>
        <a href="cadastroForm.jsp"><button>Fazer Cadastro</button></a>
        <a href="loginFuncionarios.jsp"><button>Área Funcionários</button></a>
    </div>
    
    <div class="bigcontainer">
        <div class="localizacao">
            <h2>Nossa Localização</h2>
            <div class="info-contato">
                <h3>Contato</h3>
                <p><strong>Endereço:</strong> Rua das Academias, 123 - Centro</p>
                <p><strong>Telefone:</strong> (41) 9999-8888</p>
                <p><strong>WhatsApp:</strong> (41) 9999-7777</p>
                <p><strong>Email:</strong> contato@academiaboaforma.com</p>
            </div>

            <div class="redes-sociais">
                <h3>Redes Sociais</h3>
                <div class="redes-links">
                    <a href="https://www.facebook.com/" class="rede-social">
                    	<img alt="Facebook" src="imagens/facebook.png">                
                    </a>
                    <a href="https://www.instagram.com/" class="rede-social">
                    	<img alt="Instagram" src="imagens/instagram.png">
                    </a>
                    <a href="https://web.whatsapp.com/" class="rede-social">
                    	<img alt="WhatsApp" src="imagens/iwhatsapp.png">
                    </a>
                </div>
            </div>
        </div>

        <div class="minigaleria">
            <h2>Conheça Nossa Academia</h2>
            <div class="galeria">
                <a href="index.jsp?acao=anterior&index=<%= imagemAtual %>">
                    <button class="seta seta-esquerda">
                        <img alt="Voltar" src="imagens/setaesquerda.png">
                    </button>
                </a>
                <div class="imagem-container">
                    <img src="<%= imagens[imagemAtual] %>" alt="Academia Boa Forma">
                </div>
                <a href="index.jsp?acao=proximo&index=<%= imagemAtual %>">
                    <button class="seta seta-direita">
                        <img alt="Avançar" src="imagens/setadireita.png">
                    </button>
                </a>
            </div>
            
            <div class="descricao">
                Estrutura completa para seu melhor desempenho!
            </div>
        </div>
    </div>
</body>
</html>