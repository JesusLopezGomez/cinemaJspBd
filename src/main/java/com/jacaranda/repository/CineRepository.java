package com.jacaranda.repository;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jacaranda.model.Cinema;
import com.jacaranda.util.BdUtil;

public class CineRepository {

	public static Cinema anniadirCine(Cinema c){
		Transaction transaction = null;
		Cinema result = null;
		if(c.getCine() != null) {
			Session session = BdUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			try {
				session.save(c);
				transaction.commit();
			}catch (Exception e) {
				transaction.rollback();
			}
			
			session.close();
		}
		return result;
	}
	
	public static Cinema deleteCinme(Cinema c) {
		Transaction transaction = null;
		Cinema result = null;
		if(c.getCine() != null) {
			Session session = BdUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			try {
				session.delete(c);
				transaction.commit();
			}catch (Exception e) {
				transaction.rollback();
			}
			
			session.close();
		}
		return result;
	}
	
	public static Cinema editCinme(Cinema c) {
		Transaction transaction = null;
		Cinema result = null;
		if(c.getCine() != null) {
			Session session = BdUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			try {
				session.delete(c);
				transaction.commit();
			}catch (Exception e) {
				transaction.rollback();
			}
			
			session.close();
		}
		return result;
	}

}
