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
    
    #region Sala
    public void AltaSala(Sala sala)
    {
        var parametros = new DynamicParameters();
        parametros.Add("@unIdSala",direction:ParameterDirection.Output);
        parametros.Add("@unPiso", sala.Piso);
        parametros.Add("@unaCapacidad",sala.Capacidad);

        _conexion.Execute("AltaSala",parametros, commandType: CommandType.StoredProcedure);

        sala.IdSala=parametros.Get<sbyte>("@unIdSala");
    }
    private static readonly string _querySala
        = @"SELECT IdSala, Capacidad
            FROM Sala";
        public List<Sala> ObtenerSalas()
    {

        return _conexion.Query<Sala>(_querySala).ToList();
    }

    #endregion
    #region Genero
    public void AltaGenero(Genero genero){
        var parametros = new DynamicParameters();
        parametros.Add("@unIdGenero",direction:ParameterDirection.Output);
        parametros.Add("@unNGenero",genero.NGenero);
        
        _conexion.Execute("AltaGenero",parametros, commandType: CommandType.StoredProcedure);

        genero.IdGenero=parametros.Get<sbyte>("@unIdGenero");
    }
        private static readonly string _queryGenero
        = @"SELECT IdGenero, NGenero 
            FROM Genero";
    public List<Genero> ObtenerGenero()
    {
        return _conexion.Query<Genero>(_queryGenero).ToList();
    }

    #endregion
    #region Proyeccion 

    public void AltaProyeccion(Proyeccion proyeccion)
    {
        var parametros= new DynamicParameters();
        parametros.Add("@unIdProyeccion", direction: ParameterDirection.Output);
        parametros.Add("@unaFechahora", proyeccion.FechaHora);
        parametros.Add("@unIdPelicula",proyeccion.Pelicula.IdPelicula);
        parametros.Add("@unIdSala", proyeccion.Sala.IdSala);

        _conexion.Execute("AltaProyeccion", parametros, commandType: CommandType.StoredProcedure);
        proyeccion.IdProyeccion=parametros.Get<byte>("@unIdproyeccion");
    }
    
    private static readonly string _queryProyeccion
        = @"SELECT * 
            FROM Proyeccion
            JOIN Pelicula USING (IdPelicula)
            JOIN Sala USING (IdSala)";

    public List<Proyeccion> ObtenerProyeccion()
    {
        return _conexion.Query<Proyeccion>(_queryProyeccion).ToList();
    }

    #endregion
    #region Pelicula

    public void AltaPelicula (Pelicula pelicula){
        var parametros = new DynamicParameters();
        parametros.Add("@unIdPelicula", direction:ParameterDirection.Output);
        parametros.Add("@unNombre",pelicula.Nombre);
        parametros.Add("@unIdGenero", pelicula.Genero.IdGenero);
        parametros.Add("@unFDL", pelicula.FechaDeLazamiento);

        _conexion.Execute("AltaPelicula", parametros, commandType: CommandType.StoredProcedure);
        pelicula.IdPelicula=parametros.Get<byte>("unIdPelicula");
    }
    private static readonly string _queryPelicula
        = @"SELECT * 
            FROM Pelicula
            JOIN Genero USING (IdGenero)";
    public List<Pelicula> ObtenerPelicula(){
        return _conexion.Query<Pelicula>(_queryPelicula).ToList();
    }
    #endregion
}
