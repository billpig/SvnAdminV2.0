import Vue from 'vue';
import ViewUI from 'view-design';
import VueRouter from 'vue-router';
import Routers from './router';
import Util from './libs/util';
import App from './app.vue';
import 'view-design/dist/styles/iview.css';

/**
 * 以下为手动安装配置的依赖
 * 通过 Vue.prototype.$name 的方式 使$name在所有的Vue实例中可用
 */
//http请求 -> axios
import axios from 'axios';
Vue.prototype.$axios = axios;

import VueClipboard from 'vue-clipboard2'
Vue.use(VueClipboard)

Vue.use(VueRouter);
Vue.use(ViewUI);

// import streamSaver from 'streamsaver'

// 路由配置
const RouterConfig = {
    mode: 'hash',
    routes: Routers
};
const router = new VueRouter(RouterConfig);

//路由拦截器 beforeEach
router.beforeEach((to, from, next) => {
    ViewUI.LoadingBar.start();
    Util.title(to.meta.title);
    //页面跳转逻辑
    next();
    // if (to.matched.some(m => m.meta.requireAuth)) {
    //     if (window.sessionStorage.token) {
    //         if (to.path == '/login') {
    //             next({ path: '/residentManage' })
    //         } else {
    //             next();
    //         }
    //     } else {
    //         next({ path: '/login' })
    //     }
    // } else if (to.path == '/login' && window.sessionStorage.token) {
    //     next({ path: '/residentManage' })
    // }
    // else {
    //     next();
    // }
});

//路由拦截器 afterEach
router.afterEach((to, from, next) => {
    ViewUI.LoadingBar.finish();
    window.scrollTo(0, 0);
});

/**
 * 请求拦截器
 */
axios.interceptors.request.use(function (config) {
    if (window.sessionStorage.token) {
        //将token加入到请求头
        config.headers.common['token'] = window.sessionStorage.token;
    }
    return config
}, function (error) {
    return Promise.reject(error);
});

/**
 * 响应拦截器
 */
axios.interceptors.response.use(function (response) {
    if (response.data.code != undefined && response.data.code != '') {
        if (response.data.code != 200) {
            sessionStorage.removeItem('token');
            sessionStorage.removeItem('user_name');
            sessionStorage.removeItem('user_role_id');
            sessionStorage.removeItem('user_role_name');
            router.push('/');
        }
    }
    return response;
}, function (error) {
    return Promise.reject(error);
});

new Vue({
    el: '#app',
    router: router,
    render: h => h(App)
});
