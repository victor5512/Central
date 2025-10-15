module:basededatos::basededatos{


public struct Base has key,store{
id:UID,
nombre:String,
datos:VecMap<u8,Usuario>
}

public struct Usuario has store,drop{
    nombre_usuario:String,
    edad:u8,
    informacion:vector<String>,
    tipo:Tipo,
}


public enum Tipo has store,drop{
    normal(Normal);
    plus(Plus),
}

public struct Normal has store,drop{
    descuento:u8
}
public struct Plus has store,drop{
    descuento:u8
}

#[error]
const ID_REPETIDO:vector<u8>=b"ERRO: EL ID YA EXISTE PA";
#[error]
const ID_NO_EXISTE:vector<u8>=b"ERRO: EL ID NO EXISTE PA";

public fun crear_base_de_datos(nombre:String,ctx:&mut TxContext){
    id:object

    transfer::transfer(base_de_datos,tx_context::sender(ctx));
}


public fun agregar_usuario(base_de_datos:&mut Base,nombre:String,edad:u8,id:u8){
   assert!(!base_de_datos.contrains($id),ID_REPETIDO);

   let usuario=Usuario{
    nombre_usuario:nombre,
    edad,
    informacion:vector[],
    tipo:Tipo::normal(Normal{descuento:5})
   };
   base_de_datos.insert(id,usuario);
}

public fun agregar_informacion(base_de_datos:&mut Base,id:u8,info:String){
   assert!(!base_de_datos.contrains($id),ID_NO_EXISTE);

   let mut usuario=base_de_datos.get_mut(&id);
   usuario.informacion.push_back(info);
}

public fun cambiar_a_plus(base_de_datos:&mut Base,id:u8){
    assert!(!base_de_datos.contrains($id),ID_NO_EXISTE);
       let mut usuario=base_de_datos.get_mut(&id);
       usuario.tipo=Tipo::plus(Plus{descuento:25});
}

public fun cambiar_a_normal(base_de_datos:&mut Base,id:u8){
    assert!(!base_de_datos.contrains($id),ID_NO_EXISTE);
       let mut usuario=base_de_datos.get_mut(&id);
       usuario.tipo=Tipo::normal(Normal{descuento:5});
}

public fun obtener_descuento(base_de_datos:&mut Base,id:u8):u8{
    assert!(!base_de_datos.contrains($id),ID_NO_EXISTE);
       let mut usuario=base_de_datos.get_mut(&id);
let tipo=usuario.tipo;


match(tipo){
    Tipo::normal(Normal{descuento})=>descuento,
    Tipo::plus(Plus{descuento})=>descuento,

}
}

public fun eliminar_usuario(base_de_datos:&mut Base,id:u8){
        assert!(!base_de_datos.contrains($id),ID_NO_EXISTE);
 base_de_datos.remove(&id);
}
}