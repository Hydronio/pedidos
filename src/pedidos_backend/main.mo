import Text "mo:base/Text";
import List "mo:base/List";
import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";

actor JustEat {

  //stable var contadorProductos: Nat = 0;

  public type Pedido = {
    hora: Text;
    descripcion: [Producto];
    puntoDeEntrega: Text;
  };

  type Producto = {
    id: Nat;
    vendendor: Text;
    descripcion: Text;
  };

  let PedidoCliente = Map.HashMap<actor, Pedido>(0, princ.equal, Text.hash);
  let Productos = Map.HashMap<Text, Producto>(0, Text.equal, Text.hash);

  var listaProductos = List.nil<Producto>();


  //añadimos un nuevo producto
  public func crearProducto(producto : Producto): async () {
    //producto.id := 1;
    Productos.put(Nat.toText(contadorProductos), producto);
    listaProductos := List.push<Producto>(producto, listaProductos);
    //contadorProductos += 1;
  };

  //consultar prudcto por su id en el hashmap Productos
  public query func consultarProducto(id : Text) : async ?Producto {
    Productos.get(id)
  };

}