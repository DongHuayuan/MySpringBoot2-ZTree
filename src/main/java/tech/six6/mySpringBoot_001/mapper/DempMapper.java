package tech.six6.mySpringBoot_001.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import tech.six6.mySpringBoot_001.entity.Demp;

import java.util.List;

@Mapper
public interface DempMapper {

    @Select("select * from demp")
    List<Demp> searchAll();

    @Delete("delete from demp where id = #{id}")
    int delete(int id);


    int update(Demp obj);

    void add(Demp demp);
}
