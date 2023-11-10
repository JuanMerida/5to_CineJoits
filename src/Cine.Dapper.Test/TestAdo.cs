using Cine.Core;

namespace Cine.Dapper.Test;

public class TestAdo
{
    protected readonly IAdo Ado;
    private static readonly string _cadena
        = "Server=localhost;Database=5to_CineJoits;Uid=test;pwd=test;Allow User Variables=True";

    public TestAdo(string cadena) => Ado = new AdoDapper(cadena);
    public TestAdo() : this(_cadena) { }
}