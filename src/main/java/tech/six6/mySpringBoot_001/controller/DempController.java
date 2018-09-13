package tech.six6.mySpringBoot_001.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.six6.mySpringBoot_001.entity.Demp;
import tech.six6.mySpringBoot_001.service.DempService;

import java.util.List;

@RestController
@RequestMapping("/demp")
@Slf4j
public class DempController {

    @Autowired
    private DempService dempService;

    @RequestMapping("/list")
    public List<Demp> list(){
        List<Demp> dempList = dempService.searchAll();
        return dempList;
    }
    @RequestMapping("/delete")
    public String delete(int id){
        System.out.println("delete中的id="+id);
        if (dempService.delete(id) >0){
            log.info("删除成功");
            return "\"ok\"";
        }else {
            log.info("删除失败");
            return "\"error\"";
        }
    }

    @RequestMapping("/updateName")
    public String updateName(int id,String name){
        System.out.println("修改名字的 id，name:"+id +","+name);
        Demp demp = new Demp();
        demp.setId(id);
        demp.setName(name);
        System.out.println(demp);
        if ( dempService.update(demp)>0 ){
            log.info("修改名称成功");
            return "\"ok\"";
        }else{
            log.info("修改名称失败");
            return "\"error\"";
        }
    }

    @RequestMapping("/add")
    public Demp add(int pId){
        System.out.println("add   pId="+pId);
        Demp demp = new Demp();
        demp.setParentId(pId);
        dempService.add(demp);
        System.out.println("controller demp:"+demp);
        log.info("添加节点成功");
        return  demp;

    }

    @RequestMapping("/move")
    public String move(int id,String moveType,int parentId){

        System.out.println("move的参数获取: "+id+","+moveType+","+parentId);
        if ("prev".equals(moveType)){       //移动到该节点前面
            log.info("移动到该节点前面");
            return "\"prev\"";
        }else if ("next".equals(moveType)){  //移动到该节点前面
            log.info("移动到该节点前面");
            return "\"next\"";
        }else if ("inner".equals(moveType)){  //移动到该节点里面作为子节点
            Demp demp = new Demp();
            demp.setId(id);
            demp.setParentId(parentId);
            if (dempService.update(demp) > 0 ){
                log.info("移动到里面作为子节点成功！");
                return "\"ok\"";
            }
            log.info("移动到里面作为子节点失败！");
            return "\"inner\"";
        }
        return "\"error\"";
    }

}
