package com.kh.sellboard.model.service;

import java.sql.Connection;

import com.kh.sellboard.model.dao.MyTransactionDao;
import com.kh.sellboard.model.vo.Transaction;
import static com.kh.common.JDBCTemplate.*;

public class MyTransactionService {


	public int insertMyTransaction(Transaction tr) {
		Connection conn = getConnection();
		

		int result = new MyTransactionDao().insertMyTransaction(tr, conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
		
		return result;
		
	}

}
