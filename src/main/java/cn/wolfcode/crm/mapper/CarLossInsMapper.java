package cn.wolfcode.crm.mapper;

import cn.wolfcode.crm.domain.CarLossIns;
import java.util.List;

public interface CarLossInsMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CarLossIns record);

    CarLossIns selectByPrimaryKey(Long id);

    int updateByPrimaryKey(CarLossIns record);
}