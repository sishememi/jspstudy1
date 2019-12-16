package chap7;
//Bean 클래스
public class Book {
	private String writer;
	private String title;
	private String content;
	public String getWr() { //멤버의 이름이 property가아니고 get뒤 이름이 property
		return writer;
	}
	public void setWr(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
