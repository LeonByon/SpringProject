package first.common.dto;
// idx, m.name, product_name, price, amount, price*amount as money

public class CartDTO {
	private int idx;
	private int product_id;
	private String userid;
	private int amount;
	private String name;
	private String product_name;
	private int price;
	private int money;
	
	//기본생성자
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	//입력생성자(insert 용)

	public CartDTO(int product_id, String userid, int amount) {
		super();
		this.product_id = product_id;
		this.userid = userid;
		this.amount = amount;
	}
	//getter, setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	//toString()
	@Override
	public String toString() {
		return "CartDTO [idx=" + idx + ", product_id=" + product_id + ", userid=" + userid + ", amount=" + amount
				+ ", name=" + name + ", product_name=" + product_name + ", price=" + price + ", money=" + money + "]";
	}
	
	


}
