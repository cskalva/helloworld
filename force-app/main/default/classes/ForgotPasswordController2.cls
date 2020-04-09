/**
 * An apex page controller that exposes the site forgot password functionality
 */
public with sharing class ForgotPasswordController2 {
    public String username {get; set;}   
       
    public ForgotPasswordController2() {}
    
    public PageReference forgotPassword() {
        boolean success = Site.forgotPassword(username);
        PageReference pr = Page.ForgotPasswordConfirm2;
        pr.setRedirect(true);
        
        if (success) {              
            return pr;
        }
        return null;
    }
}