package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.Bill;
import cn.wolfcode.crm.domain.Product;
import cn.wolfcode.crm.query.ProductQueryObject;

import java.util.List;

public interface ProductMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Product record);

    Product selectByPrimaryKey(Long id);

    List<Product> selectAll();

    int updateByPrimaryKey(Product record);

    int queryCount(ProductQueryObject queryObject);

    List<Product> queryList(ProductQueryObject queryObject);

    void changeState(Long id);

    //修改商品的年费
    void updateYearsAmount(Bill bill);

}