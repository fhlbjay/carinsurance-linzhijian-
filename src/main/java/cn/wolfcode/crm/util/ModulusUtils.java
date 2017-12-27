package cn.wolfcode.crm.util;

import cn.wolfcode.crm.domain.Car;
import cn.wolfcode.crm.domain.CarLossIns;
import cn.wolfcode.crm.domain.TaxAndIns;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Properties;

public class ModulusUtils {

    private static Properties properties = new Properties();

    //车船税金额值(车辆大小)
    private static BigDecimal tax_small;
    private static BigDecimal tax_middle;
    private static BigDecimal tax_large;
    private static BigDecimal tax_huge;

    //交强险基础保费
    private static BigDecimal ins_small;
    private static BigDecimal ins_middle;
    private static BigDecimal ins_large;
    private static BigDecimal ins_huge;

    //车损险基础保费
    private static BigDecimal car_loss_ins_small;
    private static BigDecimal car_loss_ins_middle;
    private static BigDecimal car_loss_ins_large;
    private static BigDecimal car_loss_ins_huge;

    //车损险附加保费费率
    private static BigDecimal car_loss_rate_small;
    private static BigDecimal car_loss_rate_middle;
    private static BigDecimal car_loss_rate_large;
    private static BigDecimal car_loss_rate_huge;

    //交强险浮动系数
    private static BigDecimal one_year_good;
    private static BigDecimal two_year_good;
    private static BigDecimal three_year_good;
    private static BigDecimal two_accident;
    private static BigDecimal three_accident;

    static {
        InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("modulus.properties");
        try {
            properties.load(inputStream);
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        tax_small = new BigDecimal(properties.getProperty("tax_small"));
        tax_middle = new BigDecimal(properties.getProperty("tax_middle"));
        tax_large = new BigDecimal(properties.getProperty("tax_large"));
        tax_huge = new BigDecimal(properties.getProperty("tax_huge"));

        ins_small = new BigDecimal(properties.getProperty("ins_small"));
        ins_middle = new BigDecimal(properties.getProperty("ins_middle"));
        ins_large = new BigDecimal(properties.getProperty("ins_large"));
        ins_huge = new BigDecimal(properties.getProperty("ins_huge"));

        car_loss_ins_small = new BigDecimal(properties.getProperty("car_loss_ins_small"));
        car_loss_ins_middle = new BigDecimal(properties.getProperty("car_loss_ins_middle"));
        car_loss_ins_large = new BigDecimal(properties.getProperty("car_loss_ins_large"));
        car_loss_ins_huge = new BigDecimal(properties.getProperty("car_loss_ins_huge"));

        car_loss_rate_small = new BigDecimal(properties.getProperty("car_loss_rate_small"));
        car_loss_rate_middle = new BigDecimal(properties.getProperty("car_loss_rate_middle"));
        car_loss_rate_large = new BigDecimal(properties.getProperty("car_loss_rate_large"));
        car_loss_rate_huge = new BigDecimal(properties.getProperty("car_loss_rate_huge"));

        one_year_good = new BigDecimal(properties.getProperty("one_year_good"));
        two_year_good = new BigDecimal(properties.getProperty("two_year_good"));
        three_year_good = new BigDecimal(properties.getProperty("three_year_good"));
        two_accident = new BigDecimal(properties.getProperty("two_accident"));
        three_accident = new BigDecimal(properties.getProperty("three_accident"));
    }

    private ModulusUtils() {
    }

    //交强险系数
    private static BigDecimal getInsModulus(TaxAndIns taxAndIns) {
        final BigDecimal modulus = new BigDecimal("1");
        int safeYears = taxAndIns.getSafeYears();
        if (safeYears > 0) {
            if (safeYears == 1)
                return modulus.add(one_year_good);
            else if (safeYears == 2)
                return modulus.add(two_year_good);
            else
                return modulus.add(three_year_good);
        } else {
            int number = taxAndIns.getTrafficNumber() + taxAndIns.getDrunkNumber();
            if (number == 2)
                return modulus.add(two_accident);
            else if (number > 2)
                return modulus.add(three_accident);
            else
                return modulus;
        }
    }

    //交强险
    private static BigDecimal getIns(TaxAndIns taxAndIns, BigDecimal insModulus) {
        Byte size;
        if (taxAndIns.getBill() != null) {
            size = taxAndIns.getBill().getCar().getSize();
        } else {
            size = taxAndIns.getCarSize();
        }
        if (Car.SIZE_SMALL.equals(size))
            return ins_small.multiply(insModulus);
        else if (Car.SIZE_MIDDLE.equals(size))
            return ins_middle.multiply(insModulus);
        else if (Car.SIZE_LARGE.equals(size))
            return ins_large.multiply(insModulus);
        else
            return ins_huge.multiply(insModulus);
    }

    //车船税
    private static BigDecimal getTax(TaxAndIns taxAndIns) {
        Byte size;
        if (taxAndIns.getBill() != null) {
            size = taxAndIns.getBill().getCar().getSize();
        } else {
            size = taxAndIns.getCarSize();
        }
        if (Car.SIZE_SMALL.equals(size))
            return tax_small;
        else if (Car.SIZE_MIDDLE.equals(size))
            return tax_middle;
        else if (Car.SIZE_LARGE.equals(size))
            return tax_large;
        else
            return tax_huge;
    }

    //车损险
    private static BigDecimal getCarLossIns(CarLossIns carLossIns) {
        Byte size;
        BigDecimal valuation;
        if (carLossIns.getBill() != null) {
            size = carLossIns.getBill().getCar().getSize();
            valuation = carLossIns.getBill().getCar().getValuation();
        } else {
            size = carLossIns.getCarSize();
            valuation = carLossIns.getValuation();
        }
        if (Car.SIZE_SMALL.equals(size))
            return valuation.multiply(car_loss_rate_small).add(car_loss_ins_small);
        else if (Car.SIZE_MIDDLE.equals(size))
            return valuation.multiply(car_loss_rate_middle).add(car_loss_ins_middle);
        else if (Car.SIZE_LARGE.equals(size))
            return valuation.multiply(car_loss_rate_large).add(car_loss_ins_large);
        else
            return valuation.multiply(car_loss_rate_huge).add(car_loss_ins_huge);
    }

    /**
     * @param taxAndIns 要求包含交通,酒驾事故次数，连续未出事故年数;还需要传入当前保单对象或者车辆大小
     * @return 计算完成的交强险车船税对象
     */
    public static TaxAndIns checkTaxAndIns(TaxAndIns taxAndIns) {
        taxAndIns.setInsModulus(getInsModulus(taxAndIns));
        taxAndIns.setIns(getIns(taxAndIns, taxAndIns.getInsModulus()));
        taxAndIns.setTax(getTax(taxAndIns));
        return taxAndIns;
    }

    public static CarLossIns checkCarLossIns(CarLossIns carLossIns) {
        carLossIns.setIns(getCarLossIns(carLossIns));
        return carLossIns;
    }
}
