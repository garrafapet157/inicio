<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PÁGINA CADASTRO CLIENTES</title>
    </head>
    <body>
        <form action="executar_inserir.jsp" method="post">
            <label>NOME</label><br>
            <input type="text" name="nome"/><br>
            <label>EMAIL</label><br>
            <input type="text" name="email"/><br>
            <label>SENHA</label><br>
            <input type="password" name="senha"/><br><br>
            <button type="submit">CADASTRAR</button>
        </form>
    </body>
</html>
