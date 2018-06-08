package net.webapplication.model;

import java.io.Serializable;
import java.util.List;

public class TableJsonResponse<T> implements Serializable {

    private static final long serialVersionUID = -8220588043068200705L;
    private List<T> aaData;

    public List<T> getAaData() {
        return aaData;
    }

    public void setAaData(List<T> aaData) {
        this.aaData = aaData;
    }
}
