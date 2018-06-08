package net.webapplication.dao;

import javax.sql.DataSource;
import net.webapplication.model.RelationClientInstitution;
import net.webapplication.model.RelationClientMedic;
import net.webapplication.model.RelationClientProblem;

public interface RelationClientDAO {
    
    public void setDataSource(DataSource dataSource);
    
    public void addRelationInstitution(RelationClientInstitution clientInstitution);

    public void addRelationMedic(RelationClientMedic clientMedic);

    public void addRelationProblem(RelationClientProblem clientProblem);

    public void deleteRelationInstitution(RelationClientInstitution clientInstitution);

    public void deleteRelationMedic(RelationClientMedic clientMedic);

    public void deleteRelationProblem(RelationClientProblem clientProblem);

    public void updateRelationInstitution(RelationClientInstitution clientInstitution);

    public void updateRelationMedic(RelationClientMedic clientMedic);

    public void updateRelationProblem(RelationClientProblem clientProblem);
}
