echo "pruebas TP1 Organizacion de computadoras"
echo "probando comando -m para los valores 192 y 256"
echo "Se esperan el valor de salida mcm = 768 y se obtiene:" 
./tp -m -o - 192 256
echo "probando comando -m para los valores 5 y 10"
echo "Se esperan el valor de salida mcm = 10 y se obtiene:" 
./tp -m -o - 5 10
echo "probando comando -m para los valores 1111 y 1294"
echo "Se esperan el valor de salida mcm = 1437634 y se obtiene:" 
./tp -m -o - 1111 1294
echo "probando comando -d para los valores 192 y 256"
echo "Se esperan el valor de salida mcd = 64 y se obtiene:" 
./tp -d -o - 192 256
echo "probando comando -d para los valores 5 y 10"
echo "Se esperan el valor de salida mcd = 5 y se obtiene:" 
./tp -d -o - 5 10
echo "probando comando -d para los valores 1111 y 1294"
echo "Se esperan el valor de salida mcd = 1 y se obtiene:" 
./tp -d -o - 1111 1294
echo "probando sin especificar para los valores 192 y 256"
./tp -o - 192 256
echo "probando sin especificar para los valores 5 y 10"
./tp -o - 5 10
echo "probando sin especificar para los valores 1111 y 1294"
./tp -o - 1111 1294
echo "probando sin especificar para los valores 43330000 y 4294349382"
echo "Se espera que esto falle ya que el mcm no sera representable en 32 bits"
./tp -o - 43330000 4294349382

