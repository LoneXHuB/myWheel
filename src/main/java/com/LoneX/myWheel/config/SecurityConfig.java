package com.LoneX.myWheel.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.JdbcUserDetailsManager;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	@Bean
	public JdbcUserDetailsManager jdbcUserDetailsManager() throws Exception {
		JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();
		jdbcUserDetailsManager.setDataSource(dataSource);
		return jdbcUserDetailsManager;
	}
	
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/images/**");
        web.ignoring().antMatchers("/source/**");
        web.ignoring().antMatchers("/js/**");
        web.ignoring().antMatchers("/css/**");
        web.ignoring().antMatchers("/assets/**");
        web.ignoring().antMatchers("/assets/plugins/**");

}

    @Override
    protected void configure(HttpSecurity http) throws Exception {
       	http.authorizeRequests().antMatchers("/" , "/forgot-password","/shop/**","/register" ,"/team" ,"/BO*" , "/login**" , "/activateAccount/**").permitAll()
       	.antMatchers("/single/**","/checkout").hasAnyRole("CLIENT")
       	.antMatchers("/BO/**").hasAnyRole("ADMIN","AGENT").anyRequest().authenticated().and().formLogin()
		.failureHandler(new CustomAuthenticationFailureHandler())
		.loginPage("/login").permitAll().and().exceptionHandling().accessDeniedPage("/login?error=Accès refusé")
		.and().logout().permitAll();
       
       	http.csrf().disable();
       }
        
       
  

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
        authenticationMgr.jdbcAuthentication().dataSource(dataSource);

        		 
    }


}