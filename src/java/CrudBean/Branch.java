
package CrudBean;

public class Branch {
    
    private int branch_id;
    private String branch_name;
    private int mgr_id;
    private String mgr_start_date;

    public int getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(int branch_id) {
        this.branch_id = branch_id;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public int getMgr_id() {
        return mgr_id;
    }

    public void setMgr_id(int mgr_id) {
        this.mgr_id = mgr_id;
    }

    public String getMgr_start_date() {
        return mgr_start_date;
    }

    public void setMgr_start_date(String mgr_start_date) {
        this.mgr_start_date = mgr_start_date;
    }
    
    
}
