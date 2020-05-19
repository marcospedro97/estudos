public class Main
{
	public static void main(String[] args) {
		double r = bisection(-5, 2);
		System.out.println(r);
	}
	
	private static double function(float x){
	    return 2*Math.exp(x) - 1;
	}
	
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
