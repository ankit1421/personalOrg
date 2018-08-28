public Class Utilities {

   public static String currency(String i) {
    String s = ( Decimal.valueOf(i==null||i.trim()==''?'0':i).setScale(2) + 0.001 ).format();
    return s.substring(0,s.length()-1);
   }
   
   public static String formatCurrency(Decimal i) {
    if (i == null || Math.abs(i) < 0.005) return '$0.00';
    String s = (i.setScale(2) + (i >= 0 ? 0.001 : -0.001)).format();
    return s.substring(0, s.length() - 1);
   }

}