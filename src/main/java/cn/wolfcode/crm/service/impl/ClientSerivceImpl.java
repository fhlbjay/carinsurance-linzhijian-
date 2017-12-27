package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.mapper.ClientMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;
import cn.wolfcode.crm.service.IClientSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ClientSerivceImpl implements IClientSerivce {

    @Autowired
    private ClientMapper clientMapper;

    @Override
    public void deleteByPrimaryKey(Long id) {
        clientMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void insert(Client record) {
        clientMapper.insert(record);
    }

    @Override
    public Client selectByPrimaryKey(Long id) {
        return clientMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Client> selectAll() {
        return clientMapper.selectAll();
    }

    @Override
    public void updateByPrimaryKey(Client record) {
        clientMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(ClientQueryObject queryObject) {
        int count = clientMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, clientMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void move(Long id) {
        clientMapper.move(id);
    }

    @Override
    public void defeat(Client client) {
        clientMapper.defeat(client);
    }

    @Override
    public void off(Long id) {
        clientMapper.off(id);
    }

    @Override
    public void absorb(Client client) {
        clientMapper.absorb(client);
    }

    @Override
    public void official(Long id) {
        clientMapper.official(id);
    }
}
