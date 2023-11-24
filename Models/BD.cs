using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dapper;
namespace Integrador.Models;
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

    public static List<Categoria> CargarCategoriaCard()
    {
       List<Categoria> card = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarCategoriaCard";
            card= db.Query<Categoria>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return card;
    }
    public static List<Receta> CargarRecetasCarrousel()
    {
       List<Receta> recetita = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarRecetasCarrousel";
            recetita= db.Query<Receta>(sp,  commandType: CommandType.StoredProcedure).ToList();
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
    public static List<Receta> BuscarPorReceta(string Titulo )
    {
       List<Receta> buscador_receta = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorReceta";
            buscador_receta= db.Query<Receta>(sp, new { pTitulo = Titulo }, commandType: CommandType.StoredProcedure).ToList();
        }
        return buscador_receta;
    }
    public static  List<Ingrediente> BuscarPorIngrediente(string Nombre_Ingrediente )
    {
        List<Ingrediente> buscador_ingrediente = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "BuscarPorIngrediente";
            buscador_ingrediente= db.Query<Ingrediente>(sp, new { pNombre_Ingrediente = Nombre_Ingrediente }, commandType: CommandType.StoredProcedure).ToList();
        }
        return buscador_ingrediente;
    }

    public static Categoria CargarCategoriaxId(int pIdCategoria )
    {
        Categoria obj = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarCategoriaxId";
            obj= db.QueryFirstOrDefault<Categoria>(sp, new { IdCategoria=pIdCategoria }, commandType: CommandType.StoredProcedure);
        }
        return obj;
    }
   public static List<Receta>CargarRecetaxCategoria (int pIdCategoria)
    {
       List<Receta> list_receta = null;
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "CargarRecetaxCategoria";
            list_receta= db.Query<Receta>(sp,new { IdCategoria=pIdCategoria }, commandType: CommandType.StoredProcedure).ToList();
        }
        return list_receta;
    }

    public static void AgregarReceta(Receta recetas)
    {   
        using(SqlConnection db = new SqlConnection(ConnectionString)){
            string sp = "AgregarReceta";
            var parameters = new { Titulo=recetas.Titulo, Descripcion=recetas.Descripcion, Pasos=recetas.Pasos, CantidadPersonas=recetas.CantidadPersonas, Precio=recetas.Precio, Tiempo=recetas.Tiempo, Video=recetas.Video,  Imagen=recetas.Imagen,  IdCategoria=recetas.IdCategoria};
            db.Execute(sp, parameters, commandType: CommandType.StoredProcedure);
        }
    }


}
