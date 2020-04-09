global with sharing class CustomLoginController2 {
    global String username {get; set;}
    global String password {get; set;}
    global CustomLoginController2 () {}
    global PageReference login() {
        return Site.login(username, password, null); 
    } 
}