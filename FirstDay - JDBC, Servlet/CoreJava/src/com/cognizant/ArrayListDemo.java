package com.cognizant;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ArrayListDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List<Integer> li = new ArrayList<Integer>();
		
		li.add(7);
		li.add(0,8);
		
		System.out.println("ArrayList Content" + li);
		
		Set s = new HashSet();
		s.add("Hello");
		s.add(1);
		
		System.out.println("HashSet Content" + s);
		
		

	}

}
