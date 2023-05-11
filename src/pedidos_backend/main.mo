import Text "mo:base/Text";
import List "mo:base/List";

actor JustEat {

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



  public func update agregarProducto() : async {

  }


}