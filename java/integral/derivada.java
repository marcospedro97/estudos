public class Main
{
	public static void main(String[] args) 
	{
	        double x = 1;
	        double xl = 0;
        	double y = function(x);
	        double yl = function(xl);
	        double d = derivada(x, xl, y, yl);
        	System.out.println(d);
	}
	
	private static double function(double x)
	{
	    return Math.exp(x)*Math.sin(x);
	}
	
	private static double derivada(double x, double xl, double y, double yl)
	{
	    double dx = xl - x;
	    double dy = yl - y;
	    return dx/dy;
	}
}
