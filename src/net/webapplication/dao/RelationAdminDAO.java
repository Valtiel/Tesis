package net.webapplication.dao;

import javax.sql.DataSource;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationMedicInstitution;

public interface RelationAdminDAO {
    
    public void setDataSource(DataSource dataSource);
    
    public void addRelationClient(RelationClientInstitution clientInstitution);

    public void addRelationMedic(RelationMedicInstitution medicInstitution);

    public void deleteRelationClient(RelationClientInstitution clientInstitution);

    public void deleteRelationMedic(RelationMedicInstitution medicInstitution);

    public void updateRelationClient(RelationClientInstitution clientInstitution);

    public void updateRelationMedic(RelationMedicInstitution medicInstitution);
    
}
