using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Integrador.Models;

namespace Integrador.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.RecetasCarrusel = BD.CargarRecetasCarrousel();
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    [HttpPost]
    public IActionResult Login( string Contraseña,string Username)
    {
        Usuario Usuario = Models.BD.Login(Contraseña, Username);
        Usuario userr = Models.BD.Login_VerificarContraseña(Contraseña);
        if (Usuario == null )
        {
            ViewBag.MensajeError = "Usuario inexistente";
            return View("Login");
        }
        else if(userr ==null)
        {
            ViewBag.MensajeError2 = " Contraseña incorrecta";
            return View("Login");
        }
        else
        {
            ViewBag.Usuario = Usuario;
            return View("Index");
        }
    }
    [HttpPost]
    public IActionResult RegistrarUsuario(Usuario user){
        Usuario userr = BD.Registro_VerificarExistencia(user.Username);
        if(userr == null){
           BD.Registro(user.Username, user.Contraseña, user.Mail);
            return View("Index");
        }
        else{
            ViewBag.MSJError= "El usuario ya existe!";
            return View("Registro");
        }
    }
    public IActionResult OlvidarContraseña(string Mail)
    {
        string contraseña = BD.OlvideMiContraseña(Mail);
        if(contraseña == null || contraseña == "") {
            ViewBag.MensajeInexistente = "No existe el mail ingresado anteriormente";
            return View("Olvido");
        }
        else
        {
            ViewBag.ContraseñaRecordada = contraseña;
            return View("Olvido");
        }
    }
    public IActionResult Card_principal(Categoria cate)
    {
        ViewBag.ListadoCards=BD.CargarCategoriaCard(cate.IdCategoria);
        return View("Index");
    }
    public IActionResult Carrousel_principal()
    {
        ViewBag.ListadoRecetasCarrousel=BD.CargarRecetasCarrousel();
        return View("Index");
    }
    public IActionResult CargarInfoUsuario(Usuario user)
    {
        ViewBag.user_=BD.CargarInfoUsuario(user.IdUsuario);
        return View("Usuario");
    }
    public IActionResult CargarReceta(Receta recetita)
    {
        ViewBag.recetita_=BD.CargarReceta(recetita.IdReceta);
        return View("Receta");
    }
    public IActionResult BuscarPorReceta(Receta recetita)
    {
        ViewBag._recetitas=BD.BuscarPorReceta(recetita.Titulo);
        return View("Buscador");
    }
    public IActionResult BuscarPorIngrediente(Ingrediente ingrediente_)
    {
        ViewBag.ingredientitos=BD.BuscarPorReceta(ingrediente_.Nombre_Ingrediente);
        return View("Buscador");
    }
}
