package com.springcore;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Trainees {
	private TrainerInterface ti;
	
	private LibraryInterface li;
	
	
	
	
	public void setLi(LibraryInterface li) {
		this.li = li;
	}



	//adapter
	public void setTi(TrainerInterface ti) {
		this.ti = ti;
	}



	public void print() {
		ti.teach();
		li.readBook();
	}
	
	

	public static void main(String[] args) {
		
		ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("abc.xml");
		
		Trainees tt=(Trainees)ctx.getBean("t2");
		
		//Trainees tt=new Trainees();
		
	//	TrainerInterface tt1=new Trainer();
	//	tt.setTi(tt1);   //dependency injenction
		
		tt.print();

	}

}
