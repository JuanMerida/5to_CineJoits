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
        var parametros = new DynamicParameters();
        parametros.Add("@unIdSala",direction:ParameterDirection.Output);
        parametros.Add("@unPiso", sala.Piso);
        parametros.Add("@unaCapacidad",sala.Capacidad);

        _conexion.Execute("AltaSala",parametros);

        sala.IdSala=parametros.Get<byte>("@unIdSala");
    }
    
    
    
    public List<Sala> ObtenerSalas()
    {

        return _conexion.Query<Sala>("dfljgasdkfbskdjfsdf").ToList();
    }
}
