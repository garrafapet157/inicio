package dao;

import model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
//aula 2
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Statement;

public class ClienteDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Cliente> lista = new ArrayList<>();
    
    public ClienteDAO(){
        conn = new Conexao().getConexao();
    }    
    
    //metodo para inserção de dados.
    public void inserir(Cliente cliente){
        String sql = "INSERT INTO usuario( email_usuario, nome_usuario, senha_usuario) "
                + "VALUES (?,?,?)";
        try{
            stmt = conn.prepareStatement(sql);//usa pra conseguir utilizar 
            //parâmetros
            stmt.setString(1, cliente.getNome_cliente());
            stmt.setString(2, cliente.getEmail_cliente());
            stmt.setString(3, cliente.getSenha_cliente());
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 2: "+erro);
        }
    }
    //metodos de pesquisar tudo
    public ArrayList<Cliente> ListarTodos (){
        String sql ="SELECT * FROM usuario";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setCodigo_usuario(rs.getInt("codigo_usuario"));
                cliente.setNome_cliente(rs.getString("nome_cliente"));
                cliente.setEmail_usuario(rs.getString("email_usuario"));
                cliente.setSenha_usuario(rs.getString("senha_usuario"));
                
                
            }
            
        }catch(Exception erro) {
            throw new RuntimeException("Erro 4: "+erro);
        }//erro ArrayList
        return lista;
    } 
    public ArrayList<Cliente> ListarTodosNome (String valor){
        String sql ="SELECT * FROM usuario WHERE nome_usuario LIKE '%"+valor+"%'";
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setCodigo_usuario(rs.getInt("codigo_usuario"));
                cliente.setNome_cliente(rs.getString("nome_cliente"));
                cliente.setEmail_usuario(rs.getString("email_usuario"));
                cliente.setSenha_usuario(rs.getString("senha_usuario"));
                
                
            }
            
        }catch(Exception erro) {
            throw new RuntimeException("Erro 5: "+erro);
        }//erro ArrayList
        return lista;
        
    }
    //metodo de atualização 
    public void atualizar(Cliente cliente, String erro){
        String sql = "UPDATE usuario nome_usuario = ?, email_usuario = ?, "
                +"senha_usuario = ? WHERE codigo_usuario = ? ";
        try {
           stmt = conn.prepareStatement(sql); 
           stmt.setString(1, cliente.getNome_cliente());
           stmt.setString(3, cliente.getSenha_cliente());
           stmt.setString(3, cliente.getSenha_cliente());
           stmt.setInt(4, cliente.getCodigo_cliente());
           stmt.execute();
           stmt.close();
        } catch (Exception e) {
            throw new RuntimeException("Erro 7: "+erro);
        }
    }
    
    //metodo excluir
    public void excluir(int valor, String erro){
        String sql = "DELETE FROM usuario WHERE codigo_usuario = "+valor;
        try {
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        } catch (Exception e) {
            throw new RuntimeException("Erro 8: "+erro);
        }
         
        
    }
}


