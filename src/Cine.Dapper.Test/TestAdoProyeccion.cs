using Cine.Core;

namespace Cine.Dapper.Test;

public class TestAdoProyeccion : TestAdo
{
    [Fact]
    public void AltaProyeccion()
    {
    var JhonWick = Ado.ObtenerPelicula().FirstOrDefault(p=>p.Nombre == "Jhon Wick");
        Assert.NotNull(JhonWick);
    var capacidad = Ado.ObtenerSalas().FirstOrDefault(s=>s.Capacidad == 30);
        Assert.NotNull(capacidad );

        var newProyeccion = new Proyeccion()
        {
            FechaHora=new DateTime(2016, 04, 10, 15, 30, 00),
            Pelicula= JhonWick,
            Sala=capacidad
        };
        Ado.AltaProyeccion(newProyeccion);
        Assert.NotEqual(0, newProyeccion.IdProyeccion);
        
    }
    
}
