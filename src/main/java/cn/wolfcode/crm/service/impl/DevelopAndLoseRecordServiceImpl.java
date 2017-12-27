package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.DevelopAndLoseRecord;
import cn.wolfcode.crm.mapper.DevelopAndLoseRecordMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IDevelopAndLoseRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DevelopAndLoseRecordServiceImpl implements IDevelopAndLoseRecordService {

    @Autowired
    DevelopAndLoseRecordMapper developAndLoseRecordMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return developAndLoseRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(DevelopAndLoseRecord record) {
        //获取当前用户的id
        developAndLoseRecordMapper.insert(record);
    }

    @Override
    public DevelopAndLoseRecord selectByPrimaryKey(Long id) {
        return developAndLoseRecordMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<DevelopAndLoseRecord> selectAll() {
        return developAndLoseRecordMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(DevelopAndLoseRecord record) {
        return developAndLoseRecordMapper.updateByPrimaryKey(record);
    }


    @Override
    public PageResult queryOff(ClientQueryObject queryObject) {
        int count = developAndLoseRecordMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, developAndLoseRecordMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public PageResult query(ClientQueryObject queryObject) {
        int count = developAndLoseRecordMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, developAndLoseRecordMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }


}
