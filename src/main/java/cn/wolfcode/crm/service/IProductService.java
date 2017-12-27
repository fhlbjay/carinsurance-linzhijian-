package cn.wolfcode.crm.service;

import cn.wolfcode.crm.domain.Product;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ProductQueryObject;

import java.util.List;

public interface IProductService {
    
    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    Product selectByPrimaryKey(Long id);

    List<Product> selectAll();

    int updateByPrimaryKey(Product record);

    PageResult query(ProductQueryObject queryObject);

    void changeState(Long id);

}
