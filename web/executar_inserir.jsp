<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Cliente"%>
<%@page import="dao.ClienteDAO"%>

<%
    try{
                Cliente cli = new Cliente();
                ClienteDAO cld = new ClienteDAO();
                
                String nome_cliente = request.getParameter("nome");
                String email_cliente = request.getParameter("email");
                String senha_cliente = request.getParameter("senha");
                
                if(nome_cliente.equals("") || 
                    email_cliente.equals("") || 
                    senha_cliente.equals("") ){
                    out.print("<script>alert('Campos obrigatórios');</script>");
                    response.sendRedirect("inserir.jsp");
                }else{
                    cli.setNome_cliente(nome_cliente);
                    cli.setEmail_cliente(email_cliente);
                    cli.setSenha_cliente(senha_cliente);
                    cld.inserir(cli);
                    out.print("<script>alert('Cadastro efetuado com sucesso!');</script>");
                    out.print("<script>window.location.href = 'index.jsp';</script>");
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 3:"+erro);
            }
%>
