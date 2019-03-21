package com.jk.intercepors;

import com.jk.bean.UserBean;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class LoginStopController implements HandlerInterceptor {

    /**
     * 整个请求完成调用
     */
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     *   进controller方法之后调用
     */
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        // TODO Auto-generated method stub

    }

    /**
     * 进controller方法之前调用
     */
    public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
        UserBean user = (UserBean) arg0.getSession().getAttribute("user");
        if(user!=null){
            return true;
        }
        //转发到登录请求
        System.out.println("拦截成功");
        arg0.getRequestDispatcher("login.jsp").forward(arg0, arg1);
        return false;
    }
}