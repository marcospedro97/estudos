public class Main
{
	public static void main(String[] args) {
	    double l = 0;
	    for(double i = 0.1; i <= 1; i=i + 0.1){
	        double x = integral(i, i - 0.1);
	        l = l + x;
	    }
		
		System.out.println(l);
	}
	
	private static double function(double x){
	    return Math.exp(x)*Math.sin(x);
	}
	private static double integral(double x, double xl){
	    double h = function(x);
	    double b = x - xl;
	    return b * h;
	}
}
//a rotina main executa cada iteração,  q