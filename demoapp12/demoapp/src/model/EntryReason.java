package model;

public class EntryReason {
	private int entry_reason_id;
	private String entry_reason;
	
	
	public EntryReason(int entry_reason_id, String entry_reason) {
		super();
		this.entry_reason_id = entry_reason_id;
		this.entry_reason = entry_reason;
	}
	public int getEntry_reason_id() {
		return entry_reason_id;
	}
	public void setEntry_reason_id(int entry_reason_id) {
		this.entry_reason_id = entry_reason_id;
	}
	public String getEntry_reason() {
		return entry_reason;
	}
	public void setEntry_reason(String entry_reason) {
		this.entry_reason = entry_reason;
	}
	
	

}
