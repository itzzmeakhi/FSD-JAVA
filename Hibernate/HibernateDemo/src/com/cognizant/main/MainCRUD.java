package com.cognizant.main;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.cognizant.bean.UserBean;

public class MainCRUD {

	public static void main(String[] args) {
		StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();

		Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build();

		SessionFactory factory = meta.getSessionFactoryBuilder().build();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		UserBean user = new UserBean();
		
		user.setId(177);
		user.setEmail("akhilmallidi.98@gmail.com");
		user.setUsername("Akhil");

		
		session.save(user);
		t.commit();
		System.out.println("1 Row Inserted");
		session.close();
		factory.close();
	}

}
