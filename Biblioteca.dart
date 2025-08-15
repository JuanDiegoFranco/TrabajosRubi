import 'dart:io';

// Lista de libros (cada libro será un mapa)

List<Map<String, dynamic>> biblioteca = [];

// ------------------------------------------------- AGREGAR LIBRO
void agregarLibro() {
  print('Ingrese el título del libro:');
  String? titulo = stdin.readLineSync();

  print('Ingrese el autor:');
  String? autor = stdin.readLineSync();

  print('Ingrese el año de publicación (ej: 2005):');
  String? inputAno = stdin.readLineSync();
  int? ano = int.tryParse(inputAno ?? '');

  if (titulo != null &&
      titulo.isNotEmpty &&
      autor != null &&
      autor.isNotEmpty &&
      ano != null &&
      ano > 0) {
    biblioteca.add({
      'titulo': titulo,
      'autor': autor,
      'ano': ano,
    });
    print('Libro agregado con éxito.\n');
  } else {
    print('Error: Datos inválidos.\n');
  }
}

// ------------------------------------------------- LISTAR LIBROS
void listarLibros() {
  if (biblioteca.isEmpty) {
    print('No hay libros en la biblioteca.\n');
  } else {
    print('\nLista de libros:');
    for (int i = 0; i < biblioteca.length; i++) {
      var libro = biblioteca[i];
      print('${i + 1}. ${libro['titulo']} - ${libro['autor']} (${libro['ano']})');
    }
    print('');
  }
}

// ------------------------------------------------- MOSTRAR LIBROS
void mostrarLibros() {
  if (biblioteca.isEmpty) {
    print('No hay libros en la biblioteca.\n');
  } else {
    print('\nLibros:');
    for (var libro in biblioteca) {
      print('${libro['titulo']} - ${libro['autor']} (${libro['ano']})');
    }
    print('');
  }
}

// ------------------------------------------------- ACTUALIZAR LIBRO
void actualizarLibro() {
  listarLibros();
  if (biblioteca.isEmpty) return;

  print('Ingrese el número del libro que desea actualizar:');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index == null || index < 1 || index > biblioteca.length) {
    print('Número inválido.\n');
    return;
  }

  var libro = biblioteca[index - 1];

  print('Nuevo título (dejar vacío para mantener "${libro['titulo']}"):');
  String? nuevoTitulo = stdin.readLineSync();
  if (nuevoTitulo != null && nuevoTitulo.isNotEmpty) {
    libro['titulo'] = nuevoTitulo;
  }

  print('Nuevo autor (dejar vacío para mantener "${libro['autor']}"):');
  String? nuevoAutor = stdin.readLineSync();
  if (nuevoAutor != null && nuevoAutor.isNotEmpty) {
    libro['autor'] = nuevoAutor;
  }

  print('Nuevo año de publicación (dejar vacío para mantener ${libro['ano']}):');
  String? nuevoAno = stdin.readLineSync();
  if (nuevoAno != null && nuevoAno.isNotEmpty) {
    int? ano = int.tryParse(nuevoAno);
    if (ano != null && ano > 0) {
      libro['ano'] = ano;
    } else {
      print('Año inválido, se mantiene el anterior.');
    }
  }

  print('Libro actualizado con éxito.\n');
}

// ------------------------------------------------- ELIMINAR LIBRO
void eliminarLibro() {
  listarLibros();
  if (biblioteca.isEmpty) return;

  print('Ingrese el número del libro que desea eliminar:');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index == null || index < 1 || index > biblioteca.length) {
    print('Número inválido.\n');
    return;
  }

  var eliminado = biblioteca.removeAt(index - 1);
  print('Libro "${eliminado['titulo']}" eliminado con éxito.\n');
}

// ------------------------------------------------- MENÚ PRINCIPAL
void main() {
  while (true) {
    print('===== MENÚ =====');
    print('1. Agregar libro');
    print('2. Mostrar libros');
    print('3. Listar libros con índice');
    print('4. Actualizar libro');
    print('5. Eliminar libro');
    print('6. Salir');
    stdout.write('Seleccione una opción: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarLibro();
        break;
      case '2':
        mostrarLibros();
        break;
      case '3':
        listarLibros();
        break;
      case '4':
        actualizarLibro();
        break;
      case '5':
        eliminarLibro();
        break;
      case '6':
        print('Saliendo del programa...');
        return;
      default:
        print('Opción no válida.\n');
    }
  }
}
