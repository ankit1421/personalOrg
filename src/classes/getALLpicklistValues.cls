public class getALLpicklistValues {

    public String ls { get; set; }
   
   List<selectOption> lsx {get;set;}
   User Us = new User();
   
   public List<selectOption> getfunc () {
        Lsx  = new List<SelectOption> ();
        Lsx = util.getPicklistValues(Us,'LanguageLocaleKey'); 
        
        return lsx;
  }

}