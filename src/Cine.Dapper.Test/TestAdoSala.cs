using Cine.Core;

namespace Cine.Dapper.Test;

public class TestAdoSala : TestAdo
{
    [Fact]
    public void AltaSala()
    {
        var newSala = new Sala()
        {
            Piso = 4,
            Capacidad=30
        };
        

        Ado.AltaSala(newSala);

        Assert.NotEqual(0, newSala.IdSala);
        
    }
}
