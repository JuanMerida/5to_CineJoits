using Cine.Core;

namespace Cine.Dapper.Test;

public class TestAdoPelicula : TestAdo
{
    [Fact]
    public void AltaPelicula()
    {
        var accion = Ado.ObtenerGenero().FirstOrDefault(g=>g.NGenero == "Accion");
        Assert.NotNull(accion);

        var newPelicula = new Pelicula()
        {
            Nombre = "Deadpool",
            Genero = accion,
            FechaDeLazamiento = new DateTime(2016, 10, 23)            
        };
        Ado.AltaPelicula(newPelicula);
        Assert.NotEqual(0, newPelicula.IdPelicula);
        
    }
}
