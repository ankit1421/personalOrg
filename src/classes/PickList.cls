public with sharing class PickList {
    
    public List<SelectOption> options {get; set;}
    public SelectOption selectedOpt {get; set;}
    public List<SelectOption> selectedOptions {get; set;}
    
    public PickList() {
        options = new List<SelectOption>();     
        options.add(new SelectOption('A', 'A'));
        options.add(new SelectOption('B', 'B'));
        options.add(new SelectOption('C', 'C'));
        options.add(new SelectOption('D', 'D'));            
    }
    

    
}