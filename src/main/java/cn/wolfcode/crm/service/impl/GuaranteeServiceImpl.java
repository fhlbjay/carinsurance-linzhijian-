package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Guarantee;
import cn.wolfcode.crm.mapper.GuaranteeMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.QueryObject;
import cn.wolfcode.crm.service.IGuaranteeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
public class GuaranteeServiceImpl implements IGuaranteeService{
    @Autowired
    private GuaranteeMapper guaranteeMapper;

    @Override
    public PageResult query(QueryObject queryObject) {
        int count = guaranteeMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, guaranteeMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeStatus(Long id) {
        guaranteeMapper.changeStatus(id);
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        int count = guaranteeMapper.deleteByPrimaryKey(id);
        return count;
    }

    @Override
    public int insert(Guarantee record) {
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!-----------------------------------------444444444444444");
        record.setSn(uuid.toString());
        int insert = guaranteeMapper.insert(record);

        return insert;
    }


    @Override
    public Guarantee selectByPrimaryKey(Long id) {
        Guarantee guarantee = guaranteeMapper.selectByPrimaryKey(id);
        return guarantee;
    }

    @Override
    public List<Guarantee> selectAll() {

        return guaranteeMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Guarantee record) {
        int count = guaranteeMapper.updateByPrimaryKey(record);
        return count;
    }


}
