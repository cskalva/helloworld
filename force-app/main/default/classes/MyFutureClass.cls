global class MyFutureClass {

  @future 
  global static void myMethod(String a) {
    System.debug('Method called with: ' + a);
    // Perform long-running code
  }
}