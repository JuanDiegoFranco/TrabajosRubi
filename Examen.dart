import 'dart:io';

// ---------------------------------------------------------------- LIST EN MAPEO PARA GUARDAR LOS DATOS 

// esto sirve para guardar los datos clave - valor ( osear para el nombre, precio etc )

List<Map<String, dynamic>> productos = [];

//-----------------------------------------------------AGREGAR PRODUCTO

//ejecuta acciones pero no retorna nada 
void agregarProducto() {
  
  print('Ingrese el nombre del producto:');
  String? nombre = stdin.readLineSync();

  print('Ingrese el precio del producto:');
  String? precioStr = stdin.readLineSync();
  // ?? esto sirve para que el valor precio si esta vacio 
  // pues no pase null y pase el campo vacio 
  double? precio = double.tryParse(precioStr ?? '');

  print('Ingrese la cantidad disponible:');
  String? cantidadStr = stdin.readLineSync();
  int? cantidad = int.tryParse(cantidadStr ?? '');

  if (nombre != null &&
      nombre.isNotEmpty &&
      precio != null &&
      precio >= 0 &&
      cantidad != null &&
      cantidad >= 0) {

    productos.add({
      'nombre': nombre,
      'precio': precio,
      'cantidad': cantidad,
    });
    print('Producto agregado con éxito.\n');
  } else {
    print('Error: Datos inválidos.\n');
  }
}


// ---------------------------------------------------------------------LISTAR PRODUCTO


void listarProductos() {
  if (productos.isEmpty) {
    print('No hay productos registrados.\n');
  } else {
    print('\nLista de productos:');
    for (int i = 0; i < productos.length; i++) {
      var p = productos[i];
      print('${i + 1}. ${p['nombre']} - Precio: \$${p['precio']} - Cantidad: ${p['cantidad']}');
    }
    print('');
  }
}


//---------------------------------------------------------------- ACTUALIZAR PRODUCTO
void actualizarProducto() {
  listarProductos();
  if (productos.isEmpty) return;

  print('Ingrese el número del producto que desea actualizar:');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index == null || index < 1 || index > productos.length) {
    print('Número inválido.\n');
    return;
  }

  var producto = productos[index - 1];

  print('Nuevo nombre (dejar vacío para mantener "${producto['nombre']}"):');
  String? nuevoNombre = stdin.readLineSync();
  if (nuevoNombre != null && nuevoNombre.isNotEmpty) {
    producto['nombre'] = nuevoNombre;
  }

  print('Nuevo precio (dejar vacío para mantener ${producto['precio']}):');
  String? nuevoPrecio = stdin.readLineSync();
  if (nuevoPrecio != null && nuevoPrecio.isNotEmpty) {
    double? precio = double.tryParse(nuevoPrecio);
    if (precio != null && precio >= 0) {
      producto['precio'] = precio;
    } else {
      print('Precio inválido, se mantiene el anterior.');
    }
  }

  print('Nueva cantidad (dejar vacío para mantener ${producto['cantidad']}):');
  String? nuevaCantidad = stdin.readLineSync();
  if (nuevaCantidad != null && nuevaCantidad.isNotEmpty) {
    int? cantidad = int.tryParse(nuevaCantidad);
    if (cantidad != null && cantidad >= 0) {
      producto['cantidad'] = cantidad;
    } else {
      print('Cantidad inválida, se mantiene la anterior.');
    }
  }

  print('Producto actualizado con éxito.\n');
}



// ------------------------------------------------------------- ELIMINAR PRODUCTO
void eliminarProducto() {
  listarProductos();
  if (productos.isEmpty) return;

  print('Ingrese el número del producto que desea eliminar:');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index == null || index < 1 || index > productos.length) {
    print('Número inválido.\n');
    return;
  }

  var eliminado = productos.removeAt(index - 1);
  print('Producto "${eliminado['nombre']}" ELIMINADO .\n');
}

//---------------------------------------------- MENU PRINCIPAL 
void main() {
  while (true) {
    print('===== MENÚ =====');
    print('1. Agregar producto');
    print('2. Listar productos');
    print('3. Actualizar producto');
    print('4. Eliminar producto');
    print('5. Salir');
    stdout.write('Seleccione una opción: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarProducto();
        break;
      case '2':
        listarProductos();
        break;
      case '3':
        actualizarProducto();
        break;
      case '4':
        eliminarProducto();
        break;
      case '5':
        print('Saliendo del programa...');
        return;
      default:
        print('Opción no válida.\n');
    }
  }
}
