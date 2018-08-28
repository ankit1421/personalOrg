public class PracticeController {
    @AuraEnabled 
    public static Map<string,boolean> ColorObject(){
        Map<string,boolean> colorFavMap = new Map<string,boolean>();
        colorFavMap.put('White', true);
        colorFavMap.put('Red', false);
        colorFavMap.put('Blue', true);
        colorFavMap.put('Yellow', false);
        colorFavMap.put('Green', true);
        return colorFavMap;
    }
}