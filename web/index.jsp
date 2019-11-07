<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AULA CRUD</title>
    </head>
    <body>
        <form action="index.jsp" method="post">//encapsula a info e joga para a index
            <label>NOME</label><br>
            <input type="text" name="nome"/><br>
            <button type="submit" >PESQUISAR</button>
        </form>
        <%
        String nome_cliente = request.getParameter("nome");
        try {
               out.print("<table border='1'>");
               out.print("<tr>");
               out.print("<th>ID</th>");
               out.print("<th>NOME</th>");
               out.print("<th>EMAIL</th>");
               out.print("<th>SENHA</th>");
               out.print("<th>EDITAR</th>");
               out.print("<th>EXCLUIR</th>");
               out.print("</tr>");
               ClienteDAO cli = new ClienteDAO();               
              
               if(nome_cliente == "" || nome_cliente == null){
                ArrayList<Cliente> lista = cli.ListarTodos();
                for(int i = 0; i<lista.size(); i++){
                   out.print("<tr>");
                   out.print("<td>"+lista.get(i).getCodigo_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getNome_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getEmail_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getSenha_cliente()+"</td>");
                   out.print("<td><a href='#'>CLIQUE</a></td>");
                   out.print("<td><a href='#'>CLIQUE</a></td>");
                   out.print("</tr>");
     
               }
               }else{
                   ArrayList<Cliente> lista = cli.ListarTodosNome(nome_cliente);
                for(int i = 0; i<lista.size();i++){
                   out.print("<tr>");
                   out.print("<td>"+lista.get(i).getCodigo_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getNome_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getEmail_cliente()+"</td>");
                   out.print("<td>"+lista.get(i).getSenha_cliente()+"</td>");
                   out.print("<td><a href='#'>CLIQUE</a></td>");
                   out.print("<td><a href='#'>CLIQUE</a></td>");
                   out.print("</tr>");
                 }
               }
               out.print("</table>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro 6: "+erro);
            }
        %>
        
        <a href="inserir.jsp">NOVO CADASTRO</a>
    </body>
</html>

