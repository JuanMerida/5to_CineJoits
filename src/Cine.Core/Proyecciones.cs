namespace Cine.Core;

public class Proyecciones
{
    public int idProyeccion {get; set;}
    public DateTime fechaHora {get; set;}
    public required Peliculas Peliculas {get; set;}
    public required Sala Sala {get; set;}
}
