/**
 * Model class for mapping the response of REST call.
 *
 * @author Avinash Tingre
 */
package com.avinash.HotfixLogUI.Model;

import java.util.List;

public class ECPLogResponseObject {
    private int count;
    private List<ECPLog> details;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<ECPLog> getDetails() {
        return details;
    }

    public void setDetails(List<ECPLog> details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "ResponseObject [count=" + count + ", Records=" + details + "]";
    }


}
