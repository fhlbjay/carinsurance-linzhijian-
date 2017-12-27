package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Claimsheet;
import cn.wolfcode.crm.mapper.ClaimsheetMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IClaimsheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
public class ClaimsheetServiceImpl implements IClaimsheetService{
    @Autowired
    private ClaimsheetMapper claimsheetMapper;

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = claimsheetMapper.queryCount(queryObject);
        if (count > 0) {
            List<Claimsheet> claimsheets = claimsheetMapper.queryList(queryObject);
            PageResult result = new PageResult(count, claimsheets);
            return result;
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeStatus(Long id) {

        claimsheetMapper.changeStatus(id);
    }

    @Override
    public void changeStatus1(Long id) {
        claimsheetMapper.changeStatus1(id);

    }
    @Override
    public void changeStatus2(Long id) {
        claimsheetMapper.changeStatus2(id);

    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        int count = claimsheetMapper.deleteByPrimaryKey(id);
        return count;
    }

    @Override
    public int insert(Claimsheet record) {
       UUID uuid = UUID.randomUUID();
       // System.out.println(uuid);
        record.setSn(uuid.toString());
        int insert = claimsheetMapper.insert(record);

        return insert;
    }


    @Override
    public Claimsheet selectByPrimaryKey(Long id) {
        Claimsheet claimsheet = claimsheetMapper.selectByPrimaryKey(id);
        return claimsheet;
    }

    @Override
    public List<Claimsheet> selectAll() {

        return claimsheetMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Claimsheet record) {
        int count = claimsheetMapper.updateByPrimaryKey(record);
        return count;
    }


}
