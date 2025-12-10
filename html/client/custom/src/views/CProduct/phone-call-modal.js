define('custom:views/CProduct/phone-call-modal', ['views/modal'], function (Dep) {

    return Dep.extend({
        className: 'phone-call-modal',
        template: 'custom:CProduct/phone-call-modal',

        backdrop: true, // Quan trọng: enable backdrop

        data: function () {
            return {
                phoneNumber: this.phoneNumber,
                // value: this.model.get(this.name),
                // callioEnabled: this.callioEnabled && this.callioConfigured
                callioEnabled: this.callioEnabled
            };
        },
        events: _.extend({
            'click [data-action="callViaCallIO"]': function () {
                // this.trigger('call:via:callio', {
                //     phoneNumber: this.options.phoneNumber
                // });
                this.makeCall();
                this.close();
            },
            'click [data-action="closeModal"]': function () {
                this.close();
            }
        }, Dep.prototype.events),

        setup: function () {
            Dep.prototype.setup.call(this);
            // Cho phép đóng khi click backdrop
            this.backdrop = true; // hoặc 'static' nếu không muốn đóng khi click backdrop
            this.callioEnabled = false;
            this.phoneNumber = this.options.phoneNumber;
            // this.callioConfigured = false;
            this.checkCallioStatus();
        },

        checkCallioStatus: function () {
            console.log("test config 123");

            return Espo.Ajax.getRequest('CallioCall/action/configStatus')
                .then(response => {
                    if (response.success && response.data) {
                        this.callioEnabled = response.data.enabled;
                        // this.callioConfigured = response.data.configured;
                    }
                })
                .catch(error => {
                    console.log('Callio status check error:', error);
                })
                .then(() => this.reRender());;
        },

        makeCall: function () {
            if (!this.callioEnabled) {
                Espo.Ui.error('Callio is not configured');
                return;
            }

            const phoneNumber = this.phoneNumber;
            console.log(phoneNumber);
            
            if (!phoneNumber) {
                Espo.Ui.error('Phone number is empty');
                return;
            }

            Espo.Ui.notify('Initiating call...');

            // const entityType = this.model.name || 'Product';
            // const entityId = this.model.id;
            // const entityName = this.model.get('name');

            Espo.Ajax.postRequest('CallioCall/action/initiate', {
                phoneNumber: phoneNumber,
                // entityType: entityType,
                // recordId: entityId,
                // additionalData: {
                //     productName: entityName
                // }
            })
                .then(response => {
                    if (response.success) {
                        Espo.Ui.success('Call initiated successfully');

                        // Reload call history sau 1 giây
                        setTimeout(() => {
                            this.showCallHistory();
                        }, 1000);
                    } else {
                        Espo.Ui.error(response.error || 'Failed to initiate call');
                    }
                })
                .catch(error => {
                    Espo.Ui.error('Error calling Callio');
                    console.error('Call error:', error);
                });
        },

        afterRender: function () {
            Dep.prototype.afterRender.call(this);
            var self = this;
            setTimeout(function () {
                var $backdrop = $('body > .modal-backdrop');
                if ($backdrop.length > 0) {
                    // Unbind event cũ trước khi bind lại (tránh multiple listeners)
                    $backdrop.off('click');

                    // Bind event click vào backdrop để đóng modal
                    $backdrop.on('click', function (e) {
                        self.close();
                    });
                }
            }, 100);
        }
    });
});