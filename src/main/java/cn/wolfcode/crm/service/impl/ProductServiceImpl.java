package cn.wolfcode.crm.service.impl;

import cn.wolfcode.crm.domain.Product;
import cn.wolfcode.crm.mapper.ProductMapper;
import cn.wolfcode.crm.page.PageResult;
import cn.wolfcode.crm.query.ProductQueryObject;
import cn.wolfcode.crm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    ProductMapper productMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Product record) {
        int insert = productMapper.insert(record);
        return insert;
    }

    @Override
    public Product selectByPrimaryKey(Long id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Product> selectAll() {
        return productMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Product record) {
        return productMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult query(ProductQueryObject queryObject) {
        int count = productMapper.queryCount(queryObject);
        if (count > 0) {
            return new PageResult(count, productMapper.queryList(queryObject));
        }
        return new PageResult(count, Collections.emptyList());
    }

    @Override
    public void changeState(Long id) {
        productMapper.changeState(id);
    }

}
