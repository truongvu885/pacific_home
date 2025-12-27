/************************************************************************
 * This file is part of EspoCRM.
 *
 * EspoCRM - Open Source CRM application.
 * Copyright (C) 2014-2024 Yurii Kuznietsov, Taras Machyshyn, Oleksii Avramenko
 * Website: https://www.espocrm.com
 ************************************************************************/

define('custom:views/login', ['views/login'], function (Dep) {
    
    /**
     * Custom Login View with Registration button
     */
    return Dep.extend({
        
        // Sử dụng custom template
        template: 'custom:login',
        
        // Data được pass vào template
        data: function () {
            return {
                logoSrc: this.getLogoSrc(),
                showForgotPassword: this.getConfig().get('passwordRecoveryEnabled'),
                // Có thể thêm data khác nếu cần
            };
        },
        
        // Khai báo events
        events: {
            'submit #login-form': function (e) {
                // Giữ nguyên logic login gốc
                this.login();
                e.preventDefault();
                return false;
            },
            'click [data-action="passwordChangeRequest"]': function () {
                // Giữ nguyên logic forgot password gốc
                this.showPasswordChangeRequest();
            },
            // EVENT MỚI: Click button đăng ký
            'click [data-action="register"]': function (e) {
                e.preventDefault();
                this.actionRegister();
            },
        },
        
        /**
         * Action khi click button đăng ký
         */
        actionRegister: function () {
            // Navigate đến trang đăng ký
            // this.getRouter().navigate('#UserRegistration/create', {trigger: true});
            
            // Hoặc có thể dùng:
            // window.location.href = '#UserRegistration/create';
            console.log("test action register");
            
        },
        
        /**
         * Override setup nếu cần thêm logic khởi tạo
         */
        setup: function () {
            Dep.prototype.setup.call(this);
            
            // Có thể thêm logic custom ở đây
            // Ví dụ: check nếu đã login thì redirect
            // if (this.getUser().isLoggedIn()) {
            //     this.getRouter().navigate('', {trigger: true});
            // }
        },
        
    });
});