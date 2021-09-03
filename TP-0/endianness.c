#include <stdio.h>

int main(int argc, char* args[]){
	char big_endian[4] = "BE\n";
	char little_endian[4] = "LE\n";
	int numerito = 0x1234;
	char primerByte = *((char*) &numerito);
	if(primerByte == 0x34){
		fwrite(big_endian,1,3,stdout);
	}
	if(primerByte == 0x12){
		fwrite(little_endian,1,3,stdout);
	}
	return 0;
}
