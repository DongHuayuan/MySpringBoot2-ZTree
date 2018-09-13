package tech.six6.mySpringBoot_001.entity;

public class Demp {

    private int id;
    private String name;
    private int parentId;
    private String notes;

    public Demp() {
    }

    public Demp(int id, String name, int parentId, String notes) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.notes = notes;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Demp{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", notes='" + notes + '\'' +
                '}';
    }
}
