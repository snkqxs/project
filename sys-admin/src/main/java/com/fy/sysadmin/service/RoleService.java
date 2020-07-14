package com.fy.sysadmin.service;

import com.fy.sysadmin.base.result.Results;
import com.fy.sysadmin.dto.RoleDto;
import com.fy.sysadmin.model.SysRole;

public interface RoleService {

	Results<SysRole> getAllRoles();

	Results<SysRole> getAllRolesByPage(Integer offset, Integer limit);

	Results<SysRole> save(RoleDto roleDto);

	SysRole getRoleById(Integer id);

	Results update(RoleDto roleDto);

	Results delete(Integer id);

	Results<SysRole> getRoleByFuzzyRoleNamePage(String roleName, Integer offset, Integer limit);
}
