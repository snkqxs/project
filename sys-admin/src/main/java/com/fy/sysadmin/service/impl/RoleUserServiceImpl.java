package com.fy.sysadmin.service.impl;

import com.fy.sysadmin.base.result.Results;
import com.fy.sysadmin.dao.RoleUserDao;
import com.fy.sysadmin.model.SysRoleUser;
import com.fy.sysadmin.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleUserServiceImpl implements RoleUserService {
    @Autowired
    private RoleUserDao roleUserDao;

    @Override
    public Results getSysRoleUserByUserId(Integer userId) {
        SysRoleUser sysRoleUser = roleUserDao.getSysRoleUserByUserId(userId);
        if(sysRoleUser != null){
            return Results.success(sysRoleUser);
        }else{
            return Results.success();
        }
    }
}
