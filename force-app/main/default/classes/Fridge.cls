//Update 1

public class Fridge {
  
  public String modelNumber {
    get;
    set;
  }
  public Integer numberInStock {
    get;
    set;
  }
  
   public Integer shippingPrice {
    get;
    set;
  }

  public Fridge(String theModelNumber, Integer theNumberInStock) {
    modelNumber = theModelNumber;
    numberInStock = theNumberInStock;
  }

  public void updateStock(Integer justSold, Integer price) {
    numberInStock = numberInStock - justSold;
  }
  
  public void addStock2(Integer stock) {
    numberInStock = stock;
  }
}