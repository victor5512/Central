module automoviles::automoviles;

use std::debug::print;
use std::string::utf8;

const NUMERO: u8 = 100;

public fun suma(x: u8) {
    let mut numero = 50u16;
    let entrada: u16 = x as u16;
    // print(&(utf8(b"Suma:")));
    // numero=numero +entrada;
    // print(&numero);

    //  print(&(utf8(b"Resta:")));
    // numero=numero -entrada;
    // print(&numero);

    //     print(&(utf8(b"Multi:")));
    // numero=numero * entrada;
    // print(&numero);

    //     print(&(utf8(b"Div:")));
    // numero=numero / entrada;
    // print(&numero);

    let verdadero: bool = true;
    let falso: bool = false;

    // print(&(verdadero && falso));
    // print(&(verdadero || falso));
    // print(&(!verdadero));
    // print(&(!falso));

    // print(&(x==NUMERO));
    // print(&(x !=NUMERO));
    // print(&(x >= NUMERO));
    // print(&(x <= NUMERO));

    // if(x==NUMERO){
    //     print(&(utf8(b"NUMERO 100")));
    // }else if(x < NUMERO){
    //     print(&(utf8(b"NUMERO MENOR A 100")));
    // }
    // else{
    //     print(&(utf8(b"NUMERO MAYOR A 100")));
    // };
    // print(&(utf8(b"IF terminado")));
    let mut contador: u8 = 0;
    // while (contador < x) {
    //     print(&contador);
    //     contador = contador +1;
    // };

    // print(&(utf8(b"WHILE terminado")));

    loop {
        contador = contador+1;
        if (contador ==x) {
            break
        } else if ((contador % 2)==0) {
            print(&(utf8(b"NUMERO PAR")));
            print(&contador);
            continue
        };

        print(&(utf8(b"NUMERO INPAR")));
        print(&contador);
    }
}

#[test]
public fun testing() {
    suma(100);
}
