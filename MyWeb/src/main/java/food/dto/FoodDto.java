package food.dto;

public class FoodDto {
	private int num;
	private String writer;
	private String title; //글 제목
	private String content; //글 내용
	private String regdate;
	private String image;
	private String divfood;
	private int viewCount; //조회수
	private int likeCount;
	private int dislikeCount;
	//페이징 처리할 때 필요한 필드
	private int startRowNum;
	private int endRowNum;
	
	public FoodDto() {}
	
	public FoodDto(int num, String writer, String title, String content, String regdate, String image, String divfood,
			int viewCount, int likeCount, int dislikeCount, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.image = image;
		this.divfood = divfood;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.dislikeCount = dislikeCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDivfood() {
		return divfood;
	}

	public void setDivfood(String divfood) {
		this.divfood = divfood;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDislikeCount() {
		return dislikeCount;
	}

	public void setDislikeCount(int dislikeCount) {
		this.dislikeCount = dislikeCount;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}
