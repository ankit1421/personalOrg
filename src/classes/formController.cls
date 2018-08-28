public class formController {

  public class MyObject {
    private String hiddenField = 'Lorem ipsum dolor';
    private String textdata = null;

    public String getTextData() { return textdata; }
    public void setTextData(String data) { textdata = data; }

    public String getWebsite() {
      if (textdata != null) {
        return '<ul><li>' + hiddenField + '</li><li> ' + textdata + '</li></ul>';
      } else { return ''; }
    }

    public String getHiddenField() { return hiddenField; }
    public void setHiddenField(String data) { hiddenField = data; }
  }

  private myObject my_object;

  public MyObject getMyObject() {
    if (my_object == null) { my_object = new MyObject(); }
    return my_object;
    }
}