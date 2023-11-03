using System.Data;
using MySqlConnector;
using Cine.Core;
using Dapper;

namespace Cine.Dapper;
public class AdoDapper : IAdo
{
    private readonly IDbConnection _conexion;
    public AdoDapper(IDbConnection conexion) => this._conexion = conexion;
    public AdoDapper(string cadena) => _conexion = new MySqlConnection(cadena);
    
    public void AltaSala(Sala sala)
    {
        throw new NotImplementedException();
    }

    public List<Sala> ObtenerSalas()
    {
        return _conexion.Query<Sala>("dfljgasdkfbskdjfsdf").ToList();
    }
}
