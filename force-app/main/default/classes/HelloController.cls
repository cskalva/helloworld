public class HelloController {
    public Map<String, String> params{get;set;}
    public HelloController (){
        
        params = ApexPages.currentPage().getParameters();
    }
    
}