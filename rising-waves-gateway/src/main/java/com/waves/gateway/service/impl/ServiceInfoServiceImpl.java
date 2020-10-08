package com.waves.gateway.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.PageList;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.waves.gateway.controller.param.GrpcServiceParam;
import com.waves.gateway.controller.param.HttpServiceParam;
import com.waves.gateway.controller.param.TcpServiceParam;
import com.waves.gateway.controller.res.ServiceInfoRes;
import com.waves.gateway.domain.ServiceDetail;
import com.waves.gateway.entity.*;
import com.waves.gateway.mapper.*;
import com.waves.gateway.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 网关基本信息表 服务实现类
 * </p>
 *
 * @author 不吃香菜9527
 * @since 2020-10-06
 */
@Service
public class ServiceInfoServiceImpl extends ServiceImpl<ServiceInfoMapper, ServiceInfo> implements ServiceInfoService {
    private final static int  LOAD_TYPE_HTTP =  0;
    private final static int  LOAD_TYPE_TCP  = 1;
    private final static int  LOAD_TYPE_GRPC  = 2;
    private final static int  HTTP_RULE_TYPE_PREFIX_URL =  0;
    private final static int  HTTP_RULE_TYPE_DOMAIN  = 1;

    @Value("${risingwaves.cluster.host:127.0.0.1}")
    private String host;

    @Value("${risingwaves.cluster.port:8080}")
    private int port;
    @Value("${risingwaves.cluster.sslPort:8443}")
    private int sslPort;


    @Autowired
    private ServiceInfoMapper serviceInfoMapper;

    @Autowired
    private ServiceLoadBalanceMapper serviceLoadBalanceMapper;
    @Autowired
    private ServiceAccessControlMapper serviceAccessControlMapper;
    @Autowired
    private ServiceHttpRuleMapper serviceHttpRuleMapper;

    @Autowired
    private ServiceTcpRuleMapper serviceTcpRuleMapper;
    @Autowired
    private ServiceGrpcRuleMapper serviceGrpcRuleMapper;

    @Override
    public IPage<ServiceInfoRes> pageServiceList(Page<?> page, String keyword) {


        // 分页读取服务信息
        IPage<ServiceDetail> serviceDetailIPage = serviceInfoMapper.selectServiceList(page, keyword);
        List<ServiceDetail> records = serviceDetailIPage.getRecords();
        // 处理、构造 返回信息
        List<ServiceInfoRes> serviceInfoResList = records.stream().map(record -> {

            ServiceInfoRes serviceInfoRes = BeanUtil.toBean(record, ServiceInfoRes.class);

            String serviceAddr = "unknown";
            if (record.getLoadType() == LOAD_TYPE_HTTP
                    && record.getServiceHttpRule() != null
                    && record.getServiceHttpRule().getRuleType() == HTTP_RULE_TYPE_PREFIX_URL
                    && record.getServiceHttpRule().getNeedHttps() == 1) {
                serviceAddr = host + ":" + sslPort + record.getServiceHttpRule().getRule();
            }
            if (record.getLoadType() == LOAD_TYPE_HTTP
                    && record.getServiceHttpRule() != null
                    && record.getServiceHttpRule().getRuleType() == HTTP_RULE_TYPE_PREFIX_URL
                    && record.getServiceHttpRule().getNeedHttps() == 0) {
                serviceAddr = host + ":" + port + record.getServiceHttpRule().getRule();
            }

            if (record.getLoadType() == LOAD_TYPE_HTTP
                    && record.getServiceHttpRule() != null
                    && record.getServiceHttpRule().getRuleType() == HTTP_RULE_TYPE_DOMAIN
                    && record.getServiceHttpRule().getNeedHttps() == 0) {
                serviceAddr = record.getServiceHttpRule().getRule();
            }

            if (record.getLoadType() == LOAD_TYPE_TCP) {
                if (record.getServiceTcpRule() !=null && record.getServiceTcpRule().getPort()!= null){
                    serviceAddr = host + ":" + record.getServiceTcpRule().getPort();
                }

            }

            if (record.getLoadType() == LOAD_TYPE_GRPC) {
                if (record.getServiceGrpcRule() !=null && record.getServiceGrpcRule().getPort()!= null){
                    serviceAddr = host + ":" + record.getServiceGrpcRule().getPort();
                }
            }
            serviceInfoRes.setServiceAddr(serviceAddr);
            int totalNode = 0;
            ServiceLoadBalance serviceLoadBalance = record.getServiceLoadBalance();
            if (serviceLoadBalance!=null&& serviceLoadBalance.getIpList()!=null){
                 totalNode = StringUtils.split(serviceLoadBalance.getIpList(), ",").length;
            }
            serviceInfoRes.setTotalNode(totalNode);
            serviceInfoRes.setDps(0);
            serviceInfoRes.setQps(0);
            return serviceInfoRes;
        }).collect(Collectors.toList());
        // 构建分页信息
        Page<ServiceInfoRes> serviceInfoResPage = new Page<>(page.getCurrent(), page.getSize(), page.getTotal(), page.isSearchCount());
        serviceInfoResPage.setRecords(serviceInfoResList);
        return serviceInfoResPage;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveHttp(HttpServiceParam entity) {

        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveGrpc(GrpcServiceParam entity) {
        return false;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveTcp(TcpServiceParam entity) {
        return false;
    }

}
