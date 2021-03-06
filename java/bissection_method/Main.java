public class Main
{	
	/*
	chama a função bissection com os limites expostos no exercicio
	*/
	public static void main(String[] args) {
		double r = bisection(-5, 2);
		System.out.println(r);
	}
	/*
 	FUNCTION representa a função que deve ser analisada durante	
	as iterações, foi dada no exercicio
 	*/
	private static double function(float x){
	    return 2*Math.exp(x) - 1;
	}
	/*
	VARIAVEL C contém zero por nenhum motivo além de evitar problemas com o valor na RAM
	serão executadas 10 iterações como pedido durante o exercicio
	C = a média entre a e b que são os limites da função
	se o valor de a aplicado a função multiplicado por c aplicado a função
	for maior que 0 o novo limite inferior da função será o valor de C
	caso contrário o valor de b aplicado a função será multiplicado por 
	c aplicado a função chegando assim mais perto da raiz da função a cada
	iteração, para maior precisão basta permitir mais iterações na função
	RESULTADO FINAL será a média entre os dois limites encontrados ao final		
 	*/
	private static float bisection(float a, float b){
	    float c = 0;
	    for(int i = 0; i < 10; i++){
	        c = (a + b)/2;
	        if(function(a) * function(c) > 0){
	            a = c;
	        }
	        else if(function(b) * function(c) > 0){
	            b = c;
	        }
	    }
	    return (a + b)/2;
	}
}
