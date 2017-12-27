package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Client;
import cn.wolfcode.crm.query.ClientQueryObject;

import java.util.List;

public interface ClientMapper {

    void deleteByPrimaryKey(Long id);

    void insert(Client record);

    Client selectByPrimaryKey(Long id);

    List<Client> selectAll();

    void updateByPrimaryKey(Client record);

    int queryCount(ClientQueryObject queryObject);

    List<Client> queryList(ClientQueryObject queryObject);

    void move(Long id);

    void defeat(Client client);

    void off(Long id);

    void absorb(Client client);

    void official(Long id);
}