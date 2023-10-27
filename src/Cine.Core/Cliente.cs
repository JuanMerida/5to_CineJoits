namespace Cine.Core;

public class Cliente
{
    public short Idcliente {get;set;}
    public required string Nombre {get;set;}
    public required string Apellido {get;set;}
    public required string Email {get;set;}   
    public  List<Entrada> Entradas {get; set;}
    public Cliente() => Entradas = new();
}