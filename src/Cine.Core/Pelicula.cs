namespace Cine.Core;

public class Pelicula
{
    public int IdPelicula {get; set;}
    public required string Nombre {get; set;}
    public required  Genero Genero {get; set;} 
    public  DateTime FechaDeLazamiento {get; set;}
}
