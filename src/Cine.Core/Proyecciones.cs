namespace Cine.Core;

public class Proyecciones
{
    public int IdProyeccion {get; set;}
    public DateTime FechaHora {get; set;}
    public required Pelicula Pelicula {get; set;}
    public required Sala Sala {get; set;}
}
