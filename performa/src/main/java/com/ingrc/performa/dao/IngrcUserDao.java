package com.ingrc.performa.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.ingrc.performa.model.INGRCLoginModel;
import com.ingrc.performa.model.INGRCTOwnModel;
import com.ingrc.performa.model.INGRCUserModel;
import com.ingrc.performa.web.dto.LoginDto;
import com.ingrc.performa.web.dto.TOwnDto;
import com.ingrc.performa.web.dto.UserDto;

@Repository("ingrcUserDao")
public class IngrcUserDao extends JdbcDaoSupport {
	private static final Logger logger = Logger.getLogger(IngrcUserDao.class);
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void init(DataSource dataSource){
		setJdbcTemplate(new JdbcTemplate(dataSource));
	}
	
	public Integer save(INGRCUserModel user, INGRCLoginModel login, INGRCTOwnModel town){
		System.out.println("MASUK-SAVE");
		String insertSql = "insert into ingrc_user (username,firstname,lastname,class,cdby,cdon,upby,upon,"
				+ "email,phone,ext,mobile,[function],department,room,floor,building,orgc) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = getJdbcTemplate().update(insertSql, 
				new Object[]{user.getUsername(),user.getFirstname(),user.getLastname(),user.getVclass(),user.getCdby(),
				user.getCdon(),user.getUpby(),user.getUpon(),user.getEmail(),user.getPhone(),user.getExt(),user.getMobile(),
				user.getFunction(),user.getDepartment(),user.getRoom(),user.getFloor(),user.getBuilding(),user.getOrgc()});
		
//		String insertSql2 = "insert into ingrc_login (username,password,lock,cdby,cdon,upby,upon,trdat,ltime) "
//				+ "values (?,?,?,?,?,?,?,?,?)";
//		result = result & getJdbcTemplate().update(insertSql2, 
//				new Object[]{login.getUsername(),login.getPassword(),login.getLock(),
//				login.getCdby(),login.getCdon(),login.getUpby(),login.getUpon(),login.getTrdat(),login.getLtime()});
		
		String insertSql3 = "insert into ingrc_town (owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon) "
				+ "values (?,?,?,?,?,?,?,?,?,?)";
		result = result & getJdbcTemplate().update(insertSql3, 
				new Object[]{town.getUsername(), town.getUsername(), town.getRoner(), town.getConer(), town.getSoner(), town.getScner(), 
				town.getCdby(), town.getCdon(), town.getUpby(), town.getUpon()});
		
		return result;
	}
	
	public Integer update(INGRCUserModel user, INGRCLoginModel login, INGRCTOwnModel town){
		System.out.println("MASUK-UPDATE");
		int result2,result3;
		String update = "update ingrc_user set firstname=?,lastname=?,class=?,cdby=?,cdon=?,upby=?,upon=?,"
				+ "email=?,phone=?,ext=?,mobile=?,[function]=?,department=?,room=?,floor=?,building=?,orgc=? "
				+ "where username=?";
		int result = getJdbcTemplate().update(update, new Object[]{user.getFirstname(),user.getLastname(),user.getVclass(),user.getCdby(),
				user.getCdon(),user.getUpby(),user.getUpon(),user.getEmail(),user.getPhone(),user.getExt(),user.getMobile(),
				user.getFunction(),user.getDepartment(),user.getRoom(),user.getFloor(),user.getBuilding(),user.getOrgc(),user.getUsername()});
		if(result != 1){
			String insertSql = "insert into ingrc_user (username,firstname,lastname,class,cdby,cdon,upby,upon,"
					+ "email,phone,ext,mobile,[function],department,room,floor,building,orgc) "
					+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			result = getJdbcTemplate().update(insertSql, 
					new Object[]{user.getUsername(),user.getFirstname(),user.getLastname(),user.getVclass(),user.getCdby(),
					user.getCdon(),user.getUpby(),user.getUpon(),user.getEmail(),user.getPhone(),user.getExt(),user.getMobile(),
					user.getFunction(),user.getDepartment(),user.getRoom(),user.getFloor(),user.getBuilding(),user.getOrgc()});
		}
//		String update2 = "update ingrc_login set password=?,lock=?,cdby=?,cdon=?,upby=?,upon=?,trdat=?,ltime=? "
//				+ "where username=?";
//		result2 = getJdbcTemplate().update(update2, new Object[]{login.getPassword(),login.getLock(),
//				login.getCdby(),login.getCdon(),login.getUpby(),login.getUpon(),login.getTrdat(),login.getLtime(),user.getUsername()});
//		//if record not exist just insert
//		if(result2 != 1){
//			String insertSql2 = "insert into ingrc_login (username,password,lock,cdby,cdon,upby,upon,trdat,ltime) "
//					+ "values (?,?,?,?,?,?,?,?,?)";
//			result2 = getJdbcTemplate().update(insertSql2, 
//					new Object[]{login.getUsername(),login.getPassword(),login.getLock(),
//					login.getCdby(),login.getCdon(),login.getUpby(),login.getUpon(),login.getTrdat(),login.getLtime()});
//		}
		
		String update3 = "update ingrc_town set username=?,roner=?,coner=?,soner=?,scner=?,cdby=?,cdon=?,upby=?,upon=? "
				+ "where username=?";
		result3 = getJdbcTemplate().update(update3, new Object[]{town.getUsername(), town.getRoner(), town.getConer(), town.getSoner(), town.getScner(), 
				town.getCdby(), town.getCdon(), town.getUpby(), town.getUpon(),town.getUsername()});
		//if record not exist just insert
		if (result3 != 1){
			String insertSql3 = "insert into ingrc_town (owner,username,roner,coner,soner,scner,cdby,cdon,upby,upon) "
					+ "values (?,?,?,?,?,?,?,?,?,?)";
			result3 = getJdbcTemplate().update(insertSql3, 
					new Object[]{town.getUsername(), town.getUsername(), town.getRoner(), town.getConer(), town.getSoner(), town.getScner(), 
					town.getCdby(), town.getCdon(), town.getUpby(), town.getUpon()});
		}
		result = result  & result3;
		
		return result;
	}
	
	public Integer delete(String userName){
		String sql = "delete from ingrc_user where username=?";
		int result = getJdbcTemplate().update(sql, new Object[]{userName});
		String sql1 = "delete from ingrc_town where username=?";
		int result1 = getJdbcTemplate().update(sql1, new Object[]{userName});
		String sql2= "delete from ingrc_login where username=?";
		int result2 = getJdbcTemplate().update(sql2, new Object[]{userName});
		
		return result & result1 & result2;
	}
	
	public List<UserDto> list(){
		String sql = "select A.username,A.firstname, A.lastname, A.class, A.cdby, A.cdon, A.upby, A.upon, "
				+ "A.email,A.phone,A.ext,A.mobile,A.[function],A.department,A.room,A.floor,A.building,A.orgc, "
				+ "B.roner,B.coner,B.soner,B.scner,B.cdby as cdby_b, B.cdon as cdon_b, "
				+ "B.upby as upby_b, B.upon as upon_b, C.lock, C.password "
				+ "from ingrc_user A "
				+ "left join ingrc_town B on B.username=A.username "
				+ "left join ingrc_login C on C.username=A.username ";
				//+ "where A.username = B.username ";
		logger.info(sql);
		return getJdbcTemplate().query(sql, new RowMapper<UserDto>(){
			
			public UserDto mapRow(ResultSet result, int arg1)
					throws SQLException {
			LoginDto lgdto = new LoginDto();
			TOwnDto towndto = new TOwnDto();
	
			lgdto.setUsername(result.getString("username"));
			lgdto.setLock(result.getString("lock"));	
			lgdto.setPassword(result.getString("password"));
			
			towndto.setUsername(result.getString("username"));
			towndto.setConer(result.getString("coner"));
			towndto.setRoner(result.getString("roner"));
			towndto.setScner(result.getString("scner"));
			towndto.setSoner(result.getString("soner"));
			
				return new UserDto(
						result.getString("username"), 
						result.getString("firstname"), 
						result.getString("lastname"), 
						result.getString("class"), 
						result.getString("cdby"), 
						result.getString("cdon"), 
						result.getString("upby"), 
						result.getString("upon"),
						result.getString("email"),
						result.getString("phone"),
						result.getString("ext"),
						result.getString("mobile"),
						result.getString("function"),
						result.getString("department"),
						result.getString("room"),
						result.getString("floor"),
						result.getString("building"),
						result.getString("orgc"),
						lgdto,
						towndto);
			}
		});
	}
	
	public UserDto getByUserName(String userName){
//		String sql = "select username,firstname,lastname,class,cdby,cdon,upby,upon,"
//				+ " email,phone,ext,mobile,[function],department,room,floor,building,orgc from ingrc_user where username=?";
		String sql = "select A.username,A.firstname, A.lastname, A.class, A.cdby, A.cdon, A.upby, A.upon, "
				+ "A.email,A.phone,A.ext,A.mobile,A.[function],A.department,A.room,A.floor,A.building,A.orgc, "
				+ "B.roner,B.coner,B.soner,B.scner,B.cdby as cdby_b, B.cdon as cdon_b, "
				+ "B.upby as upby_b, B.upon as upon_b, C.lock, C.password "
				+ "from ingrc_user A "
				+ "left join ingrc_town B on B.username=A.username "
				+ "left join ingrc_login C on C.username=A.username "
				+ "where A.username=?";
		return getJdbcTemplate().queryForObject(sql, new Object[]{userName}, new RowMapper<UserDto>(){

			public UserDto mapRow(ResultSet result, int arg1)
					throws SQLException {
				LoginDto lgdto = new LoginDto();
				TOwnDto towndto = new TOwnDto();
				
				lgdto.setUsername(result.getString("username"));
				lgdto.setLock(result.getString("lock"));	
				lgdto.setPassword(result.getString("password"));
				
				towndto.setUsername(result.getString("username"));
				towndto.setConer(result.getString("coner"));
				towndto.setRoner(result.getString("roner"));
				towndto.setScner(result.getString("scner"));
				towndto.setSoner(result.getString("soner"));
				
				return new UserDto(
						result.getString("username"), 
						result.getString("firstname"), 
						result.getString("lastname"), 
						result.getString("class"), 
						result.getString("cdby"), 
						result.getString("cdon"), 
						result.getString("upby"), 
						result.getString("upon"),
						result.getString("email"),
						result.getString("phone"),
						result.getString("ext"),
						result.getString("mobile"),
						result.getString("function"),
						result.getString("department"),
						result.getString("room"),
						result.getString("floor"),
						result.getString("building"),
						result.getString("orgc"),
						lgdto,
						towndto);
			}
		});
	}
	

}
