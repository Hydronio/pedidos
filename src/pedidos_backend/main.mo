import Text "mo:base/Text";
import List "mo:base/List";
import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";

actor JustEat {

  stable var contadorProductos: Nat = 0;
  type Id = Text;

  public type Pedido = {
    descripcion: [Producto];
    puntoDeEntrega: Text;
  };

  type Producto = {
    id: Nat;
    vendedor: Text;
    descripcion: Text;
  };

  var pedidoCliente = Map.HashMap<Principal, Pedido>(0, Principal.equal, Principal.hash);
  var productos = Map.HashMap<Id, Producto>(0, Text.equal, Text.hash);




  //añadimos un nuevo producto
  public shared func agregarProducto(productoVendedor: Text, productoDescripcion: Text): async () {
    var miProducto: Producto = {
      id = contadorProductos;
      vendedor = productoVendedor; 
      descripcion = productoDescripcion
    };

    productos.put(Nat.toText(contadorProductos), miProducto);

    contadorProductos += 1;
  }; 

  //consultar producto por su id en el hashmap Productos
  public query func consultarProducto(id : Text) : async ?Producto {
    productos.get(id)
  };

  //crear un pedido y asignarlo a un cliente
  public shared(msg) func crearPedido(
    productosPedido: [Producto],
    puntoDeEntrega: Text) : async (){

      var miPedido : Pedido = {
        descripcion = productosPedido;
        puntoDeEntrega = puntoDeEntrega;
      };
    
    pedidoCliente.put(msg.caller, miPedido);
  };

  //consultar pedido cliente
  public query func consultarPedidoCliente(cliente : Principal) : async ?Pedido {
    pedidoCliente.get(cliente)
  };

  //eliminamos la entrada en el mapping
  public func entregarPedido(cliente: Principal): async() {
    pedidoCliente.delete(cliente);
  }
}