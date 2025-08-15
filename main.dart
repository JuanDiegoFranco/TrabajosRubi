// import 'dart:io';
// import 'dart:math';

// void main(){


// // var a = 10;
// // var name = "juan";
// // var isTrue = true;
// // var pi = 1.14;


// // int b = 20;
// // String lastName = "Ramos";
// // double e = 2.1789;
// // bool isFalse = false;


// // print ('los numeros son : $a, $b, el apellido es: $lastName, $isFalse');


// // const piConst = 3.14; //Timpeo de compilacion
// // final eConst = 2.14; //Tiempo de ejecucion 


// // print('piConst: $piConst, eConst: $eConst');

// //--------------------------------------------Operaciones de listas-------------------------------------------

// // var list = [1,2,3,4,5];


// //-------------------------------------------------Para agregar valor-------------------------------------------

// // list.add(6);


// //---------------------------PARA REMOVER-----------------------------

// // list.remove(6);

// //------------------------AGREGAR UN NUMERO EN LA POSICION DESEADA EN ESTE CASO 50 EN POSICION 0------------------------


// //list.insert(0,50);



// //-----------------------------------------------PARA ORGANIZAR------------------------------------------------------


// //list.sort();


// //-----------------------------------------------------------------------
// // print(list);



// //------------------------------------------SET--------------------------


// //EL SET NO IMPRIMRE DOS VALORES REPETIDO O IGUALES

// // var set = {1,2,3,4,5};



// //---------------------------SE PUEDE REMOVER Y AGREGAR--------------------------------------------------

// // set.addAll({7,8,9});

// //-----------------------------------------

// // print(set);





// //----------------------------------------------------MAP-------------------------------------------------


// // var map ={



// //     'name': 'rubi',
// //     'edad': 39,
// //     'isMarried': true,
// //     'hobbies': ['leer', 'viajar', 'dormir',]

// // };

// // print(map);

// //----------------------------------------------Actualizar -----------------------

// // map['edad'] = 40; 

// //     print(map);

// // //---------------------------------------AGREGAR VALOR -------------------
// // (map['haobbies'] as List ).add('cocinar');
// // print(map);

// // //-----------------------------REMOVE VALOR-------------------------------


// // map.remove('isMarried');
// // print(map);


// // ------------------------------------------DATOS DE ENTRADA -----------------------------

// // print('ingrese su nombre');
// // String? nombre = stdin.readLineSync();
// // print(nombre);

// // print('ingrese su edad');
// // int? edad = int.tryParse(stdin.readLineSync()!);
// // print ('la edad es $edad');

// //----------------------------------------------------------------------------------------------



// //---------------------------------------FUNCIONES-------------------------------------------


// // int suma(int a, int b){


// // return a + b;

// // }

// // print('Digite el valor numero uno');
// // int? valor1 = int.tryParse(stdin.readLineSync()!);
// // print('digite el segundo numero valor');
// // int? valor2 = int.tryParse(stdin.readLineSync()!);

// // int result = suma(valor1!, valor2!);
// // print(result);










// }




import 'dart:io';
import 'dart:math';

void main() {
  int? opcion = -1;

  while (opcion != 0) {
    print('\n--- MENÚ ---');
    print('1. Calcular distancia (MRU)');
    print('2. Calcular promedio de 3 notas');
    print('3. Calcular puntos en fútbol');
    print('4. Calcular sueldo');
    print('5. Calcular hipotenusa');
    print('6. Convertir °C a Fahrenheit');
    print('0. Salir');

    // // Ingresar opción
    print('Ingrese una opción:');
    opcion = int.tryParse(stdin.readLineSync()!) ?? -1;

    switch (opcion) {
      case 1:
        // // Calcular distancia = velocidad * tiempo
        print('Ingrese la velocidad (m/s):');
        int? v = int.tryParse(stdin.readLineSync()!);

        print('Ingrese el tiempo (s):');
        int? t = int.tryParse(stdin.readLineSync()!);

        if (v != null && t != null) {
          int d = v * t;
          print('Distancia: $d metros');
        } else {
          print('Entrada inválida');
        }
        break;

      case 2:
        // // Calcular promedio de 3 notas
        print('Ingrese la nota 1:');
        double? n1 = double.tryParse(stdin.readLineSync()!);

        print('Ingrese la nota 2:');
        double? n2 = double.tryParse(stdin.readLineSync()!);

        print('Ingrese la nota 3:');
        double? n3 = double.tryParse(stdin.readLineSync()!);

        if (n1 != null && n2 != null && n3 != null) {
          double promedio = (n1 + n2 + n3) / 3;
          print('Promedio: ${promedio.toStringAsFixed(2)}');
        } else {
          print('Entrada inválida');
        }
        break;

      case 3:
        // // Calcular puntos en fútbol (ganado=3, empatado=1, perdido=0)
        print('Ingrese partidos ganados:');
          int? g = int.tryParse(stdin.readLineSync()!);

        print('Ingrese partidos empatados:');
        int? e = int.tryParse(stdin.readLineSync()!);

        print('Ingrese partidos perdidos:');
        int? p = int.tryParse(stdin.readLineSync()!);

        if (g != null && e != null && p != null) {
          int puntos = g * 3 + e;
          print('Ganados: $g, Empatados: $e, Perdidos: $p');
          print('Puntos totales: $puntos');
        } else {
          print('Entrada inválida');
        }
        break;

     case 4:
        // // Calcular sueldo = horas * tarifa

        print('ingrese su nombre');
        String? nombre = stdin.readLineSync();


        print('Ingrese horas trabajadas:');
        double? horas = double.tryParse(stdin.readLineSync()!);

        print('Ingrese tarifa por hora:');
        double? tarifa = double.tryParse(stdin.readLineSync()!);

        if (horas != null && tarifa != null) {
          double sueldo = horas * tarifa;
          print('Su nombre es $nombre, Sueldo: \$${sueldo.toStringAsFixed(2)}');
        } else {
          print('Entrada inválida');
        }
        break;


      case 5:
        // // Calcular hipotenusa con Pitágoras: h = √(a² + b²)
        print('Ingrese el lado A:');
        double? a = double.tryParse(stdin.readLineSync()!);

        print('Ingrese el lado B:');
        double? b = double.tryParse(stdin.readLineSync()!);

        if (a != null && b != null) {
          double h = sqrt(pow(a, 2) + pow(b, 2));
          print('Hipotenusa: ${h.toStringAsFixed(2)}');
        } else {
          print('Entrada inválida');
        }
        break;

      case 6:
        // // Convertir 70°C a Fahrenheit
        print('Ingrese los grados centigrados:');
        double? c = double.tryParse(stdin.readLineSync()!);
        // double c = 70;
        double f = (c! * 1.8) + 32;
        print('Los grados centigrados que usted puso fueron : $c, y se convirtieron a = ${f.toStringAsFixed(2)}°F');
        break;

      case 0:
        print('¡Hasta luegooooooooooooooooooooo TE QUEREMOS RUBI!');
        break;

      default:
        print('Opción inválida VUELVA A INTENTAR');
    }
  }
}

