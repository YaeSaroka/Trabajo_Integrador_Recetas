using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dapper;
namespace BD.Models;
public static class BD
{
     private static string ConnectionString { get; set; } = @"Server=.;DataBase=Saveurs;Trusted_Connection=True;";

    public static Usuario Login(string Contraseña, string Username)
    {
        Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sp = "LoginUsuario";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {pUsername = Username, pContraseña = Contraseña }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }

    public static Usuario Login_VerificarContraseña(string Contraseña)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Login_VerificarContraseña";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {pContraseña = Contraseña }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    
     public static Usuario Registro_VerificarExistencia(string Username)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Registro_VerificarExistencia";
            user= db.QueryFirstOrDefault<Usuario>(sp, new {pUsermane = Username }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    
      public static void Registro(string Username, string Contraseña, string Mail)
    {
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "Registro";
            var parameters = new { pUsername = Username, pContraseña = Contraseña, pMail = Mail };
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
        }
    }

    public static string OlvideMiContraseña(string Mail)
    {
        string Contraseña_recuperada = " ";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sp = "OlvideMiContraseña";
            Contraseña_recuperada= db.QueryFirstOrDefault<string>(sp, new { pMail = Mail }, commandType: CommandType.StoredProcedure);
        }
        return Contraseña_recuperada;
    }
    /*............................................................................................................................................*/

    public static List<Categoria> CargarCategoriaCard(int IdCategoria)
    {
       List<Categoria> card = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarCategoriaCard";
            card= db.Query<Categoria>(sp, new { pIdCategoria = IdCategoria }, commandType: CommandType.StoredProcedure).ToList();
        }
        return card;
    }
    public static List<Receta> CargarRecetasCarrousel(int IdReceta )
    {
       List<Receta> recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarRecetasCarrousel";
            recetita= db.Query<Receta>(sp, new { pIdReceta = IdReceta }, commandType: CommandType.StoredProcedure).ToList();
        }
        return recetita;
    }

    public static Usuario CargarInfoUsuario(int IdUsuario)
    {
       Usuario user = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarInfoUsuario";
            user= db.QueryFirstOrDefault<Usuario>(sp, new { pIdUsuario = IdUsuario }, commandType: CommandType.StoredProcedure);
        }
        return user;
    }
    public static Receta CargarReceta(int IdReceta )
    {
       Receta recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarReceta";
            recetita= db.QueryFirstOrDefault<Receta>(sp, new { pIdReceta = IdReceta }, commandType: CommandType.StoredProcedure);
        }
        return recetita;
    }
    public static Receta BuscarPorReceta(string Titulo )
    {
       Receta buscador_receta = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorReceta";
            buscador_receta= db.QueryFirstOrDefault<Receta>(sp, new { pTitulo = Titulo }, commandType: CommandType.StoredProcedure);
        }
        return buscador_receta;
    }
    public static Ingrediente BuscarPorIngrediente(string Nombre_Ingrediente )
    {
       Ingrediente buscador_ingrediente = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorIngrediente";
            buscador_ingrediente= db.QueryFirstOrDefault<Ingrediente>(sp, new { pNombre_Ingrediente = Nombre_Ingrediente }, commandType: CommandType.StoredProcedure);
        }
        return buscador_ingrediente;
    }
}