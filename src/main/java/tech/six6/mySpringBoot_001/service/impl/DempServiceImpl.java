package tech.six6.mySpringBoot_001.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tech.six6.mySpringBoot_001.entity.Demp;
import tech.six6.mySpringBoot_001.mapper.DempMapper;
import tech.six6.mySpringBoot_001.service.DempService;

import java.util.List;

@Service
public class DempServiceImpl implements DempService {

    @Autowired
    private DempMapper dempMapper;

    @Override
    public List<Demp> searchAll() {
        return dempMapper.searchAll();
    }

    @Override
    public int delete(int id) {
        return dempMapper.delete(id);
    }

    @Override
    public int update(Demp obj) {
        return dempMapper.update(obj);
    }

    @Override
    public void add(Demp demp) {
        demp.setName("new node");
        dempMapper.add(demp);
        System.out.println("demp.getId() 服务处："+demp.getId());
    }

}
