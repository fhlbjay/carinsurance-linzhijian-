package cn.wolfcode.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
abstract class BaseDomain implements Serializable {

    private static final long serialVersionUID = -5303726599688100174L;

    private Long id;
}
