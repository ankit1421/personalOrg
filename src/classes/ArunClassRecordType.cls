public class ArunClassRecordType {

    public PageReference DisplayRecordType() {
        return null;
    }


  public string selectedValue {get;set;}
  
   public List<SelectOption> getAvailableValues ()
         {  
             
             List<SelectOption> AvailableValues = new list<SelectOption>();
             
             AvailableValues.add(new SelectOption('-- NONE --','-- NONE --'));
             AvailableValues.add(new SelectOption('Account','Account'));
             AvailableValues.add(new SelectOption('Contact','Contact'));
             AvailableValues.add(new SelectOption('Lead','Lead'));
             
             return AvailableValues;
         } 


}