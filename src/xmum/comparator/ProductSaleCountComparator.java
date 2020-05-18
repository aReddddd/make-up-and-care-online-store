package xmum.comparator;

import java.util.Comparator;

import xmum.bean.Product;

public class ProductSaleCountComparator implements Comparator<Product>{

	public int compare(Product p1, Product p2) {
		return p2.getSaleCount()-p1.getSaleCount();
	}

}
