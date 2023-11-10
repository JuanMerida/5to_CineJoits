﻿using System.Data;
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

        _conexion.Execute("AltaSala",parametros);

        sala.IdSala=parametros.Get<byte>("@unIdSala");
    }
        public List<Sala> ObtenerSalas()
    {

        return _conexion.Query<Sala>("dfljgasdkfbskdjfsdf").ToList();
    }
#endregion
#region Genero

    public void AltaGenero(Genero genero){
        var parametros = new DynamicParameters();
        parametros.Add("@unIdGenero",direction:ParameterDirection.Output);
        parametros.Add("@unGenero",genero.NGenero);
        
        _conexion.Execute("AltaGenero",parametros);

        genero.IdGenero=parametros.Get<byte>("@unIdGenero");
    }

    public List<Genero> ObtenerGenero()
    {
        return _conexion.Query<Genero>("dfljgasdkfbskdjfsdf").ToList();
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

        _conexion.Execute("AltaProyeccion", parametros);
        proyeccion.IdProyeccion=parametros.Get<byte>("@unIdproyeccion");
    }

    public List<Proyeccion> ObtenerProyeccion()
    {
        return _conexion.Query<Proyeccion>("dfljgasdkfbskdjfsdf").ToList();
    }

#endregion
#region Pelicula

    public void AltaPelicula (Pelicula pelicula){
        var parametros = new DynamicParameters();
        parametros.Add("@unIdPelicula", direction:ParameterDirection.Output);
        parametros.Add("@unNombre",pelicula.Nombre);
        parametros.Add("@unIdGenero", pelicula.Genero.IdGenero);
        parametros.Add("@unFDL", pelicula.FechaDeLazamiento);

        _conexion.Execute("AltaPelicula", parametros);
        pelicula.IdPelicula=parametros.Get<byte>("unIdPelicula");
    }
    public List<Pelicula> ObtenerPelicula(){
        return _conexion.Query<Pelicula>("dfljgasdkfbskdjfsdf").ToList();
    }
#endregion
}
