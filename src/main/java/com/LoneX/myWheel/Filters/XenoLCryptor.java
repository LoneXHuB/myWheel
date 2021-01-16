
package com.LoneX.myWheel.Filters;


public class XenoLCryptor {
	

	private static int A=15;
	
	
	public XenoLCryptor() {

	}


	public int getA() {
		return A;
	}

	public void setA(int a) {
		A = a;
	}
	
	
	public static double cryptThis(int val) {
		return Math.exp(val)*A;
	}
	
		
	public static int decryptThis(double val) {
		return (int) Math.log(val/A);
	}
	
	
	

}
