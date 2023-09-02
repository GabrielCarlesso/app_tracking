import 'package:latlong2/latlong.dart';

class GridUtils {
  List<List<LatLng>> grid = [];
  List<List<LatLng>> centerPoints = [];

  //1 grau de latitude é aproximadamente 111.111 km
  double squareSize = 20.0 / 111111.0; // Igual a 20metros

  GridUtils(LatLng centralPoint) {
    // Número de quadrados em cada direção a partir do ponto central
    int numSquares = 5;

    double minLatitude = centralPoint.latitude - (squareSize * numSquares);
    double minLongitude = centralPoint.longitude - (squareSize * numSquares);

    double minLatCenter =
        centralPoint.latitude - (squareSize * numSquares) + squareSize / 2;
    double minLongCenter =
        centralPoint.longitude - (squareSize * numSquares) + squareSize / 2;

    // Loop para criar o grid
    for (int i = 0; i <= numSquares * 2; i++) {
      List<LatLng> gridRow = [];
      List<LatLng> centerRow = [];
      for (int j = 0; j <= numSquares * 2; j++) {
        gridRow.add(LatLng(
            minLatitude + (i * squareSize), minLongitude + (j * squareSize)));
        if (j != 10) {
          centerRow.add(LatLng(minLatCenter + (i * squareSize),
              minLongCenter + (j * squareSize)));
        }
      }
      grid.add(gridRow);
      if (i != 10) {
        centerPoints.add(centerRow);
      }
    }
  }

  List<LatLng> getGridColumn(int columnIndex) {
    List<LatLng> column = [];

    for (int i = 0; i < grid.length; i++) {
      column.add(grid[i][columnIndex]);
    }
    return column;
  }

  List<LatLng> getGridRow(int rowIndex) {
    return grid[rowIndex];
  }
}
