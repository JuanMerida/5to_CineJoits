namespace Cine.Core;

public interface IAdo
{
    public void AltaSala(Sala sala);
    public List<Sala> ObtenerSalas();
    public void AltaGenero(Genero genero);
    public List<Genero> ObtenerGenero();
    public void AltaProyeccion(Proyeccion proyeccion);
    public List<Proyeccion> ObtenerProyeccion();
    public void AltaPelicula(Pelicula pelicula);
    public List<Pelicula> ObtenerPelicula();
}