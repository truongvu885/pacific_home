define('custom:views/CProduct/record/list', ['views/record/list'], function (Dep) {

    return Dep.extend({
        setup: function () {
            Dep.prototype.setup.call(this);
        },

        afterRender: function () {
            Dep.prototype.afterRender.call(this);

            // Unbind event cũ trước khi bind lại
            this.$el.off('click', 'td.cell[data-name="phoneNumber"] a');

            // Bind custom event sau khi parent render xong
            this.$el.on('click', 'td.cell[data-name="phoneNumber"] a', function (e) {
                e.preventDefault();
                e.stopPropagation();
                this.testClick();
                var phoneNumber = $(e.currentTarget).text();
                // this.showPhoneOptionsModal(phoneNumber);
            }.bind(this));

            this.addActionColumnHeader();
        },

        addActionColumnHeader: function () {
            var $actionHeader = this.$el.find('thead th:last-child');
            if ($actionHeader.length && !$actionHeader.find('.action-header-label').length) {
                var label = this.translate('Actions');
                $actionHeader.prepend('<span class="action-header-label">' + label + '</span> ');
            }
        },

        testClick: function () {
            console.log("test click in cell phone number");
        },

        // showPhoneOptionsModal: function (phoneNumber) {
        //     var self = this;

        //     this.createView('phoneModal', 'custom:views/CProduct/phone-call-modal', {
        //         phoneNumber: phoneNumber,
        //         model: this.model
        //     }, function (view) {
        //         view.render();
        //         self.listenTo(view, 'call:via:callio', function (data) {
        //             // self.callViaCallIO(data.phoneNumber);
        //         });
        //     });
        // },

    });
});