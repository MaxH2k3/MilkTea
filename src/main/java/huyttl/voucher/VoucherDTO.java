/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.voucher;

/**
 *
 * @author DELL
 */
public class VoucherDTO {
    private String idVoucher;
    private String dateCreate;
    private String dateEnd;
    private int amount;
    private int discount;

    public VoucherDTO(String idVoucher, String dateCreate, String dateEnd, int amount) {
        this.idVoucher = idVoucher;
        this.dateCreate = dateCreate;
        this.dateEnd = dateEnd;
        this.amount = amount;
    }

    /**
     * @return the idVoucher
     */
    public String getIdVoucher() {
        return idVoucher;
    }

    /**
     * @param idVoucher the idVoucher to set
     */
    public void setIdVoucher(String idVoucher) {
        this.idVoucher = idVoucher;
    }

    /**
     * @return the dateCreate
     */
    public String getDateCreate() {
        return dateCreate;
    }

    /**
     * @param dateCreate the dateCreate to set
     */
    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    /**
     * @return the dateEnd
     */
    public String getDateEnd() {
        return dateEnd;
    }

    /**
     * @param dateEnd the dateEnd to set
     */
    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
    
    
}
