package farm;

public class Customer {
	private int regid;
	private String cfname;
	private String clname;
	
	public Customer() {
		regid=0;
		cfname="";
		clname="";
	}
	public void setcustomer(int regid, String cfname, String clname){
		this.regid=regid;
		this.cfname=cfname;
		this.cfname=cfname;
		System.out.println(this.cfname);
	}
	public int getcid() {
		return regid;
	}
	public void setcid(int regid) {
		this.regid=regid;
	}
	public String getcfname() {
		return cfname;
	}
	public void setcfname(String cfname) {
		this.cfname=cfname;
	}
	public String getclname() {
		return clname;
	}
	public void setplname(String clname) {
		this.clname=clname;
	}



}