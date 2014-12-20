package com.ingrc.performa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth)
//			throws Exception {
//		auth.inMemoryAuthentication()
//		.withUser("yogi").password("123456").roles("USER")
//		.and()
//		.withUser("admin").password("123456").roles("ADMIN");
//		 
//	}
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
 
	  auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery(
			"select uname,passwd, enabled from ingrc_web_user where uname=?")
		.authoritiesByUsernameQuery(
			"select uname,role from ingrc_web_user where uname=?")
		.passwordEncoder(passwordEncoder());
	}
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	// .csrf() is optional, enabled by default, if using
	// WebSecurityConfigurerAdapter constructor
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
		.authorizeRequests()
			.antMatchers(
					"/accesscontrol*/**",
					"/mitigationcontrol*/**",
					"/riskmaintenance*/**",
					"/menumaster/**",
					"/menumaster-left/**",
					"/admin-user/**",
					"/user/**",
					"/rulemaintenance*/**"
					).access("hasRole('ROLE_ADMIN')")
			.anyRequest().authenticated()
			.and()
		 .formLogin().loginPage("/login")
		 	.failureUrl("/login?error")
		    .usernameParameter("username")
		    .passwordParameter("password")
		    .defaultSuccessUrl("/home.html")
		    .permitAll()
			.and()
		.logout()
			.logoutSuccessUrl("/login?logout")
			.permitAll()
			.and()
		.csrf().disable()
			;
		
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			.antMatchers("/bootstrap/**")
			.antMatchers("/css/**")
			.antMatchers("/fonts/**")
			.antMatchers("/img/**")
			.antMatchers("/js/**")
			.antMatchers("/*?lang=*")
			.antMatchers("/400.jsp")
			.antMatchers("/401.jsp")
			.antMatchers("/403.jsp")
			.antMatchers("/404.jsp")
			.antMatchers("/500.jsp")
			.antMatchers("/503.jsp")
			;
	}
	
	public static void main(String[] args){
		int i = 0;
		while (i < 10) {
			String password = "admin";
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
	 
			System.out.println(hashedPassword);
			i++;
		}

	}
	
	
}
