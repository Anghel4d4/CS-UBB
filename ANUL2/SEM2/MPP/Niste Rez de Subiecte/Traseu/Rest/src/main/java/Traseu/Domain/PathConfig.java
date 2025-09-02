package Traseu.Domain;

import jakarta.persistence.*;

@Entity
@Table(name="path_config")
public class PathConfig extends BaseEntity{

    @Column(name = "safe_path", nullable = false)
    private String savePath;

    @Column(name = "obstacles", nullable = false)
    private String obstacles;

    @Column(name= "created_at", nullable = false)
    private String createdAt;


    public String getSavePath(){
        return savePath;
    }

    public void setSavePath(String savePath){
        this.savePath = savePath;
    }

    public String getObstacles(){
        return obstacles;
    }

    public void setObstacles(String obstacles){
        this.obstacles = obstacles;
    }

    public String getCreatedAt(){
        return createdAt;
    }

    public void setCreatedAt(String createdAt){
        this.createdAt = createdAt;
    }


}
