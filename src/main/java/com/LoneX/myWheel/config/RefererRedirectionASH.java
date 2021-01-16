package com.LoneX.myWheel.config;

import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

public class RefererRedirectionASH   extends SimpleUrlAuthenticationSuccessHandler
  implements AuthenticationSuccessHandler {
 
    public RefererRedirectionASH (){
    	super();
    	setUseReferer(true);
    }
}
