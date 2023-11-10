using Cine.Core;

namespace Cine.Dapper.Test;

public class TestAdoGenero : TestAdo
{
    [Fact]
    public void AltaGenero()
    {
        var terror = new Genero()
        {
            NGenero = "Terror"
        };

        Ado.AltaGenero(terror);

        Assert.NotEqual(0, terror.IdGenero);
    }
}