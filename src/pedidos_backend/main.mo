import Text "mo:base/Text";
import List "mo:base/List";
import Map "mo:base/HashMap";
import Nat "mo:base/Nat";

actor JustEat {

  let contadorProductos: Nat = 0;

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

  let phonebook = Map.HashMap<Nat, Producto>(0, Nat.equal, Nat.hash);




}