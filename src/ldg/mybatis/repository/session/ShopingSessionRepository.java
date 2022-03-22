package ldg.mybatis.repository.session;

import java.io.*;
import java.math.BigInteger;
import java.util.*;

import ldg.mybatis.model.User;
import ldg.mybatis.model.Vw_order;
import ldg.mybatis.model.Items;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class ShopingSessionRepository {
	private final String namespace = "ldg.mybatis.repository.mapper.MyBatisMapper";
	
	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public long insertUser(User user) { // ȸ�������� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertUser";
			int result = sqlSession.insert(statement, user);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}

	public int insertPoint(String userID) { // ȸ�����Խ� �� ȸ���� ����Ʈ�� 0���� �ʱ�ȭ ��Ű�� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertPoint";
			int result = sqlSession.insert(statement, userID);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public String selectUserLogin(User user) { // �α����� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".selectUserLogin", user);
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}

	public long insertItems(Items items) { // ��ǰ��� �߰��� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertItems";
			int result = sqlSession.insert(statement, items);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public int deleteItems(Items items) { // ��ǰ ������ ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".deleteItems";
			int result = sqlSession.delete(statement, items);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public void updateUserID(Map<String, Object> map) { // ���̵� ������ ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			long result = sqlSession.update(namespace + ".updateUserID", map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public void updateUserPassword(Map<String, Object> map) { // ��й�ȣ ������ ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			long result = sqlSession.update(namespace + ".updateUserPassword", map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Items> shopingList(Items items) { // ��ǰ ��� �Խø� ���� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".shopingList", items);
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<Items> itemView(Items items) { // �����ϱ� ��ư�� ���� �� ��ǰ�� ���� ������ ��Ÿ���ִ� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".itemView", items);
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public long deleteUser(User user) { // ȸ�� Ż�� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int result = sqlSession.delete(namespace + ".deleteUser", user);
			System.out.println("(ȸ��Ż��) result = " + result);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public void buyAction(Map<String, Object> map) { // ����Ȯ�� ���������� ���������� ���Ź�ư�� ������ ����Ǵ� ���� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			long result = sqlSession.insert(namespace + ".buyAction", map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<Vw_order> shopingLog(Vw_order vw_order) { // ȸ������ ��� �ֹ������� Ȯ���� �� �ֵ��� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".shopingLog", vw_order);
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<User> selectUserList() { // ������ �������� 'ȸ������'�� ������ �������� ��� ȸ������ ������ �����ֵ��� ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserList");
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<Object> sumOrderPrice(List<User> userList) { // �� ȸ������ ������ �ݾ��� �հ踦 ��Ÿ���ִ� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			List<Object> list = new ArrayList<>();
			for(int i = 0; i < userList.size(); i++) {
				Object obj = sqlSession.selectOne(namespace + ".sumOrderPrice", userList.get(i).getUserID());
				if(obj == null) { list.add(0); } // ���ų����� �ϳ��� ���ٸ� 0�� �ֵ��� ����
				else { list.add(obj); } // ������ ���� �����Ѵٸ� ���� ����
			}
			return list;
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public String maxSumPrice() { // ���ž��� ���� ���� ȸ���� ���̵� ��Ÿ���ִ� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectOne(namespace + ".maxSumPrice");
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<Vw_order> myBuyList(String userID) { // ȸ�� ������ '�� ����'���������� ���� ���� ����� ��Ÿ���ִ� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".myBuyList", userID);
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public int updateItems(Items items) { // ��ǰ ���� ������ ������ �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			int result = sqlSession.update(namespace + ".updateItems", items);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public int Point(String userID) { // �� ȸ������ ������ �ݾ��� �հ踦 ��Ÿ���ִ� �޼���
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int userPoint = 0;
		try {
			Object obj = sqlSession.selectOne(namespace + ".sumOrderPrice", userID);
			if(obj == null) { throw new Exception(); } // ���ų����� �ϳ��� ���ٸ� �ͼ��� ����
			int sumPrice = Integer.parseInt(obj.toString());
			userPoint = (int) (sumPrice * 0.05);
			Map<String, Object> map = new HashMap<>();
			map.put("userID", userID);
			map.put("sumPrice", sumPrice);
			map.put("userPoint", userPoint);
			
			int result = sqlSession.update(namespace + ".point", map);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return userPoint;
	}
	
}
