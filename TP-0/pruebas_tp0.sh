echo "pruebas TP0 Organizacion de computadoras"
echo "pruebas de archivos codificados en base 64 con entrada stdin y salida por stdout"

echo "corriendo el programa con el archivo quijote.txt... salida cifrada esperada: "
cat quijote.txt | base64
echo "salida cifrada obtenida: "
cat quijote.txt | ./tp
echo ""

echo "corriendo el programa con el archivo attack.txt... salida cifrada esperada: "
cat attack.txt | base64
echo "salida cifrada obtenida: "
cat attack.txt | ./tp
echo ""

echo "corriendo el programa con el archivo corto.txt... salida cifrada esperada: "
cat corto.txt | base64
echo "salida cifrada obtenida: "
cat corto.txt | ./tp
echo ""

echo "corriendo el programa con el archivo lorem.txt... salida cifrada esperada: "
cat lorem.txt | base64
echo "salida cifrada obtenida: "
cat lorem.txt | ./tp
echo ""

echo "corriendo el programa con el archivo Radmacher.txt... salida cifrada esperada: "
cat Radmacher.txt | base64
echo "salida cifrada obtenida: "
cat Radmacher.txt | ./tp
echo ""

echo "corriendo el programa con el archivo Einstein.txt... salida cifrada esperada: "
cat Einstein.txt | base64
echo "salida cifrada obtenida: "
cat Einstein.txt | ./tp
echo ""

echo "pruebas de archivos codificados y luego decodificados en base 64 "

echo "cifrando archivo quijote.txt"
./tp -i quijote.txt -o quijoted.txt
echo "descifrando archivo quijoted.txt: "
./tp -d -i quijoted.txt

echo "cifrando archivo attack.txt"
./tp -i attack.txt -o attackd.txt
echo "descifrando archivo attackd.txt: "
./tp -d -i attackd.txt

echo "cifrando archivo corto.txt"
./tp -i corto.txt -o cortod.txt
echo "descifrando archivo cortod.txt: "
./tp -d -i cortod.txt

echo "cifrando archivo lorem.txt"
./tp -i lorem.txt -o loremd.txt
echo "descifrando archivo loremd.txt: "
./tp -d -i loremd.txt

echo "cifrando archivo Radmacher.txt"
./tp -i Radmacher.txt -o Radmacherd.txt
echo "descifrando archivo Radmacher.txt: "
./tp -d -i Radmacherd.txt

echo "cifrando archivo Einstein.txt"
./tp -i Einstein.txt -o Einsteind.txt
echo "descifrando archivo Radmacher.txt: "
./tp -d -i Einsteind.txt

echo "pruebas con bash /dev/zero"
echo "cifrando... salida esperada: "
head -c 1 /dev/zero | base64
echo "salida obtenida:  "
head -c 1 /dev/zero | ./tp
echo ""

echo "pruebas con bash /dev/null"
echo "cifrando... salida esperada: "
head -c 1 /dev/null | base64
echo "salida obtenida:  "
head -c 1 /dev/null | ./tp
