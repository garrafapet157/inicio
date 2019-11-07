//Classe conexão cliente
package dao;

//bibliotecas de conexão e driver
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    //Metodo para realizar conexão
    public Connection getConexao(){
        try{
            Class.forName("com.mysql.jdbc.Driver");                     
            return DriverManager.getConnection("jdbc:mysql://localhost:3307/unopar","root","");
        }catch(Exception erro){
            throw new RuntimeException("Erro 1:"+erro);
        }
    }
}
