package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ClientQueryObject;

import java.util.List;

public interface IClientSerivce {
    void deleteByPrimaryKey(Long id);

    void insert(Client record);

    Client selectByPrimaryKey(Long id);

    List<Client> selectAll();

    void updateByPrimaryKey(Client record);

    PageResult query(ClientQueryObject queryObject);

    //移动到资源池
    void move(Long id);

    void defeat(Client client);

    void off(Long id);

    //吸纳
    void absorb(Client client);

    void official(Long id);
}
