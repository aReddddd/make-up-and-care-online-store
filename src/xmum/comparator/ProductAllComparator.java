package xmum.comparator;

import java.util.Comparator;
import xmum.bean.Product;

public class ProductAllComparator implements Comparator<Product>{
	//Set the default item ordering to go from review times highest to lowest volume
	public int compare(Product p1, Product p2) {
		return p2.getReviewCount()*p2.getSaleCount()-p1.getReviewCount()*p2.getSaleCount();
	}

}
