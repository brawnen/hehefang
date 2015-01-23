<%@page import="com.afd.common.util.PropertyUtils"%>
<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="my" uri="http://my.function.com/tags"%>

<%	
	request.setAttribute("ctx", request.getContextPath()); 
	PropertyUtils.setRequestProperties(request);
%>
